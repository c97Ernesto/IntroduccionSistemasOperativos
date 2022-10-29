#Realice un script que agregue todos los nombres de usuario del sistema a un arreglo
#e implemente las siguientes funciones:
#	*existe <parámetro1>: Devuelve 0 si el usuario existe en el arreglo, 1 en caso
#	contrario
#	*eliminar_usuario <parámetro1>: Si el usuario pasado como parámetro existe en el
#	arreglo, lo elimina del mismo. Caso contrario devuelve código de error 2.
#	*usuarios_con_patron <parámetro1>: Recorre el arreglo e imprime en pantalla 
#	los nombres de los usuarios en cuyo caracteres aparece el patrón pasado como
#	parámetro.
#	*cantidad:Imprime la cantidad total de ususarios en el arreglo.
#	*usuarios: imprime todos los nombres de los usuarios que están en el arreglo

usuariosDelSistema=$(cat /etc/passwd | cut -d":" -f1) # = cut -d ":" -f1 /etc/passwd
nombres=($usuariosDelSistema)

existe () {
	if [ $# -ne 1 ]; then	    #siempre validar parámetros(especialmente en parcial)
		echo "Solo un parámetro."
		return 255
	else
		for nombre in ${nombres[*]}; do	
			if [ $1 == $nombre ]; then
				break 
			fi
		done
	
		if [ $1 == $nombre ]; then
			echo "El usuario $1 existe."
			return 0
		else
			echo "El usuario $1 no existe"
		fi
	fi
}

eliminarUsuario(){
	if [ $# -ne 1 ]; then	    
		echo "Solo un parámetro."
		return 255
	else
	
		for ((i=0; i<${#nombres[*]}; i++)); do	
			if [ $1 == ${nombres[i]} ]; then
				break 
			fi
		done
		
		if [ "$1" == "${nombres[i]}" ]; then
			unset nombres[$i]		#dejamos la posicion vacía
			nombres=(${nombres[*]})		#seteamos el arreglo con los elementos del arreglo
			echo "Usuario $1 eliminado."
			return 0
		else
			echo "El usuario "$1" no xiste"
			return 1
		fi
	fi
}

cantidad(){
	echo "La cantidad de elementos del arreglo es: ${#nombres[*]}"
}

usuarios(){
	echo "Los usuarios son: ${nombres[*]}"
}

usuarioConPatron(){
	if [ $# -ne 1 ]; then	    
		echo "Solo un parámetro."
		return 255
	else

		for nombre in ${nombres[*]}; do	
#			echo $nombre
			if [ "$(echo $nombre | grep $1)" = "$nombre" ]; then
				break 
			fi
		done
		
		if [ "$(echo $nombre | grep $1)" = "$nombre" ]; then
			echo "$nombre tiene el patrón $1"		 
		else
			echo "No hay ningún usuario con ese patrón"
		fi
		
	fi
}

#Implementar funciones
existe mail
cantidad
eliminarUsuario mail
usuarioConPatron daem
cantidad
usuarios
