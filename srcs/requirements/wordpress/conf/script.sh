#!/bin/bash

sleep 10

wget -P /var/www https://wordpress.org/latest.tar.gz
cd /var/www && tar -xzf /var/www/latest.tar.gz && rm /var/www/latest.tar.gz
mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
chown -R root:root /var/www/wordpress

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


wp config set --allow-root DB_NAME ${MYSQL_DB_NAME} --path='/var/www/wordpress'
wp config set --allow-root DB_USER ${MYSQL_DB_USER} --path='/var/www/wordpress'
wp config set --allow-root DB_PASSWORD ${MYSQL_DB_PASSWORD} --path='/var/www/wordpress'
wp config set --allow-root DB_HOST "mariadb:3306" --path='/var/www/wordpress'
wp core install --allow-root --url="aagouzou.42.fr" --title="aagouzou" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} \
    --admin_email="aagouzou1337@gmail.com" --skip-email --path='/var/www/wordpress'
wp user create --allow-root ${WP_USER_NAME} abdo@aagouzou.42.fr --role=author --user_pass=${WP_USER_PASS} --path='/var/www/wordpress'
mkdir -p /run/php
#used to start the PHP FastCGI Process Manager (PHP-FPM) in foreground
/usr/sbin/php-fpm7.4 -F