#!/bin/sh

export time=$(date +%Y-%m-%d_%H:%M:%S)
mkdir /bk/$time
cp -Rf /db/* /bk/$time
echo "Database backup done!" >/proc/1/fd/1 2>&1
