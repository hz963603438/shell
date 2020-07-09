#!/bin/bash

var=http://www.aaa.com/root/123.html

echo $var | sed 's#http://##'
echo $var | awk -F// '{print $2}'

echo $var | awk -F/ '{print $5}'

echo $var | sed 's#123.html##'

echo $var | awk -F// '{print $1}'

echo $var | awk -Fwww '{print $1}'

echo $var | awk -Fcom/ '{print $2}'
echo $var | awk -F/ '{print $4"/"$5}'

echo $var | sed 's/[^0-9]//g'
