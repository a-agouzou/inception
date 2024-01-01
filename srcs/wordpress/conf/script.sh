#!/bin/bash

sleep 10
wget -P /var/www https://wordpress.org/latest.tar.gz
cd /var/www && tar -xzf /var/www/latest.tar.gz && rm /var/www/latest.tar.gz
mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
chown -R root:root /var/www/wordpress

wp config set --allow-root DB_NAME ${WORDPRESS_DB_NAME} --path='/var/www/wordpress'
wp config set --allow-root DB_USER ${WORDPRESS_DB_USER} --path='/var/www/wordpress'
wp config set --allow-root DB_PASSWORD ${WORDPRESS_DB_PASSWORD} --path='/var/www/wordpress'
wp config set --allow-root DB_HOST "mariadb:3306" --path='/var/www/wordpress'
wp user create --allow-root bob bob@example.com --role=author --user_pass="ma.aagouzou" --path='/var/www/wordpress'
wp core install --allow-root --url="localhost" --title="aagouzou site" --admin_user="aagouzou" --admin_password="conima" --admin_email="admin@example.com" --path='/var/www/wordpress'
mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F