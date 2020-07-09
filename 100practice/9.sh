#!/bin/bash

sed -n '1,5'p 1.txt | sed '/[a-Z]/d'

sed '1,5d' 1.txt | sed '1,5s/[a-Z]//g' 
