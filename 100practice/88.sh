#!/bin/bash

for f in `ls -d ./*bak`
do
	#mv $f `echo $f | sed 's/bak//g'`
	f1=`echo $f | awk -F 'bak' '{print $1}'`
	mv $f $f1
done
