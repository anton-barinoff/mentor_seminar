#!/bin/bash
set -o errexit
set -o nounset


echo "Введите путь к директории:"
read directory

find "$directory" -type f -mtime +7 -delete
