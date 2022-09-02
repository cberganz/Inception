FROM debian:buster

RUN apt-get -y update \
	&& apt-get install -y redis

COPY conf/redis.conf /

USER redis

EXPOSE 6379

ENTRYPOINT ["redis-server", "/redis.conf"]
