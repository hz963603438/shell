#!/bin/bash


jdkv=`java -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }' > ./version`

if grep -qw "1.8" version;then
	echo "jdk版本是1.8"
elif [ -z $jdkv ];then
	echo "没安装jdk"
	yum -y install java-1.8.0-openjdk*
else	
	echo "jdk版本不是1.8"
	yum -y remove *jdk*
	yum -y install java-1.8.0-openjdk*
fi


