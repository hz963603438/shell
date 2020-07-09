#!/bin/bash

t=`date +%F`
cd $HOME
tar -zcf $t.tar.gz `find ./ -type f -size -5k|xargs`
