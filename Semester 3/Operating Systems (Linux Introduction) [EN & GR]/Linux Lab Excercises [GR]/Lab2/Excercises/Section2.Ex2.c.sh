#!/bin/bash

var1=$(ls -a /etc | wc -l)
echo "A total of $var1 items found in /etc"
read -p "Type an alphanumeric character: " var2
ls -d /etc/*$var2*
var3=$(ls -d /etc/*$var2* | wc -l)
echo "A total of $var3 items found in /etc/*$var2*"
