#!/bin/bash
set -o errexit
set -o nounset


echo "Бот запущен"
echo "Доступные команды: дата, время, папка, выход"

while true; do
    read -p "Введите команду: " cmd
    
    case $cmd in
        "дата")
            echo "Текущая дата: $(date +"%d.%m.%Y")"
            ;;
        "время")
            echo "Текущее время: $(date +"%H:%M:%S")"
            ;;
        "папка")
            echo "Текущая папка: $(pwd)"
            ;;
        "выход")
            echo "До свидания!"
            exit 0
            ;;
        *)
            echo "Неизвестная команда: $cmd"
            echo "Доступные команды: дата, время, папка, выход"
            ;;
    esac
done
