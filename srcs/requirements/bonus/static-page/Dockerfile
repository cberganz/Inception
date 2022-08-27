FROM debian:10.12

RUN apt-get -y update \
#	&& apt-get -y install php php-fpm php-common php-json php-gd php-curl php-xml php-mysql php-imap php-cgi php-soap php-xmlrpc php-gettext php-ldap \
	&& apt-get install -y php php-phar php-fpm php-common php-iconv php-json php-gd php-curl php-xml php-mysqli php-imap php-cgi php-soap php-xmlrpc php-posix php-gettext php-ldap php-ctype php-dom \
	&& mkdir -p /var/www/static-page

COPY ./tools/index.html /var/www/static-page/

RUN adduser --disabled-password --gecos "" static-page \
	&& chown -R static-page:static-page /var/www/static-page \
	&& touch /var/log/php7.3-fpm.log \
	&& chown -R static-page:static-page /var/log/php7.3-fpm.log \
	&& service php7.3-fpm start \
	&& chown -R static-page:static-page /run/php

COPY www.conf /etc/php/7.3/fpm/pool.d/

USER static-page

RUN php-fpm7.3 --test

WORKDIR /var/www/static-page

EXPOSE 9000

CMD ["php-fpm7.3", "-F"]
