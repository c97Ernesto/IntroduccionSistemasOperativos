#!/bin/bash

#Si no tengo permiso para ejecutar -> bash ejercicio16_crearReporteTxt.sh
#cat /etc/passwd | cut -d: -f 1,6 obtengo el nombre del usuario
#y la ruta del directorio personal del usuario.
#Salteamos los usuarios que no tienen un directorio 
#personal (/nonexistent).
#Con la salida del comando anterior obtengo lo que necesito 
#para ir iterando sobre los valores que tenemos y generar el reporte.

#obtenemos de etc/passwd: nombreUsuario:/home/Usuario .
if [ $# -eq 0 ]; then
	echo "Se debe especificar la extensión"
	exit 1
fi

#hacemos una asignación destructiva al archivo reportes.txt
#para limpiar el contenido del archivo si existía.
echo > reporte.txt	

for i in $(cat /etc/passwd | cut -d: -f 1,6); do	
	
	#nos quedamos con el contenido de los campos, imprimiendo
	#el contenido de la variable i.
	user=$(echo $i | cut -d: -f1)	
	home=$(echo $i | cut -d: -f2)
	
	#verificamos directorio personal de los usuarios.
	if [ -d $home ]; then
		#para que las líneas creadas en cada pasada del for no se pisen
		#usamos el comando no destructivo >> .
		echo $user $(find $home -name "*.$1" | wc -l) >> reporte.txt
	fi
done

