#!/bin/bash

name=`date +%Y%m%d-%T`

/usr/local/mysql/bin/mysqldump -uroot -pipanel --flush-logs --master-data=2 --all-databases > /tmp/$name.sql


