
#!/bin/bash
#Realizar un script que le solicite al usuario
#Verifico que la cantidad de parámetros recibida sea == 2
if [ $# -eq 2 ]; then
	echo "Multiplicación = $(expr $1 \* $2)"
	echo "Suma = $(expr $1 + $2)"
	echo "Resta = $(expr $1 - $2)"
	if [ $1 -eq $2 ]; then
		echo "Son iguales."
	elif [ $1 -gt $2 ]; then
		echo "El mayor es: $1"
	else
		echo "El mayor es: $2"
	fi
fi
