#!/bin/bash

while true; do
  SCRIPT_FILE="$(inotifywait scripts/ --event modify -q | cut -d ' ' -f 3)"
  SCRIPT_NAME="$(echo $SCRIPT_FILE | sed 's/^scripts\///' | sed 's/.txt$//')"
  make "${SCRIPT_NAME}"
done
