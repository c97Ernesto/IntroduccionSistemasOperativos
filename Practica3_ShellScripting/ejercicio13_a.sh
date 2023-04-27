#!/bin/bash

for ((i=1;i<=100;i++)); do
	echo "Número $i."
	echo "Cuadrado $(expr $i \* $i)"
	echo "Cuadrado $(($i * $i))"
	#forma más moderna de hacer lo anterior:
	echo "Cuadrado $(expr ${i} \* ${i})" 
done
