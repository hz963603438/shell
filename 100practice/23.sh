#/bin/bash

logdir=/tmp/sar_log
file=$logdir/`date +%d%H`.log
time=`date +"%F %H:%M"`

[ -d $logdir ] || mkdir -p $logdir
LANG=en
sar -n DEV 1 5 | grep ens33 | grep "Average" > /tmp/sar.tmp

exec >>$file
echo "$time"
awk '{print "ens33 input:",$5*8000"bps" "\n""ens33 output:",$6*8000"bps"}' /tmp/sar.tmp
echo "############################"
