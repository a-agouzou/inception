#!/bin/bash


sleep 10
# wp config create --allow-root --path='/var/www/wordpress'
cd /var/www/wordpress
mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
wp config set --allow-root DB_NAME ${WORDPRESS_DB_NAME} --path='/var/www/wordpress'
wp config set --allow-root DB_USER ${WORDPRESS_DB_USER} --path='/var/www/wordpress'
wp config set --allow-root DB_PASSWORD ${WORDPRESS_DB_PASSWORD} --path='/var/www/wordpress'
wp config set --allow-root DB_HOST "mariadb:3306" --path='/var/www/wordpress'
wp core install --allow-root --url="http://localhost" --title="Your Site Title" --admin_user="admin" --admin_password="admin_password" --admin_email="admin@example.com"
mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F