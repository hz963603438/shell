#!/bin/bash

rate=$(df -h |grep /dev/mapper/cl-root |awk '{print $5}' | cut -d"%" -f1)

if [ $rate -ge 80 ]
	then
		echo "/dev/mapper/cl-root is full"
fi
