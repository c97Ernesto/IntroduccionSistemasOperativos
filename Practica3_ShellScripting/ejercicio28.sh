#Realice un script que recibe como parámetro el nombre de un directorio. Deberá 
#validar que el mismo exista, y de no existir terminar la ejecución del script con
#código de error 4. Si el directorio existe deberá contar *por separado* la 
#cantidad de archivos que en él se ecuentran para los cuales el usuario que lo 
#ejecuta tiene permiso de lectura y escritura, e informar dichos valores en pantalla
#En caso de encontrar subdirectorios, no deberán procesarse, y tampoco deberán ser 
#tenidos en cuenta para la suma a informar.

if [ $# -ne 1 ]; then
	echo "Cantidad de parámetros incorrectos."
	exit 1
	
else
	if [ ! -d $1 ]; then
		echo "No hay directorio con ese nombre"
		exit 4
		
	else
		cant=0
		for i in $(ls -l $1); do
			if [ -f $1/$i ]; then
				if [ -w $1/$i ] && [ -r $1/$i ]; then
					cant=$(expr $cant + 1)
				fi
			fi
		done
		echo "Total: $cant"
	fi
fi
