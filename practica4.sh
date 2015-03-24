#!/bin/bash
# Alejandro Solanas - 647647

# El siguiente script se ejecuta de la siguiente forma ./practica4.sh [ficheroip] [instruccion] [fichero_nombres]
# Las instruciones posibles son Anadir / Eliminar

if [ ! -f $1 -a ! -f $3 ]; then echo "No existen los ficheros introducidos"
else
	if [ "$2" == "Anadir" ]
		then	
		while read userip IP <&5
		do
			while read user pass
			do
				ssh $userip@$ip "sudo useradd $user -p $pass -m -U -K UID_MIN=1000" < /dev/null	
				ssh $userip@$ip "sudo echo "$user"vim:"$pass" | chpasswd" < /dev/null
			done < $3	
		done 5<$1		
			
	elif [ "$2" == "Eliminar" ]
		then
		while read userip IP <&5
		do
			while read user pass
			do
				ssh $userip@$ip "sudo tar -cvf "$user".tar /home/"$user"" < /dev/null
				ssh $userip@$ip "sudo userdel -r $user" < /dev/null				 
			done < $3
		done 5<$1	
		else echo "Orden no reconocida"
		fi
	fi	
fi	
	
