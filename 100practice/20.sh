#!/bin/bash

dir=/tmp/log_stat
t=`date +%d%H`
t1=`date +%H`
logdir=/data/log

[ -d $dir ] || mkdir $dir
[ -f $dir/$t.log ] && rm -rf $dir/$t.log

if [ $t1 == "00" -o $t1 == "12" ];then
	for f in `find $logdir/ -type f`
	do
		> $f
	done
else
	for f in `find $logdir/ -type f`
	do
		size=`du -sh $f`
		echo $size >> $dir/$t.log
	done
fi


