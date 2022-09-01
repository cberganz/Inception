FROM debian:buster

RUN apt-get -y update

ADD ./tools/backup.sh /

WORKDIR /

CMD ["bash", "backup.sh"]
