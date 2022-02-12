#!/bin/bash
function check(){
        local a="$1"
        printf "%d" "$a" &>/dev/null && echo "integer" && return
        printf "%f" "$a" &>/dev/null && echo "number" && return
        [ ${#a} -eq 1 ] && echo "char" && return
        echo "string"
}

ls /

echo "$? is" $(check "$?")
echo "0 is" $(check "0")
echo "1 is" $(check "1")
echo "1.3 is" $(check "1.3")
