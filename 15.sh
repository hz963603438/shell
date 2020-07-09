#!/bin/bash
x=10
y=21

for i in `seq 0 15`
do	
	echo $x
	x=$(($x+$y))
	z=$((2**$i))
	y=$(($y+$z))
done
