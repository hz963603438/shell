#!/bin/bash
function echo_color() {
	if [ $1 == "green" ]; then
		echo -e "\033[32;40m$2\033[0m"
	elif [ $1 == "red" ]; then
		echo -e "\033[31;40m$2\033[0m"
	fi
}

function echo_color2() {
	case $1 in
		green)
			echo -e "\033[32;40m$2\033[0m"
			;;
		red)
			echo -e "\033[31;40m$2\033[0m"
			;;
		*)
			echo -e "echo_color2 {green|red} string"
	esac
}

echo_color2 red huzheng
echo_color green huzheng
