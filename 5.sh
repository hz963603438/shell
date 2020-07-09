#!/bin/bash

#find /root/shell/testshell -type f -name "*.txt" >/tmp/txt.list
#for i in `cat /tmp/txt.list`
#do
#	mv $i $i.bak
#done

for i in `cat /tmp/txt.list`
do
	echo $i.bak
done > /tmp/txt.bak.list

tar -zcvf 123.tar.gz `cat /tmp/txt.bak.list | xargs`

for f in `cat /tmp/txt.list`
do
	mv $f.bak $f
done
