FROM debian:10.12

RUN apt-get -y update \
	&& apt-get -y install nginx openssl \
	&& mkdir -p /etc/ssl/private \
	&& mkdir -p /etc/ssl/certs \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx-self-signed.key \
		-out /etc/ssl/certs/nginx-self-signed.crt \
		-subj "/C=FR/L=Paris/O=42/CN=cberganz.42.fr/UID=cberganz" \
	&& adduser --disabled-password --gecos "" nginx

COPY ./conf/default.conf /etc/nginx/http.d/

COPY ./conf/ssl-params.conf /etc/nginx/snippets/

COPY ./conf/nginx.conf /etc/nginx/

EXPOSE 443

CMD ["nginx"]
