#!/bin/bash

for w in `sed 's/[^a-Z]/ /g' $1`
do
	echo $w
done | sort | uniq -c | sort -rn | head
