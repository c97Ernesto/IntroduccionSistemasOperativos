#!/bin/bash

#verifico que la cantidad de parámetros recibida sea correcta.
if [ $# -ne 1 ]; then
	echo "Se tiene que ingresar nombre del archivo/directorio."
	exit 1
fi

#verificamos si existe el archivo/direcotrio con el comando -e y colocamos 
#entre comillas $1 para que cualquier espacio en blanco o caracter especial
#en el nombre del archivo, se considere como parte del nombre del mismo.
if [ -e "$1" ]; then
	echo "El nombre recibido como parámetro existe."
	if [ -f "$1" ]; then
		echo "Es un archivo regular."
	elif [ -d "$1" ]; then
		echo "Es un directorio."
	fi
else
	mkdir $1
	echo "Directorio creado correctamente."
fi
exit 0
