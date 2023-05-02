#!/bin/bash
array1=()
array2=()

function push {
	#colocar entre comillas para que no tome los elementos por separados
	#si hay espacios, o por si hay algún elemento expecial.
	array1+=("$1") 
	array2[${#array2[@]}]="$1"
}

function length {
	echo "Cantidad de elementos en Arreglo1: ${#array1[@]}"
	echo "Cantidad de elementos en Arreglo2: ${#array2[@]}"
}

function print {
	echo "Elementos en Arreglo1: ${array1[@]}"

	echo "Elementos en Arreglo2: "
	for i in "${array2[@]}"; do
		echo "$i"
	done
}

function pop {
	elemArray1=${array1[${#array1[@]}-1]}
	unset array1[${#array1[@]}-1]
	echo "Elimino $elemArray1 de Arreglo1"

	elemArray2=${array1[$(expr ${#pila[@]}-1)]}
	unset array2[$(expr ${#pila[@]}-1)]
	echo "Elimino $elemArray2 de arreglo2"	
}

push "elemento 1"
push "elemento 2"
push "elemento 3"
print
length
pop
length
pop
length
