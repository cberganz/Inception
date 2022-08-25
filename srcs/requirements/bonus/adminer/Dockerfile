FROM debian:10.12

RUN apt-get -y update \
	&& apt-get install -y wget php php-fpm php-common php-json php-gd php-curl php-xml php-mysql php-imap php-cgi php-soap php-xmlrpc php-gettext php-ldap \
	&& wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" \
	&& mkdir -p /var/www/html \
	&& mv adminer-4.8.1.php /var/www/html/index.php \
	&& chown -R www-data:www-data /var/www/html/index.php \
	&& chmod 755 /var/www/html/index.php

CMD ["php", "-S", "localhost:8080", "-f", "/var/www/html/index.php"]
