#!/bin/bash
set -o errexit
set -o nounset


grep -o -w "$2" "$1" | wc -l
