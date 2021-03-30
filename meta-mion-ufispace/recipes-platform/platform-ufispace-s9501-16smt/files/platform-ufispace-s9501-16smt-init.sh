#!/bin/sh

# SPDX-License-Identifier: MIT 

function wait_for_file() {
	FILE=$1
	i=0
	while [ $i -lt 10 ]; do
		test -e $FILE && return 0
		i=$(( i + 1 ))
		sleep 1
	done
	return 1
}

#wait_for_file /sys/bus/i2c/devices/0-0069 && set_clocksouce
#wait_for_file /sys/bus/i2c/devices/i2c-2 && enable_tx

echo "s9501-16smt" > /tmp/.platform
