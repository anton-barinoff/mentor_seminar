#!/bin/bash
set -o errexit
set -o nounset


echo "Выберите диск для проверки: "
read disk

usage=$(df "$disk" 2>/dev/null | awk 'NR==2 {print $5}' | sed 's/%//')

if [ -z "$usage" ]; then # Проверка существования диска
    echo "Диск $disk не найден"
else
    echo "Использование диска $disk: $usage%"
    [ $usage -gt 80 ] && echo "ВНИМАНИЕ: Использовано более 80%!"
fi
