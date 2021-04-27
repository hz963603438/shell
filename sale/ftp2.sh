#!/bin/bash


#上传ftp1信息
FTPIPs='10.0.1.113'
FTPDIRs='/temp'
DOWNLOADDIR='/temp'
FTPUSERs='testftp'
FTPPWDs='123456zheng'


#下载ftp2信息
FTPIP='10.0.1.111'
FTPDIR='/test'
UPLOADDIR='/temp'
FTPUSER='test'
FTPPWD='test'
DAYDIR=`date -d "-1 day" +%Y%m%d`

#下载文件
ftp -n <<EOF
open $FTPIP                     
user $FTPUSER $FTPPWD         
binary
cd $FTPDIR			
lcd $DOWNLOADDIR
prompt			
mget DW00003R.abc."$DAYDIR"0
close		
bye		
EOF



#上传文件
ftp -n <<!
open $FTPIPs
user $FTPUSERs $FTPPWDs
binary                         
cd $FTPDIRs                    
lcd $UPLOADDIR 
prompt                        
mput DW00003R.abc."$DAYDIR"0
close
bye                            
!
echo "upload to ftp success"
