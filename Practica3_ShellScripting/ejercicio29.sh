#!/bin/bash

archivos=()

for i in "$(find /home -type f -name "*.doc")"; do
	echo "$i"
	archivos+=($i)
done

function ver_archivo {
	if [ $# -ne 1 ]; then
		echo "Se tiene que ingresar nombre de archivo."
		return 2
	fi
	#con <local> solo será visible dentro de la función
	local encontrado=1

	for archivo in "${archivos[@]}"; do
		if [ "$archivo" == "$1" ]; then
			encontrado=0
			break
		fi
	done

	if [ $encontrado -eq 0 ]; then
		echo "El archivo se encontró correctamente."
	else
		echo "Archivo no encontrado"
		return 5
	fi
	return 0
}

function cantidad_archivos {
	echo ${#archivos[@]}
}

function borrar_archivo {
	local existe=1
	for archivo in ${archivos[@]}; do
		if [ "$archivo" == "$1" ]; then
			existe=0
		fi
	done
	
	if [ $existe -eq 1 ]; then
		echo "El archivo recibido como parámetro no existe."
	else
		echo "Borrar el archivo lógicamente?"

		select opcion in "Sí" "No"; do
			case $opcion in
				"Sí")
					for (( i=0;i<${#archivos[@]}; i++ )); do

						if [ "$1" == "${archivos[i]}" ]; then
							unset archivos[i]
							archivos=("${archivos[@]}")
							echo "Archivo Eliminado del arreglo."
							break
						else
							echo "Archivo eliminado."
							break
						fi
					done
				;;
				"No")
					for (( i=0;i<${#archivos[@]};i++ )); do
						if [ "$1" == "${archivos[i]}" ]; then
							local archivo
							archivo=${archivos[i]}
							unset archivos[i]
							archivos=("${archivos[@]}")
							echo "Archivo eliminado del File System."
							rm $archivo
							break
						else
							echo "Archivo eliminado."
							break
						fi
					done
				;;
				*)
					echo "Opción incorrecta."
					return 1
				;;
			esac
			return 0
		done
	fi
}

opciones=("Ver archivos" "Cantidad de archivos" "Borrar archivo" "Salir")
#MENU
echo "Eliga un Opción: "

select opcion in "${opciones[@]}"; do
	case $opcion in 
		"Ver archivos")
			echo -n "Ingrese nombre del archivo a ver: "
			read archivo
			ver_archivo $archivo
		;;
		"Cantidad de archivos")
			cantidad_archivos
		;;
		"Borrar archivo")
			echo -n "Ingrese nombre del archivo a borrar: "
			read archivo
			borrar_archivo $archivo
		;;
		"Salir")
			echo "Saliendo..."
			break
		;;
		*)
			echo "Opción incorrecta."
		;;
	esac
done
exit 0
