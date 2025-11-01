#!/bin/bash
set -o errexit
set -o nounset


# Добавление команды в файл .bashrc
echo "alias ll='ls -la'" >> ~/.bashrc 

# Перезапуск терминала
source ~/.bashrc
