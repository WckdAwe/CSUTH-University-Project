#!/bin/bash
function show_home_directory_files {
  for f in /home/vasil7112/*; do
    if [[ -d $f ]]; then
       continue
    fi
    echo "Found file -> $f"
  done
}

show_home_directory_files
