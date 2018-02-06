#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo "You need to run this script as superuser"
else
	clobberEnabled=$(set -o | grep noclobber | sed 's/noclobber//g' | tr -d "[:space:]")
	echo $clobberEnabled 	
	if [ $clobberEnabled = "on" ]; then
		echo "Clobber is enabled!"
	else
		echo "Clobber is disabled!"
	fi
fi
