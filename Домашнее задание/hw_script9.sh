#!/bin/bash
set -o errexit
set -o nounset


echo "=== МОНИТОРИНГ РЕСУРСОВ СИСТЕМЫ ==="
echo "Время проверки: $(date)"

# 1. Мониторинг дискового пространства
echo ""
echo "ДИСКОВОЕ ПРОСТРАНСТВО:"
df -h | awk 'NR>1 {print $5 " " $6}' | while read output; do
    usage=$(echo $output | awk '{print $1}' | sed 's/%//')
    partition=$(echo $output | awk '{print $2}')
    
    if [ $usage -ge 80 ]; then
        echo "$partition заполнен на $usage%"
    else
        echo "$partition: $usage%"
    fi
done

# 2. Мониторинг использования памяти
echo ""
echo "ИСПОЛЬЗОВАНИЕ ПАМЯТИ:"
if command -v powershell &> /dev/null; then
    memory_info=$(powershell -Command "\$os = Get-WmiObject -Class Win32_OperatingSystem; \$used = \$os.TotalVisibleMemorySize - \$os.FreePhysicalMemory; [math]::Round((\$used / \$os.TotalVisibleMemorySize) * 100, 2)" 2>/dev/null)
    
    if [ ! -z "$memory_info" ]; then
        memory_percent_rounded=$(printf "%.0f" "$memory_info")
        echo "Использовано памяти: $memory_percent_rounded%"
        
        if [ $memory_percent_rounded -gt 80 ]; then
            echo "ВНИМАНИЕ: Использование памяти превышает 80%!"
            echo "Рекомендуется закрыть неиспользуемые приложения"
        fi
    else
        echo "Ошибка: Не удалось получить информацию о памяти"
    fi
else
    echo "Ошибка: PowerShell недоступен для проверки памяти"
fi

# 3. Мониторинг загрузки CPU
echo ""
echo "ЗАГРУЗКА ПРОЦЕССОРА:"
if command -v powershell &> /dev/null; then
    cpu_usage=$(powershell -Command "(Get-WmiObject -Class Win32_Processor).LoadPercentage" 2>/dev/null)
    if [ ! -z "$cpu_usage" ]; then
        echo "Загрузка CPU: $cpu_usage%"
    else
        echo "Ошибка: Не удалось получить загрузку CPU"
    fi
else
    echo "Ошибка: PowerShell недоступен для проверки CPU"
fi

echo ""
echo "=== ПРОВЕРКА ЗАВЕРШЕНА ==="
