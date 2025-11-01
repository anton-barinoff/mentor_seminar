#!/bin/bash
set -o errexit
set -o nounset


# Запрос имени
echo "Введи свое имя"
read name

# Запрос возраста
echo "Введи свой возраст"
read age

# Расчет возраста через год
new_age=$((age + 1))

# Результат
echo "Привет, "$name"! Через год тебе будет "$new_age" лет."
