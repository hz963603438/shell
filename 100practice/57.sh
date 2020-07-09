#!/bin/bash

d1=`date +%d`
d2=`date +%y%m%d`

if [ $d1 == "01" ];then
	cd /etc
	tar -zcf /root/bak/$d2_etc.tar.gz ./
fi
