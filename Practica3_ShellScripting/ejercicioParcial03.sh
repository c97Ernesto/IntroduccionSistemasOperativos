#!/bin/bash
#Realice un script que implemente a través de la utilización de un arreglo las siguientes funciones: 
arreglo=(7 "marco" polo)

#No es necesario
imprimir () {
	if [ $# -ne 0 ]; then
		"Parámetros incorrectos"
		return 1
	else
		echo "Contenido arreglo: ${arreglo[*]}"
		echo "Cantidad de Elementos: ${#arreglo[*]}"
	fi
	return 0
}

#La función recibe un parámetro (debe validar que así sea). Agrega al final del
#arreglo el elemento recibido como parámetro.
insertarElemento () {
	if [ $# -ne 1 ]; then
		echo "Parámetros incorrectos"
		return 1
	else
		arreglo=(${arreglo[*]} $1)
		imprimir
	fi
	return 0
}

#rellenar n: Itera n veces solicitando al usuario que ingrese un patrón de texto y 
#lo agrega al final del arreglo. Debe validar que se reciba 1 parámetro.
rellenar () {
	if [ $# -ne 1 ]; then
		echo "Parámetros incorrectos"
		return 1
		
	else
		echo "Ingrese patron de texto, $1 veces:"
		for ((i = 0; i < $1; i++)); do
			read texto
			arreglo=(${arreglo[*]} $texto)
			imprimir
		done
	fi
	return 0
}

#Recibe un parámetro, debe validar que así sea:
#	Si el parámetro es *, entonces imprimirá todos los elementos del arreglo.
#	Si el parámetro es distinto a *, deberá verificar si en el arreglo existe un
#	elemento que sea igual al paránetro. Si existe deberá imprimirlo en pantalla, 
#	caso contrario imprimiŕa "Elemento no encontrado".
selectElemento () {
	if [ $# -ne 1 ]; then
		echo "Cantidad de parámetros incorrectos"
		return 1
	else
		case $1 in
			"*")
				echo "Todos los elementos: "
				imprimir
			;;
			*)
				for ((i = 0; i < ${#arreglo[*]}; i++)); do
					if [ $1 == "${arreglo[i]}" ]; then
						echo "Se encontró parámetro: ${arreglo[i]}"
						break
					fi
				done
				if [ $1 != "${arreglo[i]}" ]; then
					echo "No se encontró elemento"
				fi
			;;
		esac
	fi
	return 0
}

echo "	MENU" 
select option in "Insertar un elemento" "Agregar patron de texto" "Imprimir el/todos los elementos" "Tomarse el palo"; do
	case $option in
		"Insertar un elemento")
			echo "Ingrese elemento a insertar en arreglo: "
			read elemento
			insertarElemento $elemento
		;;
		"Agregar patron de texto")
			echo "Ingrese cantidad de veces a iterar: "
			read cantidad
			rellenar $cantidad
		;;
		"Imprimir el/todos los elementos")
			echo "Ingrese elemento('*' muestra todos): "
			read elemento
			selectElemento  $elemento
		;;
		"Tomarse el palo")
			exit 0
		;;
	esac
done
