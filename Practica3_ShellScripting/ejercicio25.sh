#!/bin/bash

usuarios=()

if [ $# -gt 2 ]; then
	echo "Cantidad de parámetros incorrectos, máximos 2."
	exit 1
fi

grupo="adm"

for usuario in $(cat /etc/group | grep "^$grupo" | cut -d":" -f4 | tr "," " "); do
	usuarios+=($usuario)
done

case $1 in
	"-b")
		if [ $2 -le ${#usuarios[@]} ]; then
			echo ${usuarios[${usuario[$2]-1}]}
		else
			echo "El índice ingresado como parámetro no es menor o igual a la cantidad de elementos en el arreglo"
			exit 2
		fi
	;;
	"-l")
		echo "La cantidad de usuarios del grupo $grupo es: ${#usuarios[@]}"
	;;
	"-i")
		echo "Usuarios del grupo $grupo: ${usuarios[@]}"
	;;
	*)
		echo "Parámetro incorrecto"
		exit 3
	;;
esac
exit 0
