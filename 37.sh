#!/bin/bash

cd /data/logs
LOG=1.log

mv_log() {
	[ -f $1 ] && mv $1 $2
}

[ -f 1.log.5 ] && rm -rf $LOG.5
for i in `seq 4 -1 1`
do
	j=$(($i+1))
	mv_log $LOG.$i $LOG.$j
done

mv 1.log 1.log.1

