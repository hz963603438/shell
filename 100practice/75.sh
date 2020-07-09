#!/bin/bash

f_judge() {
	if [ -d /home/log ];then
		find /home -name "tmp*" | xargs -i mv {} /home/log/
		find /home -name "tmp*" -exec mv {} /home/log \;
	else
		mkdir /home/log
		exit
	fi
}

f_judge
