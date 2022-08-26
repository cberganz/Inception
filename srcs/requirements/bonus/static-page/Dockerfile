FROM debian:10.12

RUN apt-get -y update \
	&& apt-get -y install php php-fpm php-common php-json php-gd php-curl php-xml php-mysql php-imap php-cgi php-soap php-xmlrpc php-gettext php-ldap \
	&& mkdir -p /var/www/html

COPY ./tools/* /var/www/html/

RUN chown -R www-data:www-data /var/www/html/* \
	&& chmod 755 /var/www/html/*

CMD ["php", "-S", "localhost:80"]
