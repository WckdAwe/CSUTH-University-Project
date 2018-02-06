#!/bin/bash

ls -d */
var1=$(ls -d */ | sort | wc -l)
echo "Total directories: $var1"
