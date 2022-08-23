FROM debian:10.12

ARG WWW_DIR

RUN apt-get -y update \
	&& apt-get install -y wget php php-fpm php-mysqli mariadb-client \
	&& mkdir -p ${WWW_DIR}/html/ \
	&& mkdir -p /run/php/

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod u+x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \
	&& wp core download --locale=en_US --path=${WWW_DIR}/html --allow-root \
	&& adduser --disabled-password --gecos "" nginx && chown -R nginx:nginx ${WWW_DIR}

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY ./conf/wp-config.php ${WWW_DIR}/html/

#COPY ./tools/index.html ${WWW_DIR}/html/

COPY ./tools/init.sh ${WWW_DIR}/html/

WORKDIR ${WWW_DIR}/html/

EXPOSE 9000

ENTRYPOINT ["bash", "init.sh"]
