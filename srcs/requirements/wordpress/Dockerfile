FROM debian:bullseye

RUN apt update && apt upgrade && apt install wget -y

RUN apt-get install -y php php-fpm php-mysql mariadb-client

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY tools/script.sh /

RUN chmod +x script.sh

CMD ["/script.sh"]
