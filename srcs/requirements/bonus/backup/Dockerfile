FROM debian:10.12

RUN apt-get -y update \
	&& mkdir /bk

ADD ./tools/backup.sh /bk/

WORKDIR /bk

CMD ["bash", "backup.sh"]
