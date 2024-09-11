FROM php:8.2-fpm-alpine

WORKDIR /var/www/html

COPY src .
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y libgd-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libicu-dev g++

RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y libjpeg62-turbo-dev

RUN docker-php-ext-configure intl && docker-php-ext-install intl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && docker-php-ext-install gd
# Instalando extensões necessárias do PHP
RUN apk add --no-cache mysql-client msmtp perl wget procps shadow libzip libpng libjpeg-turbo libwebp freetype icu

RUN apk add --no-cache --virtual build-essentials \
    icu-dev icu-libs zlib-dev g++ make automake autoconf libzip-dev \
    libpng-dev libwebp-dev libjpeg-turbo-dev freetype-dev && \
    docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-install gd && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install intl && \
    docker-php-ext-install bcmath && \
    docker-php-ext-install opcache && \
    docker-php-ext-install exif && \
    docker-php-ext-install zip && \
    docker-php-ext-install bcmath && \
    docker-php-ext-install ctype && \
    docker-php-ext-install fileinfo && \
    docker-php-ext-install ldap && \
    docker-php-ext-install soap && \
    docker-php-ext-install exif && \
    apk del build-essentials && rm -rf /usr/src/php*

RUN apk add --no-cache pcre-dev $PHPIZE_DEPS \
        && pecl install redis \
        && docker-php-ext-enable redis.so
RUN apt-get update -y
RUN apt-get install cron -y
RUN apt-get install supervisor -y
RUN apt-get install -y nano

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN chown -R laravel /var/www/html
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-c","/etc/supervisor/supervisord.conf"]

USER laravel
