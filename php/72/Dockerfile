FROM php:7.2.34-fpm-alpine
RUN apk update \
  && apk --no-cache add supervisor autoconf oniguruma-dev libxml2-dev build-base wget tzdata  \
  && docker-php-ext-install mysqli pdo_mysql mbstring bcmath exif pcntl sockets xmlrpc \
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
  && wget https://github.com/shirakun/DockerFile/raw/master/data/supervisor/conf/php-fpm.ini -O /etc/supervisor.d/php-fpm.ini \
  && wget https://github.com/shirakun/DockerFile/raw/master/data/supervisor/conf/crond.ini -O /etc/supervisor.d/crond.ini \
  && wget https://github.com/shirakun/DockerFile/raw/master/data/php/init.sh -O /init.sh \
  && chmod -R 0755 /init.sh \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && apk del autoconf oniguruma-dev libxml2-dev build-base wget tzdata \
  && echo 'Oh Shit Cache! 2020-11-01 20:57'


ENV SUPERVISOR_PATH=""
ENV CRON_FILE=""

CMD ["/bin/sh", "/init.sh"]
