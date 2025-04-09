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

1. Configure seu domínio no arquivo `docker-compose.yml`
2. Execute o script de inicialização SSL:
```bash
./init-ssl.sh seu-dominio.com
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

## Contribuindo

1. Fork o projeto
2. Crie sua Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.
