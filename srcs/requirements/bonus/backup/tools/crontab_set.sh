#!/bin/sh

if ! crontab -l >/dev/null 2>&1; then
	echo "Adding cron job..."
	echo "*/10 * * * * /etc/backup.sh" | crontab -
fi

echo "Backup service started !"
/usr/sbin/cron -f
