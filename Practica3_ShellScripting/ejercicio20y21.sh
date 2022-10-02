#!/bin/bash

#20. Realice un script que simule el comportamiento de una estructura 
#de PILA e implemente las siguientes funciones aplicables sobre una 
#estructura global definida en el script:
#	push: Recibe un parámetro y lo agrega en la pila 
#	op: Saca un elemento de la pila 
#	length: Devuelve la longitud de la pila 
#	print: Imprime todos elementos de la pila

#declaración de vector
pila=()		

#declaración de funciones
push () {	
	# pila[pila.length] = parámetro  -->	${#arreglo[*]} = tamanio de arreglo
	pila[${#pila[*]}]=$1	
}

pop () {
	# aux = pila[pila.length-1]
	aux=${pila[$(expr ${#pila[*]}-1)]}
	# array.lenght-= 1  no elimino posición(queda vacía, no es dinámico)
	unset pila[$(expr ${#pila[*]}-1)]
	return $aux
}

lenght () {
	return ${#pila[*]}
}

print () {
	echo "${pila[*]}"
}

push 3
lenght
echo "El tamaño de la pila es: $?"
echo "Elementos Pila: $(print)"

push 21
lenght
echo "El tamaño de la pila es: $?"
echo "Elementos Pila: $(print)"

push 7
lenght
echo "El tamaño de la pila es: $?"
echo "Elementos Pila: $(print)"

push 123
lenght
echo "El tamaño de la pila es: $?"
echo "Elementos Pila: $(print)"

pop
echo "Se eliminó el elemento $? de la pila"
lenght
echo "El tamaño de la pila es: $?"
echo "Elementos Pila: $(print)"

push 123
lenght
echo "El tamaño de la pila es: $?"
echo "Elementos Pila: $(print)"
