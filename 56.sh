#!/bin/bash

n=0
cat 56.txt | while read line
do
	n=$(($n+1))
	if [ $n -eq 5 ];then
		echo $line
		echo -e "# this is a test file.\n# test insert line into this file."
	else
		echo $line
	fi
done
