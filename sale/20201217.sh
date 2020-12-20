#!/bin/bash


cd $(cd `dirname $0`;pwd)
versionnum=`curl http://8.131.79.171/version.txt`
echo "$versionnum"

versionold=`cat version.txt`
echo "$versionold"

if [ $versionnum == $versionold ];then
	echo "版本号一致，不需要更新程序"
else
	echo "版本号不一致，即将开始更新程序"
	echo $versionnum > version.txt
	wget http://8.131.79.171/uenc.zip
	unzip uenc.zip
	rm -rf uenc.zip
	mv uenc_1.1_primarynet ebpc_wm
	mv -f ebpc_wm /home/ebpc_run/
	chmod 755 /home/ebpc_run/ebpc_wm
	cd /home/ebpc_run && ./ebpc_wm
fi


