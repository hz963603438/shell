#!/bin/bash

ps -u $USER | awk '$NF ~ /aming/ {print $1}' | xargs kill
