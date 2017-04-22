#!/bin/sh

ARGS=$@

rm /var/www/html/.DS_Store

if [ ! "$(ls -A /var/www/html)" ]; then
    echo "Web directory empty, cloning SmartVISU from GIT $SHNG_SMARTVISU_BRANCH branch..."
    git clone https://github.com/Martin-Gleiss/smartvisu.git --single-branch --branch $SHNG_SMARTVISU_BRANCH /var/www/html
fi

chown -R nginx:www-data /var/www/html
chmod g+w /var/www/html
chmod g+w /var/www/html/temp

if [ ! -z "$SHNG_PHP_CONTAINER" ]; then
    sed -i "s/fastcgi_pass.*/fastcgi_pass $SHNG_PHP_CONTAINER:9000;/g" /etc/nginx/conf.d/default.conf
fi

php-fpm -D
nginx -g 'daemon off;' $ARGS

