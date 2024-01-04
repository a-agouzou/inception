#!/bin/bash
service mariadb start

echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB_NAME};" > queries.sql
echo "CREATE USER IF NOT EXISTS '${MYSQL_DB_USER}'@'%' IDENTIFIED BY '${MYSQL_DB_PASSWORD}';" >>  queries.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_DB_USER}'@'%' IDENTIFIED BY '${MYSQL_DB_PASSWORD}';" >>  queries.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> queries.sql
echo "FLUSH PRIVILEGES;" >> queries.sql

mysql < queries.sql

mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
exec mysqld_safe