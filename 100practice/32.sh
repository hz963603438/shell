#!/bin/bash

if [ $# -eq 0 ];then
	echo "当前目录下的文件是: "
	ls .
else
	for dir in $@
		do
			if [ -d $dir ];then
				echo "目录$dir下有这些子目录"
				find $dir -type d
			else
				echo "没有该目录: $dir"
			fi
		done
fi


echo '参数个数为: ' $#
echo '参数列表为: ' $@
