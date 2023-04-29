#!/bin/bash

opciones=("-a" "-b")

if [ $# -ne 3 ]; then
	echo "Parámetros incorrectos. Se necesita directorio, opción y 'cadena'."
	exit 1
else
	if [ ! -d $1 ]; then
		echo "No existe directorio."
		exit 2
	else
		case $2  in
			"-a")
				for archivo in $(ls $1); do
					mv "$1/$archivo" "$1/$archivo$3"
				done
			;;
			"-b")
				for archivo in $(ls $1); do
					mv "$1/$archivo" "$1/$3$archivo"
				done
			;;
			*)
				echo "Opción incorrecta."
				exit 1
		esac
	fi
fi	
exit 0
