#!/bin/bash
source_dir="${1:-.}"
backup_dir="${source_dir}_backup_$(date +%Y-%m-%d)"
mkdir -p "$backup_dir"

file_count=0
for file in "$source_dir"/*; do
    if [ -f "$file" ]; then
        cp "$file" "$backup_dir/$(basename "${file%.*}")_$(date +%Y-%m-%d).${file##*.}"
        ((file_count++))
    fi
done

if [ $file_count -gt 0 ]; then
    echo "✅ Резервное копирование завершено! Файлов: $file_count"
    echo "✅ Резервное копирование завершено! Файлов: $file_count" > "backup_$(date +%Y-%m-%d).log"
else
    echo "⚠️ Файлов не найдено"
fi
