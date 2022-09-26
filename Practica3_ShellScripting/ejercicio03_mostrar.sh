#!/bin/bash
#denominado "shebang", especifica el intérprete que se utilizará
#para ejecutar el script. Si no se especifíca se utiliza el
#intérprete por defecto del usuario.
#Comentarios acerca de lo que hace el script:
#registra en dos variables el nombre y apaellido, muestra la
#hora actual e imprime el nombre del usuario actual al invocar
#el comando.
echo "Introduzca nombre y apellido:"
read nombre apellido
echo "Fecha y hora actual:"
date
echo "Su apellido y nombre es:"
echo "$apellido $nombre"
echo "Su usuario es: `whoami`"
echo "Su directorio actual es:"
