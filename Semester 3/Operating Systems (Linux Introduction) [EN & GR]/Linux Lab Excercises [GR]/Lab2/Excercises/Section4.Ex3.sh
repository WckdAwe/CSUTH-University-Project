#!/bin/bash

value=$( grep -ic "benjamin" /etc/passwd )
if [ $value -ge 1 ]; then
	if [ $value -eq 1 ]; then
		echo "I found Benjamin"
	elif [ $value -eq 2 ]; then
		echo "I found two Benjamins"
	else
		echo "There are too many Benjamins"
	fi
fi
