DB_DATA= /home/charles/data/db_data
WP_DATA= /home/charles/data/wp_data

COMPOSE = srcs/docker-compose.yml


all: hosts
	mkdir -p ${DB_DATA}
	mkdir -p ${WP_DATA}
	docker compose -f ${COMPOSE} up --build

hosts:
	if grep -R "cberganz.42.fr" /etc/hosts > /dev/null; then \
		echo 'cberganz.42.fr is in hosts !'; \
	else \
		echo '127.0.0.1 cberganz.42.fr' | sudo tee -a /etc/hosts > /dev/null; \
	fi

build:
	docker compose -f ${COMPOSE} up --build

up:
	docker compose -f ${COMPOSE} up

stop:
	docker compose -f ${COMPOSE} stop

clean:
	docker compose -f ${COMPOSE} down

fclean: clean prune
#	sudo rm -rf ${DB_DATA}
#	sudo rm -rf ${WP_DATA}

volume_rm:
	docker volume rm srcs_mariadb-volume
	docker volume rm srcs_wordpress-volume

prune:
	docker system prune -a --force
	docker volume prune --force
	docker network prune --force

re: fclean volume_rm all

.PHONY: all build up stop clean fclean re volume_rm
