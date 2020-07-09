#!/bin/bash
#计算每一行数字个数，并计算整个文档中有多少个数字

sum=0
while read line
do
	#line_num=`echo  $line | sed 's/[^0-9]//g' test.txt`
	line_num=`echo  $line | sed 's/[^0-9]//g' | wc -L`
	echo $line_num
	sum=$(($sum+$line_num))
done < $1 
echo "sum: $sum"
