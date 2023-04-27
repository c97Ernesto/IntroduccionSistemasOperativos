#!/bin/bash
#Realizar un script q

if [ $# -ne 3 ]; then
	echo "Parámetros incorrectos"
	exit 1
else
	case "$2" in
		+ | - | "*" | /)
			echo "$(($1 $2 $3))"
			exit 0
		;;
		*)
			echo "Segundo parámetro operador inválido."
			exit 2
	esac
fi
