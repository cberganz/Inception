#!/bin/sh

if [ -f ".init_done" ]; then
    echo "Wordpress initialization already done !"
else
    echo "Wordpress initialization not done !"
	sleep 10
    echo "Starting wordpress initialization..."
	wp core install --path=${WWW_DIR}/html \
					--url=${URL} \
					--title=Inception \
					--admin_user=${WP_ADMIN} \
					--admin_password=${WP_ADMIN_PASSWD} \
					--admin_email=${WP_ADMIN_EMAIL} \
					--skip-email \
					--allow-root

	echo "Creating wordpress user..."
	wp user create	--path=${WWW_DIR}/html \
					${WP_USER} ${WP_USER_EMAIL} \
					--user_pass=${WP_USER_PASSWD} \
					--role=contributor \
					--allow-root

	echo "Setting up redis..."
	wp plugin install redis-cache --allow-root > /dev/null
	wp plugin activate redis-cache --allow-root
	wp redis enable --allow-root

    echo "Initialization done successfully !"
    touch .init_done

fi

echo "Starting php-fpm..."
php-fpm7.3 -F
