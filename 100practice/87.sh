#!/bin/bash

dir=/usr/local/tomcat/bin

java_pc() {
	n=`pgrep java | wc -l`
}

cd $dir
./shutdown.sh

count=0

while [ $count -lt 5 ]
do
	n=`java_pc`
	if [ $n -gt 0 ];then
		killall java
		count=$(($count+1))
		sleep 1
	else
		break
	fi
done

n=`java_pc`
if [ $n -gt 0 ];then
	killall -9 java
fi

n=`java_pc`
if [ $n -gt 0 ];then
	echo "tomcat无法强制杀死"
	exit
fi

cd $dir
./startup.sh
