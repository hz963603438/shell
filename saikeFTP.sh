#!/bin/bash
Yesterday=`date -d yesterday '+%Y-%m-%d'`
if [ -e /logback/new/tonielsenccdata/$Yesterday ];then
	echo "/logback/new/tonielsenccdata/$Yesterday is ok !"
else
exit
fi

/usr/bin/ftp -n<<!
open 172.16.135.81
user GehuaAD Saike.ccdt.cn
prompt
bin
cd epgLinux
mkdir $Yesterday
cd  $Yesterday
lcd  /logback/new/tonielsenccdata/$Yesterday
mput   adscoll. *
close
bye
!