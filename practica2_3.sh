#!/bin/bash

# Ana Roig Jimenez y Alejandro Solanas
# 686329 - 647647
# practica2_3.sh

if [ -f $1 ]; then

	chmod ug+x $1		#añade permisos de ejecucion para usuario y grupo
	ls -l $1

else echo "El fichero introducido no existe"
fi
