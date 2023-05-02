#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Se debe recibir al menos 1 parámetro."
	exit 1
fi
#En bash no en necesario declarar la variable porque es un lenguaje de
#tipado dinámico, las variables se crean automaticamente cuando se les
#asigna un valor por primera vez
parametros=("$@")
for (( i=0; i<${#parametros[@]}; i++ )); do
	if (( i % 2 != 0 )); then
		if [ -e ${#parametros[i]} ]; then
			if [ -f ${#parametros[i]} ]; then
				echo "Es un archivo"
			elif [ -d ${#parametros[i]} ]; then
				echo "Es un directorio"
			fi
		else
			let inexistentes++ # <=> inexistentes=$((inexistentes + 1))
		fi
	fi
done
echo "Hay $inexistentes archivos que no existen"
exit 0
