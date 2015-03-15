FROM php:5.6-fpm
MAINTAINER Gabriel Ignisca <gabriel@designjunkie.com>
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
        g++ \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libmemcached-dev \
        libicu-dev \
    && docker-php-ext-install iconv mcrypt intl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && pecl install memcached
CMD ["php-fpm"]
