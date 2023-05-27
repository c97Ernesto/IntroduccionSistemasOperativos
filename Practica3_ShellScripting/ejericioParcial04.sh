#Administrás un servidor que utiliza NGINX para publicar un conjunto de páginas web. Se te ha solicitado
#realizar un shell script con Bash para procesar su archivo de log, que recibe como argumentos una fecha
# y una o más direcciones IP, y que indique la cantidad de accesos que cada IP ha realizado al servidor
# en la fecha que se recibe como primir argumetno. La salida del script debe informar, utilizando dos
# columndas, la dirección Ip y la cantidad de accesos que se registraron desde esa dirección IP.
#Los archivos de log se ubican en el fileSystem, en el directorioo donde se guardan los logs de un servidor
# según el FHS, y sus nombres siguen el patrón: acces.X.log donde X es la fecha del día en que se 
# registraron los accesos. La estructura de esos archivos de log es la siguiente:
# IP<espacio>-<espacio>fecha<espacio>"request"<espacio>HTTP_CODE<espacio>content_length<espacio>"user_agent"

if [ $# -lt 2 ]; then
	echo "Se debe recibir la fecha y una IP como mínimo."
	exit 1
fi

fecha="$1"
archivo="/var/log/acces."$fecha".log"
if [ ! -e "$archivo" ]; then
	echo "No existe el archivos con esa fecha."
	exit 1
fi

#ips=("${@:2}")
ips=("$@")
unset ips[0]
ips=("${ips[@]}")

for ip in "${ips[@]}"; do
	accesos=$(cat "$archivo" | grep $ip | wc -l)
	if [ $accesos -gt 0 ]; then
		echo -n "$ip "
		echo "$accesos"
	fi
done
exit 0
