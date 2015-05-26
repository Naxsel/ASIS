#!/bin/bash
# Alejandro Solanas - 647647

# El siguiente script se ejecuta de la siguiente forma ./practica5_3.sh

echo "Introduza la siguiente linea con el formato: "
echo "nombreGrupoVolumen,nombreVolumenLogico,tamaño,tipoSistemaFIcheros,directorioMontaje"
read linea

grupo= cut -f1 -d',' linea
logico= cut -f2 -d',' linea
tamano= cut -f3 -d',' linea
fichero= cut -f4 -d',' linea
directorio= cut -f5 -d',' linea

dummy=$(sudo lvdisplay "$logico")

if [ $dummy ];then 
	echo "No existe el volumen, creando..."d
	#Sino existe lo crea
	sudo lvcreate -L $tamano -n "$logico"  "$grupo"
	sudo mkfs."$fichero" /dev/"$logico"
	sudo mkdir "$directorio"
	sudo cat aux=""$logico"		"$directorio"		"$fichero"	defaults		0	0" >> /etc/fstab
	fi
#redimensiona tamaño
lvextend -L "+$tamano" "$logico"

#redimensiona ficheros
resize2fs "$logico" 

