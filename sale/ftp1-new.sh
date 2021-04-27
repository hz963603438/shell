#!/bin/bash


#下载ftp1信息
FTPIPs='10.0.1.113'
FTPDIRs='/temp'
DOWNLOADDIR='/temp'
FTPUSERs='testftp'
FTPPWDs='123456zheng'


#上传ftp2信息
FTPIP='10.0.1.111'
FTPDIR='/home/test'
UPLOADDIR='/temp'
FTPUSER='test'
FTPPWD='test'
DAYDIR=`date -d "-1 day" +%Y%m%d`

##下载文件
#ftp -n <<EOF
#open $FTPIPs                     
#user $FTPUSERs $FTPPWDs         
#binary			
#lcd $DOWNLOADDIR
#prompt			
#mget $DAYDIR\.zip
#close		
#bye		
#EOF 

#下载文件
ftp -n <<EOF
open $FTPIPs                    
user $FTPUSERs $FTPPWDs           
binary			
lcd $DOWNLOADDIR
prompt			
mget $DAYDIR\.zip	
close		
bye		
EOF


mv $DAYDIR\.zip $DAYDIR\.zip.now
echo "download from ftp success"
mv $DAYDIR\.zip.now $DAYDIR\.zip


#cd /temp
#unzip $DAYDIR
#
##上传文件
#ftp -n <<!
#open $FTPIP
#user $FTPUSER $FTPPWD
#mkdir $FTPDIR/$DAYDIR
#binary                         
#cd $FTPDIR/$DAYDIR                     
#lcd $UPLOADDIR/$DAYDIR            
#prompt                        
#mput *               
#close
#bye                            
#!
#echo "upload to ftp success"
