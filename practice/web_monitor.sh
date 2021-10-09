#!/bin/bash

function check_url() {
	#http_code=`curl -o /dev/null -s -w "%{http_code}" $1`
	#if [ $http_code -ne 200 ]; then
	if ! wget --spider $1 &>/dev/null; then
		echo "$1 access failure"
	else
		echo "$1 access success"
	fi
}
url_list="www.baidu.com www.baidudad.com"

for url in $url_list; do
	fail_count=0
	for ((i=1;i<=3;i++)); do
		if ! wget --spider $url &>/dev/null; then
			let fail_count++
			
       	 	else
                	echo "$url access success"
			break
        	fi
	done
	if [ $fail_count -eq 3 ]; then
		echo "$url access failure"
	fi
done
