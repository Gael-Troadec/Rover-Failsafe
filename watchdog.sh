#!/bin/bash

# Ping earth_server toutes les 30 sec
# Si 3 fails consecutifs → kill rover_motor.py + log JSON

FAIL_COUNT=0
LOG_FILE="failsafe.log"

while true; do
  if ./earth_server.sh; then
    FAIL_COUNT=0
  else
    ((FAIL_COUNT++))
    if [ $FAIL_COUNT -ge 3 ]; then
      TIMESTAMP=$(date -Iseconds)
      pkill -f rover_motor.py
      echo "{\"timestamp\":\"$TIMESTAMP\",\"event\":\"LOSS_OF_SIGNAL\",\"action\":
\"MOTOR_SHUTDOWN\"}" >> $LOG_FILE
      exit 0
    fi
  fi
  sleep 30
done
