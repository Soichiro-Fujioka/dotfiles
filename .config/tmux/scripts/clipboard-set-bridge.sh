#!/bin/sh

value=$(cat)

[ -n "$value" ] || exit 0

printf %s "$value" | curl -fsS --data-binary @- http://127.0.0.1:8765/set >/dev/null
