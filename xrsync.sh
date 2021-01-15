#!/bin/bash

f=$1
#filename=`basename $f`
dirname=`dirname $f`
echo $f $dirname
cd $dirname
path=`pwd -P .`
echo $path
who=`who am i`
echo $who
for host in `cat /usr/local/bin/hosts`

do
	tput setaf 2
	echo ===== $host  ======
	tput setaf 7
	rsync -lr $f $host:$path

done
