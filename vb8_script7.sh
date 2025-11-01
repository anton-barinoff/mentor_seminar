#!/bin/bash
set -o errexit
set -o nounset


add() {
    sum=$(($1 + $2))
    echo "Сумма равна: $sum"
}

add $1 $2
