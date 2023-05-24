#!bin/bash
#Realice un script que agregue todos los nombres de usuario del sistema a un arreglo
#e implemente las siguientes funciones:
#       *existe <parámetro1>: Devuelve 0 si el usuario existe en el arreglo, 1 en caso
#       contrario
#       *eliminar_usuario <parámetro1>: Si el usuario pasado como parámetro existe en el
#       arreglo, lo elimina del mismo. Caso contrario devuelve código de error 2.
#       *usuarios_con_patron <parámetro1>: Recorre el arreglo e imprime en pantalla 
#       los nombres de los usuarios en cuyo caracteres aparece el patrón pasado como
#       parámetro.

usuarios=()

for i in $(cat /etc/passwd | cut -d":" -f1); do
#	echo "Elemento $((j+=1)): $i"
	usuarios[${#usuarios[@]}]="$i"
done

function existe {
	if [ $# -ne 1 ]; then
		echo "Se debe ingresar el usuario como parámetro."
		return 2
	fi

	local ok=""
	for i in "${usuarios[@]}"; do
		if [ "$1" = "$i" ]; then
			ok="no vacía"
			break
		fi
	done
	#z devulve 0 si está vacío <=> !-n
	if [ -z "$ok" ]; then
		echo "El usuario no existe en el arreglo"
		return 1
	fi
	echo "El usuario "$1" existe en el arreglo"
	return 0
}

function eliminar {
	#Se valida previamente si existe el usuario
	local posicion=0
	for i in "${usuarios[@]}"; do
		if [ "$1" = "$i" ]; then
			break
		fi
		((posicion++))
	done

	unset usuarios[$posicion]
	usuarios=(${usuarios[@]})
	return 0
}

function usuarios_con_patron {
	if [ $# -ne 1 ]; then
		echo "Se debe recibir un patrón como parámetro."
		return 1
	fi

	local patron="$1" 
	for i in "${usuarios[@]}"; do
		#n devuelve 0 si no está vacío <=> !-z
		if [ -n "$(echo "$i" | grep "$patron")" ]; then
			echo "$i"
		fi

	done
	return 0
}


opciones=("Buscar usuario" "Eliminar usuario del arreglo" "Buscar usuarios que coincidan con patrón"  "Salir")

select opcion in "${opciones[@]}"; do

	case $opcion in
		"Buscar usuario")
			echo -n "Ingresar nombre de usuario: "
			read nombre
			existe "$nombre"
		;;
		"Eliminar usuario del arreglo")
			echo -n "Ingresar nombre de usuario: "
			read nombre
			existe "$nombre"
			if [ $? -eq 0 ]; then
				eliminar "$nombre"
			fi
		;;
		"Buscar usuarios que coincidan con patrón")
			echo -n "Ingresar patrón: "
			read patron
			usuarios_con_patron "$patron"
		;;
		"Salir")
			break
		;;
		*)
			echo "Opción incorrecta."
	esac
done
exit 0
