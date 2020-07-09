#!/bin/bash

dir=/tmp/disk
d=`date +%F`
mail=13242095170@163.com

[ -d dir ] || mkdir $dir

df >> $dir/$d.log
df -i >> $dir/$d.log

df | sed '1d' | awk -F ' +|%' '$5>=10 {print$7}' > $dir/df.tmp
df -i | sed '1d' | awk -F ' +|%' '$5>=5 {print$7}' > $dir/df_i.tmp

n1=`wc -l $dir/df.tmp | awk '{print $1}'`
n2=`wc -l $dir/df_i.tmp | awk '{print $1}'`

tag=0
if [ $n1 -gt 0 ];then
	if [ $2 -gt 0 ];then
		tag=11
	else
		tag=10
	fi
else
	if [ $2 -gt 0 ];then
		tag=01
	else
		tag=00
	fi
fi

case  $tag in 
	11)
		python mail.py $mail "磁盘空间和inode使用率高于10%" "`cat $dir/df.tmp $dir/df_i.tmp|xargs`"
		;;
	10)
		python mail.py $mail "磁盘空间使用率高于10%" "`cat $dir/df.tmp|xargs`"
		;;
	01)
		python mail.py $mail "磁盘inode使用率高于5%" "`cat $dir/df_i.tmp|xargs`"
		;;
	00)
		;;
esac 
