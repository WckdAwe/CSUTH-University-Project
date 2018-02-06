# !/bin/bash
function is_leap_year {
  if [ $(($1 % 4)) -ne 0 ]; then
  	echo "It is a common year!"
  elif [ $(($1 % 100)) -ne 0 ]; then
  	echo "It is a leap year!"
  elif [ $(($1 % 400)) -ne 0 ]; then
  	echo "It is a common year!"
  else
  	echo "It is a leap year!"
  fi

}

read -p "Please type a year: " year
is_leap_year year
