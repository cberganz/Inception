FROM debian:10.12

RUN apt-get update
	&& apk add --update nginx
	&& apk add --update openssl
	&& mkdir -p /etc/ssl/private
	&& mkdir -p /etc/ssl/certs
	&& openssl req -x509 -nodes -day 365 - newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx-self-signed.key \
		-out /etc/ssl/certs/nginx-self-signed.crt \
		-subj "/c=FR/L=Paris/o=42/CN/cberganz.42.fr/UID=cberganz"

COPY

EXPOSE 443

CMD ["nginx"]
