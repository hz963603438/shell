#!/bin/bash


file_txt=`find /root/shell/testshell -type f -iname '*.txt'`
for i in $file_txt
	do
		mv $i $i.bak
	done

file_bak=`find /root/shell/testshell -iname '*.bak' > ./tar.tt`
for j in `cat /root/shell/testshell/tar.tt`
	do
		mv $j ${j%.*} #%代表从后往前删，以.为分隔符，删除.以及后面的内容
	done
