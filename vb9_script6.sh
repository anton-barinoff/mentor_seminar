#!/bin/bash
set -o errexit
set -o nounset


[ $(( $(date +%s) - $(stat -c %Y "$1") )) -gt 60 ] && echo "Более минуты назад" || echo "Менее минуты назад"
