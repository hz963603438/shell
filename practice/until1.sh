#!/bin/bash
i=1
s=0

until [ $i -gt 100 ]
	do
		s=$(( $s+$i ))
		i=$(( $i+1 ))
	done
echo $s
