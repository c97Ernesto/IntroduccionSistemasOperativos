#!/bin/bash

arreglo=(Había "Había" 4 "es string" )

#Imprimir todos los elementos del arreglo
imprimir() {
	j=0
	for i in "${arreglo[@]}"; do
		j=$((j + 1))
		echo "elemento $j --> $i"
	done
	return 0
}

#Agregar "n" cantidad de elementos 
agregarElementos() {
	if [ $# -ne 1 ]; then
		echo "Tiene que ingresar la cantidad de elementos."
		return 1
	fi

	echo "Agregar elementos: "
	local elemento=""
	for ((i=0; i<$1; i++)); do
		echo "Elemento $((i+1))"
		read elemento
		arreglo[${#arreglo[@]}]="$elemento"
		#arreglo=(${arreglo[*]} "$elemento")
	done
	return 0
}

#Encontrar elemento en el arreglo
encontrarElemento() {
	if [ $# -ne 1 ]; then
		echo "Parámetros incorrectos, se debe recibir un elemento"
		return 1
	fi
	local elemento=""
	for i in "${arreglo[@]}"; do
		if [ "$1" = "$i" ]; then
			elemento="$i"
			break
		fi
	done
	if [ -z "$elemento" ]; then
		echo "El elemento "$1" proporcionado no se encontró."
	else
		echo "El elemento "$1" se encontró en el arreglo."
	fi
	return 0
}


opciones=("Encontrar elemento" "Agregar patrón de texto" "Imprimir elementos" "Salir")
select opcion in "${opciones[@]}"; do
	case "$opcion" in 
		"Encontrar elemento")
			echo -n "Ingresar elemento que desa buscar: "
			read elemento
			encontrarElemento "$elemento"
		;;
		"Agregar patrón de texto")
			echo -n "Cantidad de elementos a agregar: "
			read cant
			agregarElementos "$cant"
		;;
		"Imprimir elementos")
			imprimir
		;;
		"Salir")
			break
		;;
		*)
			echo "Opción incorrecta."
		;;
	esac
done
exit 0
