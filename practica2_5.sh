#!/bin/bash

# Ana Roig Jimenez y Alejandro Solanas
# 686329 - 647647
# practica2_5.sh

echo "Escriba una ruta de directorio válida: "

read ruta

if [ -d $ruta ]; then
	cd $ruta
	archivo=0;	fichero=0
	for n in *		#lee todos los archivos
	do
		if [ -f $n ]; then archivo=`expr $archivo + 1`
		else fichero=`expr $fichero + 1`
		fi
	done
	echo "Hay $archivo archivos"
	echo "Hay $fichero ficheros"
else
	echo "No existe, o no es directorio"
fi
