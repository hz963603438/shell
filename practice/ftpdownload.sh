#!/bin/bash

FTPIP='192.168.96.178'
FTPDIR='/home/huzheng'
DOWNLOADDIR='/root'
UPLOADDIR='/root/shell'
FTPUSER='huzheng'
FTPPWD='123456'


#下载文件
#ftp -n <<EOF
#open $FTPIP                     
#user $FTPUSER $FTPPWD           
#binary			
#cd $FTPDIR	               #ftp服务器目录	   ftp远端目录
#lcd $DOWNLOADDIR	       #要数据下载的目录   本地目录
#prompt			
#mget *.txt	
#close		
#bye		
#EOF
#echo "download from ftp success"


#上传文件
ftp -n <<!
open $FTPIP
user $FTPUSER $FTPPWD
binary                          #二进制传输
cd $FTPDIR			#ftp服务器目录      ftp远端目录
lcd $UPLOADDIR 		    	#数据要上传的目录   本地目录
prompt				#切换交互式提示
put -r ./		
close
bye				#退出
!
echo "upload to ftp success"
