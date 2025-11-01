#!/bin/bash
set -o errexit
set -o nounset


ping -n 1 $1 > /dev/null && echo "Сервер $1 доступен" || echo "Сервер $1 недоступен"
