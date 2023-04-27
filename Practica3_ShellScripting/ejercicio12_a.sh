
#!/bin/bash
#Realizar un script que le solicite al usuario

echo "Ingrese dos números: "
echo "Nro 1: "
read num1 
echo "Nro 2: "
read num2

#La expresión dentro de paréntesis doble indica que se está realizando
#una operación aritmética.
echo "Multiplicación = $((num1*num2))"
#Con las llaves podemos expandir el valor de las variables y manipular
#las operaciones de manera más precisa.
echo "Multiplicación = $(expr ${num1} \* ${num2})"

echo "Multiplicación = $(expr $num1 \* $num2)"

echo "Suma = $(expr ${num1} + ${num2})"

echo "Resta = $(expr ${num1} - ${num2})"

if [ ${num1} -eq ${num2} ]; then
	echo "Son iguales."
elif [ ${num1} -gt ${num2} ]; then
	echo "El mayor es: ${num1}"
else
	echo "El mayor es: ${num2}"
fi
