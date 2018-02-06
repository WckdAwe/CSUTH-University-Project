#!/bin/bash
if [[ $# -eq 0 ]]; then
  echo "Argument1 must be a filename"
  exit 1
fi
found=0
for f in /etc/*; do
  echo "Checking file: " $f
  if [[ -f $f && $(basename $f) == $1 ]]; then
    echo "Found file $f"
    found=1
    break
  fi
done

if [[ $found -eq 0 ]]; then
  echo "File was not found!"
fi
