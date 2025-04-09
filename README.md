# Calculadora IPv6

Uma aplicação web simples e eficiente para calcular e analisar endereços IPv6.

## Funcionalidades

- Expansão de endereços IPv6
- Divisão em blocos para fácil visualização
- Cálculo de sub-redes
- Visualização do endereço comprimido e expandido
- Botões de cópia rápida para todos os valores
- Interface responsiva e intuitiva

## Opções de Instalação

### 1. Instalação Automática

#### Windows
```powershell
# Execute o PowerShell como administrador e rode:
Set-ExecutionPolicy Bypass -Scope Process -Force
.\install.ps1
```

#### Linux
```bash
# Dê permissão de execução ao script
chmod +x install.sh

# Execute como root
sudo ./install.sh
```

### 2. Docker

#### Configuração com Domínio e SSL (Recomendado para Produção)

1. Configure seu domínio:
   - Aponte seu domínio para o IP do seu servidor
   - Edite o arquivo `nginx.conf` e substitua `seu-dominio.com` pelo seu domínio real

2. Configure o SSL:
   ```bash
   # Dê permissão de execução ao script
   chmod +x init-ssl.sh
   
   # Edite o script com seu domínio e email
   nano init-ssl.sh
   
   # Execute o script
   ./init-ssl.sh
   ```

3. Inicie os serviços:
   ```bash
   docker-compose up -d
   ```

4. Comandos úteis:
   ```bash
   # Ver logs
   docker-compose logs -f
   
   # Reiniciar serviços
   docker-compose restart
   
   # Parar serviços
   docker-compose down
   ```

#### Usando Docker Localmente
```bash
# Construir e iniciar o container
docker-compose up -d

# Ver logs
docker-compose logs -f

# Parar o container
docker-compose down
```

#### Usando Docker diretamente
```bash
# Construir a imagem
docker build -t calculadora-ipv6 .

# Executar o container
docker run -d -p 80:5000 --name calculadora-ipv6 calculadora-ipv6

# Ver logs
docker logs -f calculadora-ipv6

# Parar o container
docker stop calculadora-ipv6
```

### 3. Instalação Manual

#### Instalação
```bash
# Clone o repositório
git clone https://github.com/seu-usuario/calculadora-ipv6.git

# Entre no diretório
cd calculadora-ipv6

# Instale as dependências
pip install -r requirements.txt
```

#### Execução

##### Modo Desenvolvimento
```bash
python app.py
```

##### Modo Produção com PM2

1. Primeiro, instale o PM2 se ainda não tiver instalado:
```bash
npm install -g pm2
```

2. Instale o módulo PM2 para Python:
```bash
pm2 install pm2-python
```

3. Inicie a aplicação com PM2:
```bash
pm2 start ecosystem.config.js
```

4. Comandos úteis do PM2:
```bash
# Ver status da aplicação
pm2 status

# Ver logs
pm2 logs calculadora-ipv6

# Reiniciar aplicação
pm2 restart calculadora-ipv6

# Parar aplicação
pm2 stop calculadora-ipv6

# Remover aplicação do PM2
pm2 delete calculadora-ipv6

# Configurar para iniciar com o sistema
pm2 startup
pm2 save
```

## Como Usar

1. Digite um endereço IPv6 com prefixo (exemplo: `2001:db8::/32`)
2. Opcionalmente, especifique um novo prefixo para calcular sub-redes
3. Clique em "Calcular" para ver os resultados

## Tecnologias Utilizadas

- Python 3
- Flask
- HTML5
- CSS3
- JavaScript
- PM2 (para produção)
- Docker (opcional)
- Nginx (para produção com domínio)
- Let's Encrypt (SSL)
