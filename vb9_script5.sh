#!/bin/bash
set -o errexit
set -o nounset


for f in "$1"/*; do mv "$f" "${f,,}"; done
