#!/bin/bash
#Busco el directorio recibido por parámetro y si no lo encuentro
#lo creo, mostrando el resultado
if [ $# -ne 1 ]		#verificamos la cant de parámetros recibidos
then
	echo "Un parámetro (dirección de archivo)"
	exit 1		#cortamos inmediatemente la ejecución saliendo 
			#saliendo con código de error 1
else
	if [ -e $1 ]	#si el archivo existe
	then
		if [ -d $1 ] 	#si es un directorio
		then
			echo "Es un directorio"
		else
			if [ -f $1 ]	#si es un archivo ordinario
			then
				echo "Es un archivo ordinario"
			fi
		fi
	else	#si no existe archivo se crea
		mkdir $1
		echo "Se creó la carpeta en: $(ls -l $1)"
	fi
fi
