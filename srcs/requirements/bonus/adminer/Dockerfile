FROM debian:buster

RUN apt-get -y update \
	&& apt-get install -y php php-phar php-fpm php-common php-iconv php-json php-gd php-curl php-xml php-mysqli php-imap php-cgi php-soap php-xmlrpc php-posix php-gettext php-ldap php-ctype php-dom

ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php /var/www/adminer/index.php

RUN adduser --disabled-password --gecos "" adminer \
	&& chown -R adminer:adminer /var/www/adminer \
	&& touch /var/log/php7.3-fpm.log \
	&& chown -R adminer:adminer /var/log/php7.3-fpm.log \
	&& service php7.3-fpm start \
	&& chown -R adminer:adminer /run/php

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

USER adminer

WORKDIR /var/www/adminer

EXPOSE 9000

CMD ["php-fpm7.3", "-F"]
