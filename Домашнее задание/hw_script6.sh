#!/bin/bash
set -o errexit
set -o nounset


# 1. Чтение данных из input.txt
cat input.txt

# 2. Перенаправление вывода wc -l в output.txt
wc -l < input.txt > output.txt

# 3. Перенаправление ошибок ls в error.log
ls nonexistent_file 2> error.log
