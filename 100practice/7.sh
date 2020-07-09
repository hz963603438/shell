#!/bin/bash

date1=`date +%w`
date2=`date +%d`

local_bakdir=/bak/mysqldata
remote_bakdir=192.168.123.30::backup

exec 1> /tmp/mysqlbak.log  2>/tmp/mysqlerr.log
echo "mysql backup begin at `date`"
mysqldump -uroot -pxxxx discz > $local_bakdir/discz.sql.$date1
rsync -avr $local_bakdir/discz.sql.$date1  $remote_bakdir/discz.sql.$date2
echo "mysql backup end at `date`"
