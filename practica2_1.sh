#!/bin/bash

# Ana Roig Jimenez y Alejandro Solanas
# 686329 - 647647
# practica2_1.sh

echo -n "Escriba el nombre de un fichero: "

read file

if [ -f $file ];  then				#-f comprueba que existe y es regular
	if [ -r $file ];  then
		echo "El fichero es legible"
    fi
  if [ -w $file ]; then
		echo "El fichero es modificable"
		fi
	if [ -x $file ]; then
		echo "El fichero es ejecutble"
		fi
	else echo "El fichero no existe"
fi
