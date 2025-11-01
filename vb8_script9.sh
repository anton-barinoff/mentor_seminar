#!/bin/bash
set -o errexit
set -o nounset


echo "Введите команду для запуска в фоне: "
read user_command

# Запуск команды в фоне и получение PID
eval "$user_command" & pid=$!

echo "PID команды: $pid"
