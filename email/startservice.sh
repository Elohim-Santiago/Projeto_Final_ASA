#!/bin/bash

echo "Iniciando Postfix"
if ! systemctl start postfix; then
    echo "Erro ao iniciar o Postfix"
    exit 1
fi

echo "Iniciando Dovecot"
if ! systemctl start dovecot; then
    echo "Erro ao iniciar o Dovecot"
    exit 1
fi

echo "Criando usuário elohim"
useradd -c 'elohim' -m -s /bin/false elohim
echo "elohim:123" | chpasswd

echo "Ajustando permissões"
chmod 755 -R /var/www/html/rainloop/
chown -R www-data:www-data /var/www/html/rainloop/data

echo "Reiniciando Apache2"
if ! systemctl restart apache2; then
    echo "Erro ao reiniciar o Apache2"
    exit 1
fi

echo "Script concluído"
