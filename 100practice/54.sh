#!/bin/bash
#分析nginx访问日志

export LANG=en
log=/usr/local/nginx/logs/access.log
t=`date +%d/%b/%Y:1[01]:[0-5][0-9]:`

egrep "$t" $log|awk '{print $1}'| sort -n | uniq -c | sor -n | tail -1 | awk '{print $2}'

