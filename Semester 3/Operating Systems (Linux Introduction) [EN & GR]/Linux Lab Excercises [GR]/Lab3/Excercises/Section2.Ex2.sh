#!/bin/bash
for f in /home/vasil7112/*; do
  if [[ -d $f ]]; then
     continue
  fi
  echo "Found file -> $f"
done
