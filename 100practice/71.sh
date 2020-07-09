#!/bin/bash

if [ $# -ne 2 ];then
	echo "请提供两个参数，第一个参数为目录名称，第二个参数是单词"
	exit
fi

cd $1
for f in `ls .`
do
	if [ -d $f ];then
		if [ -f $f/test.txt ];then
			n=`grep -cw "$2" $f/test.txt`
			echo "$1/$f目录下有test.txt,改文件里面有$n个$2"
		fi
	fi
done
