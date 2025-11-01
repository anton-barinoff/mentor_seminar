#!/bin/bash
set -o errexit
set -o nounset

sleep 3 &
echo "test1" && sleep 5 &
ping -n 4 8.8.8.8 &
echo "test2" &
sleep 4 &

wait

echo "Все команды завершены"
