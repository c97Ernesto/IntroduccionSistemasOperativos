#!/bin/bash
#INCORRECTO: devuelve los nombres pero todos como si fueran una sola cadena
#nombreArchivos=("$(find /var/log -type f -name "*acces*" | grep acces)")

nombreArchivos=()

for i in $(find /var/log -type f -name "*acces*" | grep acces); do
	nombreArchivos+=($i) # <=> nombreArchivos[${#nombreArchivos[@]}]="$i"
done

function cantidad {
	echo "Cantidad de elementos del arreglo: ${#nombreArchivos[@]}"
}

function listar {
	echo "Nombre de los archivos: "
	echo ${nombreArchivos[@]}
}

function eliminar {
	if [ "$2" == "lógico" ]; then
		echo "Es lógico"
		#elimino de la posición recibida
		unset nombreArchivos[$1]
		#reordeno archivo
		nombreArchivos=("${nombreArchivos[@]")

	elif [ "$2" == "físico" ]; then
		echo "Es físico"
		archivo=${nombreArchivos[$1]}
		unset nombreArchivos[$1]
		nombreArchivos=("${nombreArchivos[@]}")
		rm $archivo
		echo "$archivo eliminado del file system"
	else
		echo "Parámetro incorrecto"
	fi
}

cantidad
listar
eliminar 1 físico
listar
cantidad
