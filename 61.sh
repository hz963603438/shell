#!/bin/bash

#grep -vf b.txt a.txt

cat a.txt | while read line
do
	if ! grep -q "$line" b.txt;then
		echo $line
	fi
done > c.txt
wc -l c.txt
 
