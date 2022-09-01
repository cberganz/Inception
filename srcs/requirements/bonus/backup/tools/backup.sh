#!/bin/sh

sleep 120
echo "Backup service started."
time=$(date '+%Y-%m-%d %H:%M:%S')
mkdir /bk/"$time"
cp -Rf /db/* /bk/"$time"/
echo "Database backup done !"
echo "Backup service stopped."
