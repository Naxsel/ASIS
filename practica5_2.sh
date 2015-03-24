#!/bin/bash
# Alejandro Solanas - 647647

# El siguiente script se ejecuta de la siguiente forma ./practica5_2.sh [volumen] [particion1]...[particion n]

for n in $*				#Analiza todos los parametros introducidos
do
	if [ n==1 ]; then		#Guarda el volumen a usar
		volumen="$n"	
	else
	pvcreate $n			#crear los volúmenes físicos de particiones
	vgextend $volumen $n	#apliamos volumen
	
	fi
done	
	
