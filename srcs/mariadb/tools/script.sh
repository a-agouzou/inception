#!/bin/bash
mysql_install_db
service mariadb start


mysql -e "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};"
mysql -e "CREATE USER IF NOT EXISTS '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PS}';"
mysql -u root -p"${ROOT_PS}" -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p"${ROOT_PS}" shutdown
exec mysqld_safe




