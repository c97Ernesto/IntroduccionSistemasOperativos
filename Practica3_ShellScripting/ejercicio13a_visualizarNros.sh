#!/bin/bash
#Impresión del del 1 al 100 con sus cuadrados.

for ((i=0; i<=100; i++)) #C-tyle
do
	echo "Número: $i "
	echo "Cuadrado de $i: $(expr $i \* $i)"
	echo 
done
