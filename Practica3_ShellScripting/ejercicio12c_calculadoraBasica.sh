#!/bin/bash

if [ $# -ne 3 ]; then
	echo "Cantidad de parámetros incorrectos (* entre comillas ('*')): "
	echo "operando_1 operador operando_2"
	exit 1
else
	echo "Resultado: $[ ${1} ${2} ${3} ]"
fi
exit 0
