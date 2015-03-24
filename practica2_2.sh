#!/bin/bash

# Ana Roig Jimenez y Alejandro Solanas
# 686329 - 647647
# practica2_2.sh

echo -e "Has introducido como parámetros los ficheros: \n"

for n in $*				#Analiza todos los parametros introducidos
do
	if [ -f $n ]; then		#Comprueba la existencia del fichero
		echo -e "Mostrando el fichero $n \n"
		more $n
	else echo "El fichero no existe"
	fi
done
