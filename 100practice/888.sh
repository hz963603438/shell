#!/bin/bash


sed '/<!--.*-->/d' test.xml > test2.xml
egrep -n '<!--|\-\->' test2.xml |awk -F ':' '{print $1}' > /tmp/line_number1.txt
n=`wc -l /tmp/line_number1.txt|awk '{print $1}'`
n1=$[$n/2]
for i in `seq 1 $n1`
do
    j=$[$i*2]
    k=$[$j-1]
    x=`sed -n "$k"p /tmp/line_number1.txt`
    y=`sed -n "$j"p /tmp/line_number1.txt`
    sed -i "$x,$y"d test2.xml
done
grep -n 'artifactItem>' test2.xml |awk '{print $1}' |sed 's/://' > /tmp/line_number2.txt
n2=`wc -l /tmp/line_number2.txt|awk '{print $1}'`
get_value(){
    sed -n "$1,$2"p test2.xml|awk -F '<' '{print $2}'|awk -F '>' '{print $1,$2}' > /tmp/value.txt
    
    cat /tmp/value.txt|while read line
    do
        x=`echo $line|awk '{print $1}'`
        y=`echo $line|awk '{print $2}'`
        echo artifactItem:$x:$y
    done
}
n3=$[$n2/2]
for j in `seq 1 $n3`
do
    m1=$[$j*2-1]
    m2=$[$j*2]
    nu1=`sed -n "$m1"p /tmp/line_number2.txt`
    nu2=`sed -n "$m2"p /tmp/line_number2.txt`
    nu3=$[$nu1+1]
    nu4=$[$nu2-1]
    get_value $nu3 $nu4
done
