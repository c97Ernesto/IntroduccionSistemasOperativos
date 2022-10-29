#!/bin/bash

#Se desea saber el uso del consumo de recursos del sistema por parte de los 
#usuarios. Desarrolle un script que se correrá ingresando como argumento los 
#nombres de los usuarios de los cuales se necesita obtener dicha información, no
#se sabe cuántos son con anticipación.
#Para la realización del script debe definir las siguientes funciones:
#	esta_loguado(): devuelve true si el usuairo pasado como argumento está 
#	logueado.
#	cant_procesos(): devuelve la cantidad de procesos que está corriendo un 
#	usuario.
#	uso_de_procesos(): devuelve true si el usuario pasado como argumento, usando la 
#	funcion cant_procesos, está corriendo más de 100.
#	procesos.
#Utilizando la funcionallidad anterior, el script debe guardar en un archivo de 
#log, en una ubicación apropiada en el file system, el nombre de los usuarios que 
#estén corriendo más de 100 procesos junto con la fecha de ejecución del script.

#ps U <userName> | wc -l	--> nro de procesos del usuario

usuarios=($*)
#Una funcion bash no puede devolver un string directamente, pero podemos:
#echo a string - retornar exit status - o compartir variable.
estaLogueado(){	#devuelve true si el usuario pasado como argumento está logueado
	if [ $# -eq 0 ]; then
		return 2
	else
		if [ "$(who | grep $1 | cut -d" " -f1)" == $1 ]; then
			return 0	#retornamos true
		else
			return 1	#false
		fi
	fi
}

cantProcesos(){	#devuelve la cantidad de procesos que está corriendo un usuario
	echo "$(ps U $1 | wc -l)"
	return 0
}

usoDeProcesos(){ #devuelve true si la cantidad de procesos del usuario +100	
	if [ $# -eq 0 ]; then
#		echo "No se ingresó usuario"
		return 2
	else		
		procesos=$(cantProcesos $1)
		if [ $procesos -gt 100 ]; then
#			echo "La cantidad de procesos es mayor a 100 --> $procesos."
			return 0
		else
#			echo "La cantidad de procesos es menor o igual a 100 --> $procesos."
			return 1
		fi
	fi
}


if [ $# -eq 0 ]; then
	echo "Cantidad de parámetros incorrectos"
	exit 1
else

	touch /var/log/archivoDeLogs
	archivoDeLogs=/var/log/archivoDeLogs
		
	for usuario in ${usuarios[*]}; do
		estaLogueado $usuario
		if [ $? -eq 0 ]; then
#			echo $usuario
			usoDeProcesos $usuario
			if [ $? -eq 0 ]; then
				$(echo "$usuario" >> $archivoDeLogs)
				#echo "mayor a 100"
			else
				$(ps U $1 | wc -l  >> $archivoDeLogs)
				#echo "menor a 100"
			fi
		fi
	done
fi




