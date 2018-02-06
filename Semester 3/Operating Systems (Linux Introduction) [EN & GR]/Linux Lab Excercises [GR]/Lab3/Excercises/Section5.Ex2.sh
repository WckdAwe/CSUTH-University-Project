#!/bin/bash
foo=(a b c)
bar=$foo
echo ${bar[1]}
echo "=========="
array=(a b c)
echo $array
echo ${array[@]}
echo ${array[*]}
echo "=========="
bar=("${foo[@]}")
echo ${bar[1]}
echo "=========="
foo=("a 1" "b 2" "c 3")
bar=(${foo[@]})
baz=("${foo[@]}")
echo ${bar[1]}
echo ${baz[1]}
echo "=========="
