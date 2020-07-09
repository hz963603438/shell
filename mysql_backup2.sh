#!/bin/bash

DB_NAME='mysql'
DB_USER='root'
DB_PASS='ipanel'


BIN_DIR='/usr/lcoal/mysql/bin'
BACK_DIR='/tmp'
DATE=`date +F`

$BIN_DIR/mysqldump --opt  -u$DB_USER  -p$DB_PASS | gzip > $$BACK_DIR/db_$DATE.gz



