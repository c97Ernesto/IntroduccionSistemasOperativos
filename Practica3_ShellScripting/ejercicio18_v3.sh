# !/bin/bash
if [ $# -ne 1 ]; then
	echo "Cantidad de prámetros incorrectos, ingresar nombre de usuario"
	exit 1
fi

# ^: indico que la búsqueda se realize al inicio de la línea.
#en éste caso que el nombre se encuentre al comienzo de la línea y esté
#seguido por < : >.
if ! grep -q "^$1:" /etc/passwd; then
	echo "El usuario $1 no existe en el sistema."
	exit 2
fi

#Utilizo < != > para comparar dos cadenas ya que no estoy comparando 
#valores enteros para utilizar < -ne >.
#Sino, puedo utilizar < [[]] > ya que es más flexible y permite más 
#operaciones.
while true; do

	if [ "$1" != "$(who | cut -d " " -f1)" ]; then
		echo "Usuario "$1" desconectado"
	else
		echo "Usuario "$1" conectado"
		break
	fi

	sleep 4
done

exit 0

