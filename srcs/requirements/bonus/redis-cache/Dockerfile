FROM debian:10.12

RUN apt-get -y update \
	&& apt-get install -y redis

COPY redis.conf /

USER redis

EXPOSE 6379

ENTRYPOINT ["redis-server", "--protected-mode", "no"]
