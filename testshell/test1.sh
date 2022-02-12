#!/bin/bash

ls /

#echo $?
if [ $? -eq 0 ];then
	echo "success"
else
	echo "faild"
fi
