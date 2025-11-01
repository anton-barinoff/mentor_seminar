#!/bin/bash
set -o errexit
set -o nounset


read -rp "Введите имя файла: "; wc -l < $REPLY
