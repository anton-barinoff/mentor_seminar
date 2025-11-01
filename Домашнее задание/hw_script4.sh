#!/bin/bash
set -o errexit
set -o nounset

# Функция приветствия
hello() {
    echo "Hello, $1"
}

# Функция для сложения чисел
add() {
    echo $(($1 + $2))
}


echo "=== ДЕМОНСТРАЦИЯ ==="

# Вызов функции приветствия
hello "$1"
#hello "Anton"

echo ""

# Вызов функции сложения
echo "Сумма чисел $2 и $3: $(add $2 $3)"
#echo "Сумма 20 и 5: $(add 20 5)"
