#!/bin/bash

#Realice un script que mueva todos los programas del directorio actual (archivos
#ejecutables) hacia el subdirectorio "bin" del directorio HOME del usuario actualment
#logueado. El script debe imprimir en pantalla los nombres de los que mueve, e 
#indicar cuántos ha movido, o que no ha movido ninguno. Si el directorio "bin" no 
#existe, deberá ser creado.

if [ $# -ne 0 ]; then	
	exit 1
	
else
	if [ -e $HOME/bin ]; then
		echo "Existe directorio"
	else
		echo "Creo directorio $HOME/bin"
		mkdir $HOME/bin
	fi
	
	echo "ok"

	# find <directorio> <-modo_de_búsqueda> <criterio_de_búsqueda>
	for i in $(find . -name "*.exe"); do
		echo $i
		#mv <archivo> <directorio_destino>
		mv $i $HOME/bin
	done
fi
exit 0
