#!/bin/bash

words=`cat ./11.txt`
echo $words
for i in $words
	do
	num=`echo $i | wc -c`
		if [ $num -le 7 ]; then
			echo $i
		fi
	done
