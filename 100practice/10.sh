#!/bin/bash

words="Bash also interprets a number of multi-character options."

n=`echo $words | awk -F '[ +-. ]' '{print NF}'`

echo $n

for ((i=1;i<$n;i++))
	do
		l=`echo $words | awk -F '[ +.-]' -v j=$i '{print $j}' | wc -L`
		if [ $l -lt 6 ];then
			echo $words | awk -F '[ +.-]' -v j=$i '{print $j}'
		fi
	done
