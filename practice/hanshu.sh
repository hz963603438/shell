#!/bin/bash
dir=/root

func1() {
	n=`wc -l $dir/$1 | awk '{print $1}'`
	echo $n
}


n1=`func1 123.txt`
n2=`func1 11.txt`
echo $n1
echo $n2


