#!/bin/bash

[ $# -eq 0 ] && echo '请输入网址' && exit 1

CURL=`curl -Is http://$1 | grep HTTP | awk '{print $2}'`
	if [ -z $CURL ]; then
		echo '请输入网址'
		exit 1
	fi

if [ $CURL -eq 200 -o $CURL -eq 301 -o $CURL -eq 302 ]; then
	echo '$1的网站访问正常'
else
	echo '访问失败'
fi
