#!/bin/bash

FTPIP='10.10.10.200'
FTPDIR='/home/ftp_hnyx'
UPLOADDIR='/root/transformer'
FTPUSER='ftp_hnyx'
FTPPWD='pwd@12'

#更改文件名带.tmp后缀
changename() {
	for file in `find $UPLOADDIR -name "*"`
	do
        #echo $file
        mv $file $file.tmp
	done

}

changename

#上传tmp文件
for tmpfile in `find $UPLOADDIR -name "*"`
do

#上传文件
ftp -n <<!
open $FTPIP
user $FTPUSER $FTPPWD
binary                         
cd $FTPDIR                     
lcd $UPLOADDIR/$DAY            
prompt                        
mput $tmpfile               
close
bye                            
!
statuscode=`echo $?`
if [ $statuscode != 0];then
	echo "$tmpfile 没有上传成功,请重现上传"
fi

done

#文件名更改回来
returnname() {
	for tmpfile in `find $UPLOADDIR -name "*"`
	do
		mv $tmpfile `echo $tmpfile | sed 's/\.tmp_//g'`
	done
}

returnname

