#!/bin/bash

ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa

for host in `cat /usr/local/bin/.hosts`;
do
	tput setaf 2
	echo ==== $host ====
	tput setaf 7
	ssh-copy-id $host
done

