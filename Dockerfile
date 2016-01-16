FROM php:5.6-apache
MAINTAINER taoxin<taoxincn@qq.com>
VOLUME /var/www/html
COPY . /var/www/html
# COPY config/php.ini /usr/local/etc/php/
RUN chown -R www-data /var/www/html
 && chgrp -R www-data /var/www/html
 && chmod -R 775 /var/www/html
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd
