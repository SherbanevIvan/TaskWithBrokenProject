#!/usr/bin/env bash

if [[ -z "$1" || -z "$2" ]]; then
  echo "Need two numbers"
  exit 1
fi

echo "Result: " $(($1 + $2))
