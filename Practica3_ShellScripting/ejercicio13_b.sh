#!/bin/bash
#Acceso a todos los valores del arreglo: ${arreglo[@]} | ${arreglo[*]} .
#Ejecución de un comando dentro de: $() | `` .
#Cortar ejecución de un bucle o loop: break .
opciones=("Listar" "QuienEstá" "DóndeEstoy" "Salir")

echo "Seleccione una opción: "

select opc in "${opciones[@]}"; do
	case $opc in
		"Listar")
			#muestro contenido del directorio.
			echo $(ls)
		;;
		"QuienEstá")
			#muestro usuarios conectados al sistema.
			echo $(who)
		;;
		"DóndeEstoy")
			#muestro la ubicación en el file system.
			echo $(pwd)
		;;
		"Salir")
			#finalizo bucle select para que deje de preguntar.
			break
		;;
		*)
			echo "Opción incorrecta, intente nuevamente."
	esac
done
#Script ejecutado correctamente.
exit 0
