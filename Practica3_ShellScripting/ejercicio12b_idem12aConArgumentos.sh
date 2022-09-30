#!/bin/bash
#Invocación: ./ejercicio12b_idem12aConArgumentos.sh arg1 arg2
if [ $# -ne 2 ]		#si cantParámetros != 2
then
	echo "Cantidad de parámetros incorrectos"
	exit 1
else
	echo "Suma: $(expr $1 + $2)"
	echo "Resta: $(expr $1 - $2)"
	echo "El mayor es: "
	if [ $1 -gt $2 ]
	then
		echo $1
		echo "División: $(expr $1 / $2)"
	else
		echo $2
		echo "División: $(expr $2 / $1)"
	fi
fi
exit 0
