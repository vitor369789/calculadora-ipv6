# Criar ambiente virtual
python -m venv venv
.\venv\Scripts\Activate.ps1

# Instalar dependências
pip install -r requirements.txt

# Criar executável com PyInstaller
pyinstaller --onefile --add-data "templates;templates" --name "Calculadora-IPv6" app.py

# Limpar arquivos temporários
Remove-Item -Recurse -Force build
Remove-Item -Force "Calculadora-IPv6.spec"

# Mover o executável para a pasta atual
Move-Item -Force "dist\Calculadora-IPv6.exe" "."
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
