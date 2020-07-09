#!/bin/bash

most_command=`cat ~/.bash_history | sort | uniq -c | sort -n | tail | sed '1,9d'`

echo $most_command
