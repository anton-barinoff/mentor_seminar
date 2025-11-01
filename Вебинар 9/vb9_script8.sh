#!/bin/bash
set -o errexit
set -o nounset


ls -tr $1 | grep .log | head -5
