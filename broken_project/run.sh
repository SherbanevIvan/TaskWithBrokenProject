#!/usr/bin/env bash

echo "Starting project..."

# source <file> позволяет использовать переменные, хранящиеся внутри него
source config.txt

echo "Mode: $MODE"
echo "Timeout: $TIMEOUT"

if [[ -z "$SECRET_KEY" ]]; then
	echo "ERROR: SECRET_KEY is not set"
fi

echo "Loading users..."

users=()

# "read" читает текст, который вы запишете "во время" работы скрипта!! по сути input
# см. reader.sh

while read -r user; do
	users+=("$user")

	#< users.txt

	#echo "$user" >> users.txt
done < users.txt

echo "Users count: ${#users[@]}"

for u in "${users[@]}"; do
	echo "User: $u"
done

echo "Analyzing logs..."

#cat ./logs/*.log | grep "ERROR" | wc -1

errors=$(cat ./logs/*.log | grep -h "ERROR" | wc -l)
warnings=$(cat ./logs/*.log | grep -h "WARNING" | wc -l)

echo "Errors: $errors"
echo "Warnings: $warnings"

echo "Processing data files..."

txt_files=($(ls ./data/*.txt))

echo "Found files: ${#txt_files[@]}"

for f in "${txt_files[@]}"; do
	echo "File: $f"
	echo "Lines: $(wc -l < "$f")"
done

./scripts/calc.sh 5 10

./scripts/cleanup.sh

echo "Done."
