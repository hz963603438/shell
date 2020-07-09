#!/bin/bash

ip add | awk -F": " '$1 ~ "^[0-9]" {print $2}'

get_ip() {
	ip add show dev $1 | grep inet | awk '{print $2}' | awk -F/ '{print }'
}
