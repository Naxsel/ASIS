#!/bin/bash

# Ana Roig Jimenez y Alejandro Solanas
# 686329 - 647647
# practica3.sh

# El siguiente script se ejecuta de la siguiente forma ./practica3.sh [fichero] [instruccion]
# Las instruciones posibles son Anadir / Eliminar

if [ ! -f $1 ]; then echo "No existe el fichero introducido"
else
	if [ "$2" == "Anadir" ]
		then
		while read user pass
		do
			useradd $user -p $pass -m -U -K UID_MIN=1000 	#Por defecto ya inicializa home con /etc/skel, devuelve 0 si añade correctamente
			if [ $? -eq 0 ]; then echo "Usuario $user añadido"
			fi
			echo "$user"vim:"$pass" | chpasswd
		done < $1

	elif [ "$2" == "Eliminar" ]
		then
		while read user pass
		do
			tar -cvf "$user".tar /home/"$user"
			userdel -r $user				 #Devuelve 0 si se ha eliminado correctamente
			if [ $? -eq 0 ]; then echo "Usuario $user eliminado"
			fi
		done < $1
		else echo "Orden no reconocida"
		fi
	fi
fi
