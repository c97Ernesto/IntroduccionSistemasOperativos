#23.Implemente un script que recorra un arreglo compuesto por números e imprima en
# pantalla sólo los números pares y que cuente sólo los números impares y los
# informe en pantalla al finalizar el recorrido.

if [ $# -ne 0 ]; then
	exit 1
else
	vecNros=(1 2 3 4 5 6 7 8 9 0)
	cantI=0
	
	for ((i=0; i < ${#vecNros[*]}; i++)); do
	
		if [ $(expr ${vecNros[i]} % 2) -eq 0 ]; then
			echo "${vecNros[i]}"
		else
			cantI=$(expr $cantI + 1)
		fi
		
	done
	
	echo "Cantidad de números impares: $cantI"
fi
exit 0
