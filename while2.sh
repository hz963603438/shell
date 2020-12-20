#!/bin/bash

n=0

while (($n<=100))
do
	top -n 1
	n=$((n + 1))
	sleep 2
done
