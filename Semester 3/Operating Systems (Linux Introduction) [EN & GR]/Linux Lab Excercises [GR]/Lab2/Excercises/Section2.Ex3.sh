#!/bin/bash
# journal: add journal entries to the file
# $HOME/journal-file
file=$HOME/journal-file
date >> $file
echo -n "Enter name of person or group: "
read name
echo "$name" >> $file
echo >> $file
cat >> $file
#echo "----------------------------------------------------" >> $file
#echo >> $file
