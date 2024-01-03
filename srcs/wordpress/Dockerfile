FROM debian:bullseye

#WORDPRESS DOCKERFILE

RUN apt update && apt upgrade && apt install wget -y

RUN apt-get install -y php php-fpm php-mysql mariadb-client

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/script.sh /

RUN chmod +x script.sh

CMD ["/script.sh"]
