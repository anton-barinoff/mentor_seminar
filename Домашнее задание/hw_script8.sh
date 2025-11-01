#!/bin/bash


source_dir="${1:-.}"
log_file="backup_$(date +%Y-%m-%d).log"

{
echo "=== НАЧАЛО РЕЗЕРВНОГО КОПИРОВАНИЯ ==="
echo "Источник: $source_dir"
echo "Время: $(date)"

backup_dir="${source_dir}_backup_$(date +%Y-%m-%d)"
mkdir -p "$backup_dir"

file_count=0
for file in "$source_dir"/*; do
    if [ -f "$file" ]; then
        new_name="$(basename "${file%.*}")_$(date +%Y-%m-%d).${file##*.}"
        cp "$file" "$backup_dir/$new_name"
        echo "Файл скопирован: $(basename "$file") → $new_name"
        ((file_count++))
    fi
done

echo "=== ЗАВЕРШЕНИЕ ==="
echo "Резервное копирование завершено | Скопировано файлов: $file_count"
echo "Директория: $backup_dir"
} | tee "$log_file"
