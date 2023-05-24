#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Se debe recibir el nombre de usuario como parámetro."
	exit 2
fi

#if  ! grep "^$1:" /etc/passwd; then
if [ "$1" != "$(cat /etc/passwd | grep $1 | cut -d":" -f1)" ]; then
	echo "El usuario no existe en el sistema."
	exit 1
fi

while true; do
#	if who | grep -wq $1; then
	if [ "$1" == "$(who | grep $1 | cut -d" " -f1)" ]; then
		echo "Usuario $1 conectado."

		who | grep $1 >> /var/log/acces$1.log

		break
	fi
	sleep 4
done

exit 0
