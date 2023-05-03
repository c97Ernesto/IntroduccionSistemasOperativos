#Realice un script que implemente a través de la utilización de funciones, las 
#operaciones básicas sobre arreglos:


#iniciar: Crea un arreglo llamado array vacío.
iniciar () {
	arreglo=();
	echo "Arreglo inicializado.";
}

#agregar_elem <parametro1>: Agrega al final del arreglo el parámetro recibido.
agregar_elem () {
	if [ $# -ne 1 ]; then
		echo "Ingrese un parámetro:"
		return 1;
	fi

	#para la asignación copiamos todo el arreglo al a uno nuevo y le agregamos el elemento
	arreglo=(${arreglo[@]} $1)	# <=> arreglo+=($1)
	echo "Elemento $1 agregado."
	return 0
}

#eliminar_elem <parametro1>: Elimina del arreglo el elemento que se encuentra
#en la posición recibida como parámetro. Debe validar la posición.
eliminar_elem () {
	if [ $# -ne 1 ]; then
		echo "Ingrese un parámetro:"
		return 1
	fi

	if [ $1 -ge ${#arreglo[*]} ]; then
		echo "Posición inválida."
		return 2
	fi

	unset arreglo[$1];
	#hacemos la asignación de la impresión del arreglo para arreglar el problema
	#de la posicion vacía.
	arreglo=(${arreglo[@]})
	echo "Elemento $1 eliminado."
	return 0
}

#longitud: Imprime la longitud del arreglo en pantalla
longitud () {
	echo ${#arreglo[@]}
	return 0
}

#imprimir: Imprmime todos los elementos del arreglo
imprimir () {
	echo ${arreglo[@]}
	return 0
}

#inicializar_con_valores <parámetro1> <parámetro2>: Crea un arreglo con longitud
#<parámetro1> y en todas las posiciones asigna el valor <parámetro2>.
inicializar_con_valores () {
	if [ $# -ne 2 ]; then
		echo "Cantidad incorrecta de parámetros.";
		return 1;

	else
		iniciar
		for ((i=0; i < $1; i++)); do
			agregar_elem $2
		done
		echo "Arreglo inicializado con $1 veces el valor $2."
	fi
	return 0
}

#CREAMOS MENÚ
echo "Seleccione una opción: "
select action in iniciar agregar_elem eliminar_elem longitud imprimir inicializar_con_valores Salir; do
	case $action in
		"iniciar")
			iniciar
		;;
		"agregar_elem")
			echo "Ingresar un elemento: "
			read elemento
			agregar_elem $elemento
		;;
		"eliminar_elem")
			echo "Indique posición a eliminar: "
			read posicion
			eliminar_elem $posicion
		;;
		"longitud")
			echo "El arreglo tiene $(longitud) elementos."
		;;
		"imprimir")
			echo "Arreglo: $(imprimir)"
		;;
		"inicializar_con_valores")
			echo "Ingrese cantidad: "
			read cantidad
			echo "Ingrese valor: "
			read valor
			inicializar_con_valores $cantidad $valor
		;;
		"Salir")
			echo "Proceso finalizado."
			break
		;;
	esac
done
exit 0
