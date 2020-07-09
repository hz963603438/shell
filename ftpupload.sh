#!/bin/bash

FTPIP='10.10.10.200'
FTPDIR='/home/ftp_hnyx'
UPLOADDIR='/root/transformer'
FTPUSER='ftp_hnyx'
FTPPWD='pwd@12'
DAY=`date -d "-1 day" +%Y%m%d`



#上传文件
ftp -n <<!
open $FTPIP
user $FTPUSER $FTPPWD
binary                         
cd $FTPDIR                     
lcd $UPLOADDIR/$DAY            
prompt                        
mput *               
close
bye                            
!
echo "upload to ftp success"

