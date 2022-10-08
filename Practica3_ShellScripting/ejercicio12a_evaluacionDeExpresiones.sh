#!/bin/bash

#expresiones escritas de distintas maneras, funcionan de igual forma
#La multiplicación así $(expr ${n1} * ${n2}) no funciona

echo "Ingresar dos números (separados por espacio): "
read n1 n2
echo "Multiplicación: $[ n1 * n2 ]"
echo "Suma: $(expr $n1 + $n2)"
echo "Resta: $[n1 - ${n2}]"
echo "Division: $(expr ${n1} / ${n2})"
echo "El mayor es: "
if [ ${n1} -gt ${n2} ]
then
	echo ${n1}
else
	echo ${n2}
fi
