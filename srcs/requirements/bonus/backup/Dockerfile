FROM debian:buster

RUN apt-get -y update \
	&& apt-get install -y cron

ADD ./tools/backup.sh /

WORKDIR /

CMD ["bash", "backup.sh"]
