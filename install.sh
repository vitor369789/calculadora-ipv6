#!/bin/bash

# Verificar se o script está sendo executado como root
if [ "$EUID" -ne 0 ]
  then echo "Por favor, execute como root (sudo ./install.sh)"
  exit
fi

# Instalar dependências do sistema
echo "Instalando dependências do sistema..."
if [ -f /etc/debian_version ]; then
    # Debian/Ubuntu
    apt-get update
    apt-get install -y python3 python3-venv python3-pip nodejs npm
elif [ -f /etc/redhat-release ]; then
    # CentOS/RHEL
    dnf install -y python3 python3-pip nodejs npm
fi

# Criar usuário de serviço
echo "Criando usuário de serviço..."
useradd -r -s /bin/false calculadora-ipv6

# Criar diretório da aplicação
echo "Configurando diretório da aplicação..."
mkdir -p /opt/calculadora-ipv6
cp -r . /opt/calculadora-ipv6/
chown -R calculadora-ipv6:calculadora-ipv6 /opt/calculadora-ipv6

# Criar ambiente virtual Python
echo "Criando ambiente virtual..."
cd /opt/calculadora-ipv6
python3 -m venv venv
source venv/bin/activate

# Instalar dependências Python
echo "Instalando dependências Python..."
pip install -r requirements.txt

# Instalar PM2 globalmente
echo "Instalando PM2..."
npm install -g pm2
pm2 install pm2-python

# Criar serviço systemd
echo "Criando serviço systemd..."
cat > /etc/systemd/system/calculadora-ipv6.service << EOL
[Unit]
Description=Calculadora IPv6
After=network.target

[Service]
Type=forking
User=calculadora-ipv6
WorkingDirectory=/opt/calculadora-ipv6
Environment=PATH=/opt/calculadora-ipv6/venv/bin:/usr/bin:/bin
ExecStart=/usr/bin/pm2 start ecosystem.config.js
ExecReload=/usr/bin/pm2 reload calculadora-ipv6
ExecStop=/usr/bin/pm2 stop calculadora-ipv6
Restart=always

[Install]
WantedBy=multi-user.target
EOL

# Recarregar systemd e iniciar serviço
systemctl daemon-reload
systemctl enable calculadora-ipv6
systemctl start calculadora-ipv6

echo "Instalação concluída!"
echo "A aplicação está rodando em http://localhost:5000"
echo "Para verificar o status: systemctl status calculadora-ipv6"
echo "Para ver os logs: journalctl -u calculadora-ipv6"
