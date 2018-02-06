# !/bin/bash
function show_dates {
  days=(Monday Tuesday Wednesday Thursday Friday Saturday)
  for day in ${days[*]}; do
    echo "$day"
  done
}

show_dates
