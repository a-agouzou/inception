#!/bin/bash
service mariadb start

# mysql -e "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};"
# mysql -e "CREATE USER IF NOT EXISTS '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PS}';"
# mysql -u root -p"${ROOT_PS}" -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p"${ROOT_PS}" shutdown
# exec mysqld_safe


echo "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};" > queries.sql
echo "CREATE USER IF NOT EXISTS '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';" >>  queries.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';" >>  queries.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PS}';" >> queries.sql
echo "FLUSH PRIVILEGES;" >> queries.sql

mysql < queries.sql

mysqladmin -u root -p"${ROOT_PS}" shutdown
exec mysqld_safe