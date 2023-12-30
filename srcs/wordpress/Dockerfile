FROM debian:bullseye

#WORDPRESS DOCKERFILE
ENV WORDPRESS_DB_NAME="wp_db"
ENV WORDPRESS_DB_USER="abdo"
ENV WORDPRESS_DB_PASSWORD="12345"
ENV ROOT_PS="12345"

RUN apt update && apt upgrade && apt install wget -y

RUN apt-get install -y php php-fpm php-mysql mariadb-client

RUN wget -P /var/www https://wordpress.org/latest.tar.gz

RUN cd /var/www && tar -xzf /var/www/latest.tar.gz && rm /var/www/latest.tar.gz

# RUN mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

RUN	chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp


COPY conf/script.sh /

RUN chmod +x script.sh

CMD ["/script.sh"]
