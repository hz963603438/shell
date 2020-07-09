#!/bin/bash

error_count=`tail -300 /var/log/httpd/access_log|grep 404 |wc -l`

if [ $error_count -gt 100 ]; then
	pkill -9 httpd
	systemctl start httpd
fi
