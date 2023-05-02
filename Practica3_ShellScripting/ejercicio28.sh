#!/bin/bash
#No funciona con archivos con espacios en el nombre.
if [ $# -ne 1 ]; then
	echo "Cantidad de parámetros incorrectos."
	exit 1
fi

if [ ! -d $1 ]; then
	echo "No hay directorio con ese nombre"
	exit 4
fi

cant=0
for i in  $(ls $1); do
	if [ -f $1/$i ]; then
		if [ -w $1/$i ] && [ -r $1/$i ]; then
			cant=$(expr $cant + 1)
		fi
	fi
done
echo "Total: $cant"
exit 0
