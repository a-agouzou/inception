FROM debian:bullseye

#WORDPRESS DOCKERFILE
ENV WORDPRESS_DB_NAME="wp_db"
ENV WORDPRESS_DB_USER="abdo"
ENV WORDPRESS_DB_PASSWORD="12345"

RUN apt update && apt upgrade -y && apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh /

RUN chmod +x /script.sh

CMD ["./script.sh"]