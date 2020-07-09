#!/bin/bash

time=`date +%Y%m%d`

cd /root/homed/dtvs/log

echo $time
/usr/bin/tar -zcvf dtvslog$time.tar.gz /root/homed/dtvs/log/server*
