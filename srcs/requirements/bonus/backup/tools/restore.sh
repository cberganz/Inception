#!/bin/sh

echo "Data recovering service started :"
echo "Which data would you like to recover ?"
ls /bk
echo "Enter a data for data recovering :"
read foldername

if [ -f "/bk/$foldername" ]; then
	rm -rf /db/*
	cp /bk/$foldername/* /db/
else
	echo "Data recovering failed, service closed. Please run again to retry."
fi
