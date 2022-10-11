#Crear un script que verifique cada 10 segundos si un usuario se ha
#logueado en el sistema (el nombre de usuario será pasado por parámetro).
#Cuando el usuario finalmente se loguee, el programa deberá mostrar un
#mensaje "Usuario XXXX logueado en el sistema", y salir.

#Verificamos el parámetro
if [ $# -ne 1 ]; then
	echo "Ingresar parámetro: nombreUsuario."
	exit 1
	
#Verificamos que existe usuario
#/etc/passwd contiene información sobre los usuarios del sistema: nombre 
#usuario, id de usuario, id grupo, descripción usuario, su home e intérprete 
#de comandos por defecto
elif [ $1 != "$(cat /etc/passwd | cut -d ":" -f 1 | grep $1)" ]; then
	echo "El usuario ingresado no existe."
	exit 2
	
#Buscamos que ingrese
#cut <-d(delimitador) <"caracter">> <-f(campo) <nro de campo>> <archivo>
else
	while [ $1 != "$(who | cut -d" " -f 1)" ]; do
		echo "Desconectado"
		sleep 5
	done
	echo "Usuario $1 logueado en el sistema"
fi
exit 0
