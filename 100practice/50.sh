#!/bin/bash

sar -n DEV 1 5 | grep -w "$1" >/tmp/sar.tmp

in=`grep "平均" /tmp/sar.tmp | awk '{print $5}'`
out=`grep "平均" /tmp/sar.tmp | awk '{print $6}'`

echo $in $out
if [ $in == "0.00" -a $out == "0.00" ];then
	ifdown $1
	ifup $1
fi
