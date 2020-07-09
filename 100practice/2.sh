#!/bin/bash


awk '{print $1}' 1.log | sort | uniq -c | sort -rn
