#!/bin/bash

#Cree un programa de shell que usando las siguientes fórmulas efectúe la conversión
#de temperaturas. Dados grados Celsius, los convierte a Fahrenheit y al revés.
#	C = 5*(F-32)/9	y	F = ((9*C)/5)+32
#El script recibe por parámetro C para convertir a celsius y F para convertir a 
#Fahrenheit. Luego pide al usuario que ingrese la temperatura a convertir por teclado
#e imprime la temperatura convertida utilizando las fórmulas.

if [ $# -ne 1 ]; then
	echo "Cantidad parámetros incorrectos"
	exit 1
else
	case $1 in		
		"C")	#recibo temperatura en F y convierto en C
			echo "Ingresar temperatura: "
			read n
			echo $(expr 5 \* $n - 32 / 9 )
		;;
		"F")
			echo "Ingresar temperatura: "
			read n
			echo $(expr  9 \* $n / 5 + 32 )
		;;
		*)
			echo "Parámetro incorrecto"
			exit 2
		;;
	esac
fi
