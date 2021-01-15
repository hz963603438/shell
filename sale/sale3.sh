#!/bin/bash
while read line
do
	first_line=`echo $line | egrep  "@@"`
	echo $first_line
	content_one=`echo $first_line | awk -F" " '{print $2}' | awk -F "-" '{print $2}' | awk -F "," '{print $1}'`
	if [ -n "$content_one" ];then
		echo $content_one >> result.txt
	fi
	
	second_line=`echo $line | grep "\-\-\-"`
	echo $second_line 
	content_two=`echo $second_line | awk -F" " '{print $2}' | awk -F "a/" '{print $2}'`
	if [ -n "$content_two" ];then
		echo $content_two >> result.txt
	fi

	third_line=`echo $line | grep UINT32`
	echo $third_line
	content_three=`echo $third_line | awk -F "(" '{print $1}'`
	if [ -n "$content_three" ];then
		echo $content_three >> result.txt
	fi
done < $1
