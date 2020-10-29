FROM php:7.2.34-fpm-alpine
RUN apk update
RUN apk --no-cache add supervisor
RUN docker-php-ext-install pdo_mysql
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer