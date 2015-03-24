#!/bin/bash

# Ana Roig Jimenez y Alejandro Solanas
# 686329 - 647647
# practica2_6.sh

if [ ! -d "$HOME/bin" ]; then mkdir $HOME/bin	#si bin no existe lo crea
fi
movidos=0
for n in *
do
	if [ -x $n -a ! "$n" = "practica2_6.sh" ]	#movemos todo menos el propio script
		then
		mv $n $HOME/bin					#mueve los ficheros ejecutables
		echo "Se ha movido el archivo $n correctamente"
		movidos=`expr $movidos + 1`			#cuenta el numero de ejecuciones
	fi
done
echo "Se han movido $movidos archivos ejecutables"
