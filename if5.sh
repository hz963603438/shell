#!/bin/bash

#当第一个if和第二个同时满足条件，只会走第一个if就跳出判断了

if [ $1 -lt 5 ];then
	echo "参数小于5"
elif [ $1 -lt 10 ];then
	echo "参数小于10"
else
	echo "参数1111"
fi

