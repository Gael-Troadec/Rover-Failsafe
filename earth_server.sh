#!/bin/bash

#!/bin/bash
# Simule une perte de signal: 30% de chances de fail
if [ $((RANDOM % 10)) -lt 3 ]; then
  exit 1
else
  echo "OK"
fi
