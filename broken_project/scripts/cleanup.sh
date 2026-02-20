#!/usr/bin/env bash

echo "Cleaning empty files..."

for file in $(ls ./data); do

	#echo Сейчас мы тут: $file

	if [[ $(cat ./data/"$file" | wc -l) -eq 0 ]]; then
		echo "Removing $file"
		rm ./data/"$file"
		exit 0
	fi
done
