#!/bin/bash
set -o errexit
set -o nounset


if [ "$1" -gt "$2" ]; then
	echo "Число $1 больше чем $2"
elif [ "$1" -eq "$2" ]; then
	echo "Числа $1 и $2 равны"
else
  echo "Число $1 меньше чем $2"
fi
