#!/bin/bash

for pid in `ps aux | grep 6.sh | awk '{print $2}'`
do
	echo $pid
	kill -9 $pid
done
