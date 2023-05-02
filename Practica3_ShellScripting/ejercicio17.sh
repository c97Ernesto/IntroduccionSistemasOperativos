#!/bin/bash

if [ $# -ne 0 ]; then
	echo "El script no lleva parámetros."
	exit 1
else
	for archivo in "$(ls .)"; do
#		echo "$archivo"
		nombre=$(echo "$archivo" | tr '[:lower:][:upper:]' '[:upper:][:lower:]')
		echo $(echo "$nombre" | tr -d 'aA')
	done
fi
exit 0
