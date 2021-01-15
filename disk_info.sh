#!/bin/bash

disk_use=`df -h | grep /$ | awk '{print $(NF-1)}' | awk -F% '{print $1}'`
disk_inode=`df -i | grep /$ | awk '{print $(NF-1)}' | awk -F% '{print $1}'`

time=`date +%F`
echo $disk_use $disk_inode
echo "磁盘已经使用百分比:$disk_use%" >> ${time}_disk.log
echo "磁盘已经使用inode百分比:$disk_inode%" >> ${time}_disk.log

if [ $disk_use -ge 50 ]; then
	echo  "磁盘使用超过容量$disk_use%" >> disk.txt
fi

if [ $disk_inode -ge 5 ]; then
	echo "磁盘使用inode超过$disk_inode" >> disk.txt
fi

while read line
	do	
		echo $line
	done <"$time"_disk.log


#while read line  是一次性将文件信息读入并赋值给变量line，while中使用重定向机制，文件中的所有信息都被读入并重定向给了整个while语句中的line变量
