#!/bin/bash

# Substitua pelo seu domínio
DOMAIN="seu-dominio.com"
EMAIL="seu-email@exemplo.com"

# Criar diretórios necessários
mkdir -p certbot/conf
mkdir -p certbot/www

# Iniciar nginx
docker-compose up -d nginx

# Aguardar nginx iniciar
echo "Aguardando nginx iniciar..."
sleep 5

# Obter certificado SSL
docker-compose run --rm certbot certonly \
    --webroot \
    --webroot-path /var/www/certbot \
    --email $EMAIL \
    --agree-tos \
    --no-eff-email \
    -d $DOMAIN \
    -d www.$DOMAIN

# Gerar parâmetros DH
docker-compose run --rm certbot openssl dhparam -out /etc/letsencrypt/ssl-dhparams.pem 2048

# Ativar configuração SSL no nginx
sed -i 's/#\s*listen 443/listen 443/' nginx.conf
sed -i 's/#\s*ssl_certificate/ssl_certificate/' nginx.conf
sed -i 's/#\s*include \/etc\/letsencrypt/include \/etc\/letsencrypt/' nginx.conf
sed -i 's/#\s*ssl_dhparam/ssl_dhparam/' nginx.conf

# Reiniciar nginx para aplicar as mudanças
docker-compose restart nginx

echo "Configuração SSL concluída!"
echo "Seu site está disponível em https://$DOMAIN"
