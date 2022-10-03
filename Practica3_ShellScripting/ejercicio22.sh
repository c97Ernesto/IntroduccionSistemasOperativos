#!/bin/bash

#22. Dada la siguiente declaración al comienzo de un script: num=(10 3 5 7 9 3 5 4) 
# (la cantidad de elementos del arreglo puede variar). Implemente la función 
# productoria dentro de este script, cuya tarea sea multiplicar todos los números 
# del arreglo.

num=(10 3 5 7 9 3 5 4)

productoria () {
	local prod=1
	for ((i=0; i < ${#num[*]}; i++)); do
		#echo "${num[i]}"
		prod=$(expr ${num[i]} \* $prod)
		#echo $prod
	done

	echo "Total: $prod"
	
	return 0 #exit Status de la función
	
}
productoria	#Invociación de función
echo $?

