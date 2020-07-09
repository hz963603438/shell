#!/bin/bash

cat /etc/passwd | while read line
do
	username=`echo $line | awk -F: '{print $1}'`
	uid=`echo $line | awk -F: '{print $3}'`
	echo "hello,$username,your uid is $uid"
done
