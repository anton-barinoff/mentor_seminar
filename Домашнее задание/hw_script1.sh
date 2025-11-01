#!/bin/bash
set -o errexit
set -o nounset


echo "=== 1. СПИСОК ВСЕХ ФАЙЛОВ С ТИПАМИ ==="
for item in *; do
    if [ -f "$item" ]; then
        echo "Файл: $item"
    elif [ -d "$item" ]; then
        echo "Каталог: $item"
    else
        echo "Другой тип: $item"
    fi
done


echo ""
echo "=== 2. ПРОВЕРКА ФАЙЛА ==="
if [ $# -eq 0 ]; then
    echo "Ошибка: Укажите имя файла"
    exit 1
fi

if [ -e "$1" ]; then
    echo "Файл $1 существует"
else
    echo "Файл $1 не существует"
fi


echo ""
echo "=== 3. ИНФОРМАЦИЯ О КАЖДОМ ФАЙЛЕ ==="
for f in *; do
    if [ -e "$f" ]; then
        perms=$(ls -l "$f" | awk '{print $1}')
        echo "$f | Права: $perms"
    fi
done
