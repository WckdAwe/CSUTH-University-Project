#!/bin/bash

read -p "Please type a year: " year
if [ $((year % 4)) -ne 0 ]; then
	echo "It is a common year!"
elif [ $((year % 100)) -ne 0 ]; then
	echo "It is a leap year!"
elif [ $((year % 400)) -ne 0 ]; then
	echo "It is a common year!"
else
	echo "It is a leap year!"
fi

