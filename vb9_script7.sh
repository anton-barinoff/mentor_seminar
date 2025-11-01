#!/bin/bash
set -o errexit
set -o nounset


TOKEN="7062062326:AAHTu5KR0ZTlCt1mTzMJzTcZd61_KRBCNNc"
CHAT_ID="628287149"
MESSAGE=$1

curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
     -d chat_id="$CHAT_ID" \
     -d text="$MESSAGE"

echo "Сообщение отправлено"
