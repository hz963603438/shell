#!/bin/bash

user_id=`cat /etc/passwd | awk -F: '{print $3}'`
user_total=`cat /etc/passwd | awk -F: '$3>1000' |wc -l`

for i in $user_id; do
	if [ $i -ge 1000 ]; then
		user_uid_uname=`cat /etc/passwd | awk -F: '{print $1":"$3}' | grep $i`
		echo $user_uid_uname
	fi
done

echo "总共普通用户有:" $user_total
