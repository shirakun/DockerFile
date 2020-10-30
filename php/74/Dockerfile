FROM php:7.4.11-fpm-alpine
RUN apk update \
  && apk --no-cache add supervisor autoconf oniguruma-dev libxml2-dev build-base wget \
  && docker-php-ext-install pdo_mysql mbstring bcmath exif pcntl sockets xmlrpc \
  && pecl install -o -f redis \
  && rm -rf /tmp/pear \
  && docker-php-ext-enable redis \
  && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer \
  && mkdir -p /etc/supervisor.d/ \
  && chmod -R 0755 /etc/supervisor.d \
  && wget https://github.com/shirakun/DockerFile/raw/master/data/supervisor/supervisor.conf -O /etc/supervisord.conf \
  && wget https://github.com/shirakun/DockerFile/raw/master/data/supervisor/conf/php-fpm.conf -O /etc/supervisor.d/php-fpm.conf \
  && apk del autoconf oniguruma-dev libxml2-dev build-base wget \

CMD ['supervisord']
