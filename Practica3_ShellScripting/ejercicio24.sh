#!/bin/bash
# Dada la definición de 2 vectores del mismo tamaño y cuyas longitudes no se conocen.
# Complete este script de manera tal de implementar la suma elemento a elemento entre
# ambos vectores y que la misma sea impresa en pantalla.

if [ $# -ne 0 ]; then
	exit 1
else

	vec1=(1 80 65 35 2)
	vec2=(5 98 3 41 8)
	
	for ((i=0; i < ${#vec1[*]}; i++)); do
		echo "La suma de los elementos de la posición ${i} de los vectores es $(expr ${vec1[i]} + ${vec2[i]})"
	done
fi
