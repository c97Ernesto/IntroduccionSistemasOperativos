# Escriba un script que reciba una cantidad desconocida de parámetros al momento de 
# su invocación (debe validar que al menos se reciba uno). Cada parámetro representa
# la ruta absoluta de un archivo o directorio en el sistema. El script deberá iterar
# por todos los parámetros recibidos, y:
# -Si el parámetro es un archivo existente en el FileSystem deberá comprimirlo 
# dejando el archivo comprimido en lugar del original.
# -Si el parámetro es un directorio existente en el FileSystem:
#	-si tiene permiso de Lectura deberá empaquetarlo y comprimirlo.	
#	-si tiene permiso de Escritura deberá eliminarlo junto con todo su contenido.
# -Si el parámetro no existe, deberá contarlo e indicar la cantidad total al 
# finalizar el script.

if [ $# -eq 0 ]; then
	echo "Se debe recibir al menos un parámetro (ruta absoluta de archivo)."
	exit 1

else
	for i in $*; do
		if [ -f $i ]; then
			echo "$i: es archivo, comprimiendo $i"
			7z -r $i.7z $i
			
		elif [ -d $i ]; then
			echo "$i Es directorio..."
			
			if [ -w $i ]; then
				echo "con permisos de Escritura, eliminando $i ."
				rm -r $i
				
			elif [ -r $i ]; then
				echo "con permisos de Lectura, empaquetando y comprimiendo $i ."
				tar -zvcf /$HOME/CompresionYEmpaquetado.tgz $i
				
			fi
		else
			echo "$i: no es archivo ni directorio."
		fi
	done
fi

