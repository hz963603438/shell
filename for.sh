#!/bin/bash


for (( i=1;i<=1000;i++ ))
        do
        	#echo aaa
                curl 10.254.231.149/html/index.html >> for.log 
        done


