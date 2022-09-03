#!/bin/sh

if ! crontab -l >/dev/null 2>&1; then
	echo "Adding cron job..."
	echo "*/10 * * * * mkdir /bk/$(date +%Y-%m-%d_%H:%M:%S)" > cronjobs
	echo "*/10 * * * * cp -Rf /db/* /bk/$(date +%Y-%m-%d_%H:%M:%S)" >> cronjobs
	echo "*/10 * * * * echo \"Database backup done!\" >/proc/1/fd/1 2>&1" >> cronjobs
	cat cronjobs | crontab -
	rm cronjobs
fi

echo "Backup service started."
/usr/sbin/cron -f
