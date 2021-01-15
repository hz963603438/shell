#!/bin/bash
#ntpdate asia.pool.ntp.org &>/dev/null

date=$(date +%y%m%d)

size=$(du -sh /usr/local/mysql)
echo $date $size

if [ -d /tmp/dbback ]
	then
		echo "Date is : $date"  > /tmp/dbback/db.txt
		echo "size is : $size" >> /tmp/dbback/db.txt
		echo $date
		cd /tmp/dbback
		tar -zcf mysql_$date.tar.gz /usr/local/mysql db.txt &> /dev/null
		echo $size
	else
		mkdir /tmp/dbback
		echo 'Date is : $date' >  /tmp/dbback/db.txt
		echo 'size is : $size' >> /tmp/dbback/db.txt
		echo $date
		cd /tmp/dbback
		tar -zcf mysql_$date.tar.gz /usr/local/mysql db.txt &> /dev/null
		rm -rf /tmp/dbback/db.txt
fi
