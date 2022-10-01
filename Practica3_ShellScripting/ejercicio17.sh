#!/bin/bash
#17. Escribir un script que al ejecutarse imprima en pantalla los nombre de 
#los archivos que se encuentran en el directorio actual, intercambiando 
#minúsculas por mayúsculas, además de eliminar la letra a (mayúscula 
#o minúscula).

for i in $(ls)
do
	echo "$(echo $i | tr "[a-z] [A-Z]" "[A-Z] [a-z]" | tr -d "aA")"	
done
