#!/bin/bash

n=`wc -l 99.txt | awk '{print $1}'`

n2=$(($n/2))

for i in `seq 1 $n2`
do
	j=$(($i*2-1))
	k=$(($i*2))
	l1=`sed -n "$j"p 99.txt`
	l2=`sed -n "$k"p 99.txt`
	echo $l1:$l2
done
