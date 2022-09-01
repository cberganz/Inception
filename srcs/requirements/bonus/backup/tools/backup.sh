#!/bin/sh

echo "Backup service started"

while true;
do
	time=$(date '+%Y-%m-%d %H:%M:%S')
	mkdir /bk/"$time"
	cp -Rf /db/* /bk/"$time"
	echo "Database backup done !"
	sleep 3m
done
