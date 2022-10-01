#!/bin/bash

#14. Renombrando Archivos: haga un script que renombre solo archivos de un
#directorio pasado como parametro agregandole una CADENA, contemplando 
#las opciones:
#“-a CADENA”: renombra el fichero concatenando CADENA al final del nombre del 
#archivo.
#“-b CADENA”: renombra el fichero concantenado CADENA al principio del nombre 
#del archivo.

#Ejecución: ./nombreEjer directorio opción string

if [ $# -ne 3 ]; then
	echo "Cantidad de parámetros incorrectos" 
	exit 1
else 
	if [ ! -d $1 ]; then
		echo "No hay directorio" 
		exit 2
	else
		case $2 in 
			"-a")
				for i in $(ls $1)
				do
					mv $1/$i $1/$i$3
				done
				;;
			"-b")
				for i in $(ls $1)
				do
					mv $1/$i $1/$3$i
				done
				;;
			*)
				echo "Opción incorrecta"
				exit 3
				;;
		esac
	fi
fi
exit 0
