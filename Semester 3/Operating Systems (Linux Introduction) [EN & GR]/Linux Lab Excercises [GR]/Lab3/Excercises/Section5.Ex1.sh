#!/bin/bash
table1=(a b c)
table2=(d e f)
table3=${table1[@]}
table3+=" ${table2[@]}"
echo ${table1[@]}
echo ${table2[@]}
echo ${table3[@]}
