#!/bin/bash

# Ana Roig Jimenez y Alejandro Solanas
# 686329 - 647647
# practica2_4.sh

echo "Pulse una tecla: "		#Debe pulsarse una tecla solamente o devolverá caracter especial.

read tecla

case $tecla in
	[A-Za-z]) echo "Es una letra"
		;;
	[0-9]) echo "Es un número"
		;;
	*) echo "Es un carácter especial"
		;;
esac
