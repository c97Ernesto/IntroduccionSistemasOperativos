# Escriba un script que reciba una cantidad desconocida de parámetros al momento de 
# su invocación (debe validar que al menos se reciba uno). Cada parámetro representa
# la ruta absoluta de un archivo o directorio en el sistema. El script deberá iterar
# por todos los parámetros recibidos, y:
# -Si el parámetro es un archivo existente en el FileSystem deberá comprimirlo 
# dejando el archivo comprimido en lugar del original.
# -Si el parámetro es un directorio existente en el FileSystem:
#       -si tiene permiso de Lectura deberá empaquetarlo y comprimirlo. 
#       -si tiene permiso de Escritura deberá eliminarlo junto con todo su contenido.
# -Si el parámetro no existe, deberá contarlo e indicar la cantidad total al 
# finalizar el script.

if [ $# -lt 1 ]; then
	echo "Al menos se debe recibir un parámetro."
	exit 1
fi

rutas=("$@")

for i in "${rutas[@]}"; do

	if [ -e "$i" ]; then
		echo -n "La ruta ingresada como parámetro "$i" existe. "

		if [ -f "$i" ]; then
			echo "Es archivo, se comprimirá."
			#gzip: comando para comprimir archivo regular y generar un nuevo
			#archivo "archivo.extension.gz" en el mismo directorio, reemplazando
			#el archivo original
			gzip "$i"
		elif [ -d "$i" ]; then
			echo -n "Es un directorio "
			if [ -r "$i" ]; then
				echo "con permiso de lectura, se empaquetará y comprimirá."
				tar czvf "${i}.tar.gz" "$i"/
			elif [ -w "$i" ]; then
				echo "con permiso de escritura, se eliminará con todo su contenido."
				rm -r "$i"
			fi
		fi
	else
		echo -n "No existe la ruta proporcionada como paŕametro "
		echo "$i"
		#((noRutas+=1))
		noRutas=$((noRutas + 1))
	fi
done
echo "Rutas inexistentes: $noRutas"
exit 0
