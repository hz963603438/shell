#!/bin/bash

if [ $# -ne 2 ];then
	echo "useage $0 盘符 挂载点, 如: $0 /dev/sda1 /data1"
	exit 1
fi

if [ ! -b $1 ];then
	echo "你提供的盘符不正确,请检查后再操作"
	exit 1
fi

echo "格式化$1"
mkfs.ext4 $1

if [ ! -d $2 ];then
	mkdir -p $2
fi

n=`awk '$NF == "$2"' /etc/fstab | wc -l`
if [ $n -eq 0 ];then
	echo "$1           $2               ext4    defaults   0    0" >> /etc/fstab
	mount -a
else
	echo "配置文件/etc/fstab中已经存在挂载点$2,请检查一下"
	exit 1
fi 
