#!/bin/bash

myfunc() {
	ls /root
	return 0
	ls /root/shell
}


myfunc
echo $?
if myfunc;then
	echo "success"
else
	echo "failed"
fi
