FROM debian:buster

RUN apt-get -y update \
	&& apt-get install -y cron

COPY ./tools/backup.sh /etc/

COPY ./tools/crontab_set.sh /etc/

RUN chmod u+x /etc/crontab_set.sh /etc/backup.sh

CMD ["/etc/crontab_set.sh"]
