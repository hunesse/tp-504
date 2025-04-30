#!/bin/bash

QUEUE_NAME="QUEUE"
THRESHOLD=30000
DELAY_PROCESS=4 
CSV_FILE="issue.csv"
REDIS_CLI="redis-cli"

$REDIS_CLI DBSIZE >/dev/null
if ! [ $? = 0 ]; then
  echo "Erreur, pas de connection avec le serveur redis!"
  exit 1
fi	

if [ ! -f "$CSV_FILE" ]; then
  echo "timestamp;threshold;value" > "$CSV_FILE"
fi

while :
do	
  ls=$($REDIS_CLI --raw LLEN "$QUEUE")
  
  if [ "$ls" -gt 0 ]; then
    value=$($REDIS_CLI --raw RPOP "$QUEUE")
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    
    echo "$timestamp;$THRESHOLD;$value" >> "$CSV_FILE"
    echo "Valeur reçue : $value"

    if [ "$value" -gt "$THRESHOLD" ]; then
      echo "ALARME ! Valeur élevée : $value"
      sleep "$DELAY_PROCESS"
    fi
  else
    echo "Liste vide, attente 2s."
    sleep 2
  fi
done

