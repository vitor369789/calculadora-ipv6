# Criar ambiente virtual
python -m venv venv

# Ativar o ambiente virtual
.\venv\Scripts\Activate.ps1

# Instalar dependências
.\venv\Scripts\python.exe -m pip install -r requirements.txt

# Criar o executável
.\venv\Scripts\python.exe -m PyInstaller --onefile --add-data "templates;templates" --add-data "static;static" --name "Calculadora-IPv6" app.py

# Limpar arquivos temporários
if (Test-Path "build") {
    Remove-Item -Recurse -Force build
}

if (Test-Path "Calculadora-IPv6.spec") {
    Remove-Item -Force "Calculadora-IPv6.spec"
}

# Mover o executável para o diretório atual
Move-Item -Force "dist\Calculadora-IPv6.exe" "."

# Remover diretório dist
Remove-Item -Recurse -Force dist

# Criar arquivo README
@"
# Calculadora IPv6 Portátil

Esta é a versão portátil da Calculadora IPv6 para Windows.

## Como usar

1. Execute o arquivo 'Calculadora-IPv6.exe'
2. Seu navegador padrão abrirá automaticamente com a calculadora
3. Digite um endereço IPv6 com prefixo (exemplo: 2001:db8::/32)
4. Opcionalmente, especifique um novo prefixo para calcular sub-redes
5. Clique em 'Calcular' para ver os resultados

## Observações

- A aplicação roda localmente na porta 5000
- Não requer instalação
- Para fechar, simplesmente feche a janela do terminal
"@ | Out-File -FilePath "README.txt" -Encoding utf8

# Limpar ambiente virtual
deactivate
Remove-Item -Recurse -Force venv

Write-Host "`nBuild concluído! O executável 'Calculadora-IPv6.exe' foi criado.`n"
