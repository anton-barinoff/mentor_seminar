#!/bin/bash
set -o errexit
set -o nounset
set -o monitor


echo "Запуск 3 команд sleep в фоновом режиме"

sleep 30 &
sleep 60 & 
sleep 90 &

echo "Статус задач:"
jobs

echo ""
echo "Выполнение вручную:"
echo "fg 1   # вывести задачу 1"
echo "Ctrl+Z # приостановка"
echo "bg 1   # возобновление в фоновом режиме"
echo "jobs   # Статус задач"
jobs

wait
echo "Задачи завершены"
