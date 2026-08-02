FROM debian:12

WORKDIR /www

EXPOSE 9000

RUN apt-get update && \
    apt-get install -y \
        php-fpm \
        php-mysql \
        php-mbstring \
        php-bcmath \
        php-zip \
        php-gd \
        php-curl \
        php-xml \
        mariadb-client \
        curl && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY conf.sh /usr/local/bin

RUN chmod +x /usr/local/bin/conf.sh

RUN sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/8.2/fpm/pool.d/www.conf


CMD ["/usr/local/bin/conf.sh"]
