#!/bin/bash
USERNAME='root'
PASSWD='ipanel2013'
#HOST='192.168.96.156'
DELETEDATE=`date -d '-2 month' +%F`
echo $DELETEDATE

/usr/local/mysql/bin/mysql -u$USERNAME -p$PASSWD -e"use ipanelad;delete from history_fly where ad_history_id in(select id from ad_history where modify_date <='$DELETEDATE')"
/usr/local/mysql/bin/mysql -u$USERNAME -p$PASSWD -e"use ipanelad;delete from history_fly_content where ad_history_id in(select id from ad_history where modify_date <='$DELETEDATE')"
/usr/local/mysql/bin/mysql -u$USERNAME -p$PASSWD -e"use ipanelad;delete from history_img where ad_history_id in(select id from ad_history where modify_date <='$DELETEDATE')"
/usr/local/mysql/bin/mysql -u$USERNAME -p$PASSWD -e"use ipanelad;delete from history_position_area where ad_history_id in(select id from ad_history where modify_date <='$DELETEDATE')"
/usr/local/mysql/bin/mysql -u$USERNAME -p$PASSWD -e"use ipanelad;delete from ad_history where modify_date <='$DELETEDATE'"
/usr/local/mysql/bin/mysql -u$USERNAME -p$PASSWD -e"use ipanelad;delete from log where log_time <='$DELETEDATE'"

/usr/local/mysql/bin/mysql -u$USERNAME -p$PASSWD -e"use mysql;delete from user where password_last_changed <='$DELETEDATE'"
