#Escribir un script de Bash que reciba un nombre de usuario como parámetro. Si el
#usuario ingresado como parámetro NO es un usuario del sistema, el script debe
#finalizar con código de error 1. En caso contrario, debe verificar cada 30 segundos
#si el usuario está logueado.
#Al detectar que está logueado debe registrar en un archivo llamado acces<NOMBRE DE
#USUARIO>.log el nombre del usuario junto con la fecha en que se lo detectó. NO debe
#borrar el contenido previo de este archivo, y éste debe escribirse es una ubicación
#apropiada del FileSystem. Al detectar 30 veces que el usuario está logueado, el 
#script debe finalizar con código de error 0.

if [ $1 != "$(cat /etc/passwd | cut -d":" -f 1 | grep $1)" ]; then
	echo "No existe usuario"
	exit 1
else

	while true; do
		if [ $1 == "$(who | cut -f 1 | grep $1)" ]; then
			echo "conectado"
			acces$1
			break
		fi
		sleep 30
	done
fi

