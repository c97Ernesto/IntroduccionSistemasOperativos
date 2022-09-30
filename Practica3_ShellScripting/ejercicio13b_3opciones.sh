#!/bin/bash
#Después de ejecutado el script el usuario ingresa un número de acuerdo
#a la opción elegida.
#No olvidar tildes y comillas.
if [ $# -ne 0 ]
then
	echo "No parámetros"
	exit 1
else
	select var in "Listar" "Dónde Estoy?" "Quién Está?" "Salir"
	do
		case $var in
			"Listar")
				echo "$(ls)"
			;;
			"Dónde Estoy?")
				echo "$(pwd)"
			;;
			"Quién Está?")
				echo "$(who)"
			;;
			"Salir")
				exit 0
			;;
		esac
	done
fi

