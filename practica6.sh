#!/bin/bash
# Alejandro Solanas - 647647

# El siguiente script se ejecuta de la siguiente forma sudo ./practica5_6.sh ip
# donde la ip es la direccion de la máquina donde queremos mandar la información
 
ping -w 1 $1  #Para transmitir un paquete solo

if [ $? -ne 0 ]; then echo "Error de conexion"

else

	sudo uptime | logger -p local0.info 
	sudo	free	-h | logger -p local0.info
	sudo	df | logger -p local0.info 
	sudo netstat | logger -p local0.info 
	sudo ps | logger -p local0.info
	
fi

