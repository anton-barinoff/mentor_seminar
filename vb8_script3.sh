#!/bin/bash
set -o errexit
set -o nounset


read -p "Укажите директорию: " dir
tar -czvf $(date +"%Y-%m-%d").tar.gz $dir
