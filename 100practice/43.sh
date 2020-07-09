#!/bin/bash

while :
do
	if w|sed '1'd | awk '{print $1}' | grep -qw "$1"
	then
		echo "用户$1已经登陆"
		exit
	fi
	sleep 30
done
