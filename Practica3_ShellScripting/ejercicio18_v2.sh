#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Proporcionar nombre de usuario como parámetro."
	exit 1
fi

while true; do
# -w: indico que la coincidencia debe ser exacta (palabra completa)
# -q: hace que grep no imprima nada por pantalla.
	if  who | grep -wq "$1" ; then
		echo "Conectado"
		break
	fi
	
	sleep 10
done

exit 0

