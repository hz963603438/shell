#!/bin/bash


hostlist="10.0.1.4 10.0.1.5 10.0.1.6"
logfilename="1552760-hw1-q2.log"


for host in $hostlist
do
	rsync -avr /root/shells $host:/root/
	ssh $host "source /etc/profile;cd $(cd `dirname $0`;pwd);sh /root/shells/1552760-hw1-q2.sh;sh /root/shells/1552760-hw1-q3.sh $logfilename"

        echo "===========   $host服务器执行完成   =============="
        ssh $host 'source /etc/profile ; upload=`tail -n 1 /root/shells/1552760-hw1-q3.log`; echo $upload' >> ./upload.txt

done



s=0
for num in `cat ./upload.txt`
do
    s=$(echo "${s} ${num}" | awk '{printf ("%.3f\n",$1+$2)}')
done
echo "总负载为: $s"

#echo "${s} $( wc -l ./upload.txt)" | awk '{printf ("%.3f\n",$1/$2)}'
echo "${s} 3" | awk '{printf ("%.3f\n",$1/$2)}'

