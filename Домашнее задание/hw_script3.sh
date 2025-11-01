#!/bin/bash
set -o errexit
set -o nounset

echo "Введите число: "
read number

# Проверка с if
if [ "$number" -gt 0 ]; then
    echo "Число $number положительное"
elif [ "$number" -lt 0 ]; then
    echo "Число $number отрицательное"
else
    echo "Число $number равно нулю"
fi


# Подсчет с while (только для положительных чисел)
if [ "$number" -gt 0 ]; then
    echo ""
    echo "Счёт от 1 до $number:"
    counter=1
    while [ $counter -le $number ]; do
        echo $counter
        ((counter++))
    done
fi
