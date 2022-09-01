# VARIABLES

COMPOSE=docker compose -f srcs/docker-compose.yml -p inception

# GENERAL RULES

all: hosts data build up

re: fclean volume_rm all

hosts:
	if grep -R "cberganz.42.fr" /etc/hosts > /dev/null; then \
		echo 'cberganz.42.fr is in hosts !'; \
	else \
		echo '127.0.0.1 cberganz.42.fr' | sudo tee -a /etc/hosts > /dev/null; \
	fi

data:
	mkdir -p /home/${USER}/data/db_data
	mkdir -p /home/${USER}/data/wp_data
	mkdir -p /home/${USER}/data/backup

# DOCKER RULES

build:
	${COMPOSE} build

up:
	${COMPOSE} up

stop:
	${COMPOSE} stop

ps:
	docker ps

# CLEAN RULES

fclean: clean prune

clean:
	${COMPOSE} down

volume_rm:
	docker volume rm inception_mariadb-volume
	docker volume rm inception_wordpress-volume
	docker volume rm inception_bk-volume

prune:
	docker system prune -a --force
	docker volume prune --force
	docker network prune --force

# MARIADB

mariadb_build:
	${COMPOSE} build mariadb

mariadb_up:
	${COMPOSE} up mariadb

mariadb_stop:
	${COMPOSE} stop mariadb

mariadb_rm:
	${COMPOSE} rm -f mariadb

mariadb_bash:
	${COMPOSE} exec mariadb bash

# NGINX

nginx_build:
	${COMPOSE} build nginx

nginx_up:
	${COMPOSE} up nginx

nginx_stop:
	${COMPOSE} stop nginx

nginx_rm:
	${COMPOSE} rm -f nginx

nginx_bash:
	${COMPOSE} exec nginx bash

# WORDPRESS

wordpress_build:
	${COMPOSE} build wordpress

wordpress_up:
	${COMPOSE} up wordpress
	docker network prune --force

wordpress_stop:
	${COMPOSE} stop wordpress

wordpress_rm:
	${COMPOSE} rm -f wordpress

wordpress_bash:
	${COMPOSE} exec wordpress bash

# STATIC-PAGE

static-page_build:
	${COMPOSE} build static-page

static-page_up:
	${COMPOSE} up static-page

static-page_stop:
	${COMPOSE} stop static-page

static-page_rm:
	${COMPOSE} rm -f static-page

static-page_bash:
	${COMPOSE} exec static-page bash

# FTP

ftp_build:
	${COMPOSE} build ftp

ftp_up:
	${COMPOSE} up ftp

ftp_stop:
	${COMPOSE} stop ftp

ftp_rm:
	${COMPOSE} rm -f ftp

ftp_bash:
	${COMPOSE} exec ftp bash

# REDIS

redis_build:
	${COMPOSE} build redis

redis_up:
	${COMPOSE} up redis

redis_stop:
	${COMPOSE} stop redis


redis_rm:
	${COMPOSE} rm -f redis

redis_bash:
	${COMPOSE} exec redis bash

# ADMINER

adminer_build:
	${COMPOSE} build adminer

adminer_up:
	${COMPOSE} up adminer

adminer_stop:
	${COMPOSE} stop adminer

adminer_rm:
	${COMPOSE} rm -f adminer

adminer_bash:
	${COMPOSE} exec adminer bash

.PHONY: all re hosts data build up stop ps clean fclean volume_rm prune
