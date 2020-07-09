#!/bin/bash
for host in `cat /usr/local/bin/hosts`

do
	tput setaf 2
	echo ===== $host  ======
	tput setaf 7
	ssh $host "source /etc/profile;$@"

done
