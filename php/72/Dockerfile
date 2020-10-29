FROM php:7.2.34-fpm-alpine
RUN apk update
RUN apk --no-cache add supervisor git
RUN git clone -b php7 https://github.com/phpredis/phpredis.git /usr/src/php/ext/redis 
RUN docker-php-ext-install pdo_mysql mbstring redis
RUN apk del git
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer