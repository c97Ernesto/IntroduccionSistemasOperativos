#!/bin/bash

echo "Ingresar dos números: "
read n1 n2
echo "Multiplicación: buscar como se pone la barra invertida no me funciona."
echo "Suma: $(expr ${n1} + ${n2})"
echo "Resta: $(expr ${n1} - ${n2})"
echo "Division: $(expr ${n1} / ${n2})"
echo "El mayor es: "
if [ ${n1} -gt ${n2} ]
then
	echo ${n1}
else
	echo ${n2}
fi
