FROM debian:10.12

RUN apt-get -y update \
	&& apt-get install -y mariadb-server mariadb-client

RUN	mkdir -p /var/lib/mysql/run \
	&& mkdir -p /run/mysqld \
	&& mkdir -p /var/log/mysql \
	&& mysql_install_db --user=mysql \
					 --basedir=/usr \
					 --datadir=/var/lib/mysql \
	                 --skip-test-db \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& chown -R mysql:mysql /var/log/mysql \
	&& chown -R mysql:mysql /run/mysqld

COPY ./conf/50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/init.sh /

COPY ./tools/init.sql /

EXPOSE 3306

ENTRYPOINT ["bash", "init.sh"]
