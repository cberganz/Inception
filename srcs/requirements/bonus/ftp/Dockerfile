FROM debian:10.12

RUN apt-get -y update \
	&& apt-get install -y vsftpd openssl \
	&& mkdir -p /etc/ssl/private \
	&& mkdir -p /etc/ssl/certs \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/private.key \
		-out /etc/ssl/certs/certificate.crt \
		-subj "/C=FR/L=Paris/O=42/CN/cberganz.42.fr/UID=cberganz"

COPY conf/vsftpd.conf /etc/

COPY tools/init.sh /var/www/

EXPOSE 21

CMD ["bash", "/var/www/init.sh"]
