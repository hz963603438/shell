#!/bin/bash

date=`date +%F`
dir=/data/logs/disklog
echo $date
if [ ! -d $dir ];then
	mkdir -p $dir
fi
df -h > $dir/$date.log
find $dir/ -mtime +365 | xargs rm -rf 
