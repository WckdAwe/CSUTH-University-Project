#!/bin/bash

read -p "Please type a PATH: " var_path
if [ -d "$var_path" ]; then
	ls -a $var_path
	var2=$(ls -a $var_path | wc -l)
	echo "Total elements found: $var2"
else
	echo "No such file or directory"
fi
