#!/bin/bash
function file_found {
  if [[ $1 -eq 0 ]]; then
    echo "File was not found!"
  else
    echo "File was found!"
  fi
}

function search_file {
  found=0
  for f in /etc/*; do
    echo "Checking file: " $f
    if [[ -f $f && $(basename $f) == $1 ]]; then
      found=1
      break
    fi
  done
  file_found $found
}

if [[ $# -eq 0 ]]; then
  echo "Argument1 must be a filename"
  exit 1
fi
search_file $1
