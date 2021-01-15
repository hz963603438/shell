#!/bin/bash

FILE=/root/shell/sale/oui.txt
DBUSER=root
DBPASSWD=ipanel
DATABASE=test2

#data2=(`cat $FILE | grep hex | awk -F"(hex))" '{print $2}'`)
data2=(`cat $FILE | grep hex | awk '{print $1}'`)
cat $FILE | grep hex | awk -F"(hex))" '{print $2}' > /root/test.txt

n=0

cat /root/test.txt | while read line

#for i in `cat $FILE | grep hex | awk '{print $1}'`
do
	#mysql -u$DBUSER -p$DBPASSWD -e"use $DATABASE;insert into test(macname,oganame) values ('"$i"','${data2[$n]}');" 2>/dev/null
	mysql -u$DBUSER -p$DBPASSWD -e"use $DATABASE;insert into test(macname,oganame) values ('${data2[$n]}','$line');" 2>/dev/null
	let n++
done

