#!/bin/sh

if [ -f ".init_done" ]; then
    echo "Database initialization already done !"
else
    echo "Database initialization not done !"
    echo "Starting database initialization..."

	sed -i "s/DB_ROOT_PASSWD/${DB_ROOT_PASSWD}/g" /init.sql
	sed -i "s/DB_ADMIN_PASSWD/${DB_ADMIN_PASSWD}/g" /init.sql
	sed -i "s/DB_USER_PASSWD/${DB_USER_PASSWD}/g" /init.sql
	sed -i "s/DB_ADMIN/${DB_ADMIN}/g" /init.sql
	sed -i "s/DB_USER/${DB_USER}/g" /init.sql
	sed -i "s/DB_NAME/${DB_NAME}/g" /init.sql

	/usr/bin/mysqld_safe &
	sleep 5
	mariadb -u root < init.sql
	killall -KILL mysqld_safe mysqld
	rm init.sql

    echo "Initialization done successfully !"
    touch .init_done

fi

echo "Starting MySQL daemon"
mysqld
