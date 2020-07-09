#!/bin/bash

#for i in `seq 0 32767`
#do
#	str=`echo $i | md5sum | cut -c 1-8`
#	echo $i $str
#done > /tmp/md5.txt

#cat > c.txt <<EOF
#21029299
#00205d1c
#a3da1677
#1f6d12dd
#890684ba
#EOF

#grep -f c.txt /tmp/md5.txt

for i in 21029299 00205d1c a3da1677 1f6d12dd 890684ba
do
	str=`grep $i /tmp/md5.txt`
	echo $str
done

