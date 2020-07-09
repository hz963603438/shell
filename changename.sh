#!/bin/bash

base_dir=/root/shell/testmvname/


for file in `find $base_dir -name "*.xml"`
do
        #echo $file
        mv $file `echo $file | sed 's/[0-9]*_//g'`
done

