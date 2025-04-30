#!/bin/bash

QUEUE_NAME="QUEUE"
BURST_SIZE=1000
BURST_DELAY=3  # secondes
REDIS_CLI="redis-cli"

$REDIS_CLI DBSIZE >/dev/null
if ! [ $? = 0 ]; then
  echo "Erreur, pas de connection avec le serveur redis!"
  exit 1
fi

while :
do
  for ((i=0; i<BURST_SIZE; i++)); do
    $REDIS_CLI LPUSH "$QUEUE" $RANDOM >/dev/null
  done
  sleep "$BURST_DELAY"
done

