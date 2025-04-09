# Verificar se o Python está instalado
$pythonCmd = Get-Command python -ErrorAction SilentlyContinue
if (-not $pythonCmd) {
    Write-Host "Python não encontrado. Instalando Python..."
    # Baixar Python
    $url = "https://www.python.org/ftp/python/3.11.0/python-3.11.0-amd64.exe"
    $output = "$PSScriptRoot\python-installer.exe"
    Invoke-WebRequest -Uri $url -OutFile $output
    
    # Instalar Python
    Start-Process -FilePath $output -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1" -Wait
    Remove-Item $output
    
    # Atualizar PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# Verificar se o Node.js está instalado (necessário para PM2)
$nodeCmd = Get-Command node -ErrorAction SilentlyContinue
if (-not $nodeCmd) {
    Write-Host "Node.js não encontrado. Instalando Node.js..."
    # Baixar Node.js
    $url = "https://nodejs.org/dist/v18.16.0/node-v18.16.0-x64.msi"
    $output = "$PSScriptRoot\node-installer.msi"
    Invoke-WebRequest -Uri $url -OutFile $output
    
    # Instalar Node.js
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i", $output, "/quiet", "/norestart" -Wait
    Remove-Item $output
    
    # Atualizar PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# Criar ambiente virtual Python
Write-Host "Criando ambiente virtual..."
python -m venv venv
. .\venv\Scripts\Activate.ps1

# Instalar dependências Python
Write-Host "Instalando dependências Python..."
pip install -r requirements.txt

# Instalar PM2 globalmente
Write-Host "Instalando PM2..."
npm install -g pm2
pm2 install pm2-python

# Iniciar aplicação com PM2
Write-Host "Iniciando aplicação..."
pm2 start ecosystem.config.js

# Configurar PM2 para iniciar com o Windows
Write-Host "Configurando PM2 para iniciar com o Windows..."
pm2 startup
pm2 save

Write-Host "Instalação concluída!"
Write-Host "A aplicação está rodando em http://localhost:5000"
Write-Host "Para verificar o status, use: pm2 status"
Write-Host "Para ver os logs, use: pm2 logs calculadora-ipv6"
