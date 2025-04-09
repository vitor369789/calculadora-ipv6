# Calculadora IPv6

Uma calculadora IPv6 que permite calcular endereços e sub-redes IPv6. Disponível em duas versões:

## Versão Web (Docker)

### Pré-requisitos
- Docker
- Docker Compose

### Instalação e Execução

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/calculadora-ipv6.git
cd calculadora-ipv6
```

2. Inicie o container:
```bash
docker-compose up -d
```

3. Acesse a aplicação em `http://localhost`

### Configuração SSL (Opcional)

1. Configure seu domínio:
   - Aponte seu domínio para o IP do seu servidor
   - Edite o arquivo `nginx.conf` e substitua `seu-dominio.com` pelo seu domínio real

2. Configure o SSL:
   ```bash
   # Dê permissão de execução ao script
   chmod +x init-ssl.sh
   
   # Execute o script
   ./init-ssl.sh seu-dominio.com
   ```

### Comandos Docker Úteis
```bash
# Ver logs
docker-compose logs -f

# Reiniciar serviços
docker-compose restart

# Parar serviços
docker-compose down
```

### Instalação Manual

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

## Versão Portátil para Windows

### Download
Baixe o arquivo `Calculadora-IPv6.exe` da seção [Releases](https://github.com/seu-usuario/calculadora-ipv6/releases).

### Execução
1. Execute o arquivo `Calculadora-IPv6.exe`
2. A aplicação abrirá automaticamente no seu navegador padrão
3. Para fechar, simplesmente feche a janela do terminal

### Características
- Não requer instalação
- Roda localmente na porta 5000
- Mantém todas as funcionalidades da versão web

## Funcionalidades

- Cálculo de endereços IPv6
- Exibição do endereço completo e comprimido
- Divisão em blocos para melhor visualização
- Cálculo de sub-redes
- Botões para copiar endereços
- Interface responsiva e intuitiva

## Desenvolvimento

### Estrutura do Projeto
```
calculadora-ipv6/
├── app.py                 # Aplicação Flask
├── templates/            # Templates HTML
├── static/              # Arquivos estáticos (CSS)
├── docker-compose.yml   # Configuração Docker
├── nginx.conf           # Configuração Nginx
├── init-ssl.sh         # Script para configuração SSL
├── install.ps1         # Script de instalação Windows
├── install.sh          # Script de instalação Linux
└── portable-windows/   # Versão portátil para Windows
    ├── app.py
    ├── templates/
    ├── static/
    ├── build.bat
    └── build.ps1
```

### Requisitos de Desenvolvimento
- Python 3.11+
- Flask 1.1.4
- Outras dependências em `requirements.txt`

### Build da Versão Portátil

1. Entre na pasta `portable-windows`:
```bash
cd portable-windows
```

2. Execute o script de build:
```bash
# Windows (PowerShell)
.\build.ps1

# Windows (CMD)
build.bat
```

### Modo Produção com PM2

1. Instale o PM2:
```bash
npm install -g pm2
pm2 install pm2-python
```

2. Inicie a aplicação:
```bash
pm2 start ecosystem.config.js
```

3. Comandos úteis:
```bash
# Ver status
pm2 status

# Ver logs
pm2 logs calculadora-ipv6

# Reiniciar
pm2 restart calculadora-ipv6

# Configurar início automático
pm2 startup
pm2 save
```

## Tecnologias Utilizadas

- Python 3.11+
- Flask 1.1.4
- HTML5/CSS3/JavaScript
- Docker e Docker Compose
- Nginx (para produção)
- PM2 (para produção)
- Let's Encrypt (SSL)
- PyInstaller (versão portátil)

## Contribuindo

1. Fork o projeto
2. Crie sua Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.
