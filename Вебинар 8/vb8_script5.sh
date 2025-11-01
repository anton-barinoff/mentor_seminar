#!/bin/bash
set -o errexit
set -o nounset


# Переход в директорию
echo "Введите путь к директории: "
read directory

cd "$directory" || exit 1

# Добавление префикса backup_ ко всем файлам 
for file in *; do
    if [ -f "$file" ]; then
        mv "$file" "backup_$file"
        echo "$file переименован в backup_$file"
    fi
done
