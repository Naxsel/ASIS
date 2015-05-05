## 			     Asis
## Alejandro Solanas - 647647

##      Indice de Instrucciones

# sort:     Ordena las lineas alfabeticamente
# cut:      Escribe partes seleccionadas de un fichero a la salida estándar
# paste:    Une texto de varios ficheros
# tr:       Borra y/o reemplaza caracteres
# uniq:     Elimina líneas repetidas
# wc:       Muestar el nº de lineas, palabras y bytes
# fmt:      Formatea párrafos
# join:     Combian varios ficheros
# split:    Divide un fichero en ficheros mas pequeños
# head:     Muestra el principio de un fichero
# tail:     Muestra el final de un fichero
# tac, rev: Muestra el fichero al reves
# nl:       Añade números de línea
# expand:   Convierte TABs en espacios
# od:       Muestra un fichero en diferentes formatos
# sed:      Transformaciones basicas de un flujo de entrada
#           sed comando [lista_ficheros]
#           sed [-e comando] [-f fichero_comandos] [lista_ficheros]
#           comandos: s sustitucion, d borrado,
#                     i\ a\ añade antes/despues de la linea afectada
#                     c\ reemplaza la linea afectada
#           flags: g cambios globales, p imprime lineas afectadas
#                  NUMERO: reemplaza la aparicion numero NUMERO
#                  w fichero: escribe las lineas con sustituciones al fichero
# egrep:    Expresiones reguarles (extendidas)
#           grep [opciones] ER [ficheros]
#           -c , -l, -v, -E, -f [fichero],
#           nº de lineas caputradas, solo ficheros con líneas capturadas,
#           todo menos lo capturado segun la ER, egrep, leer ERs de fichero



# awk:

#ER
# .         cualquier caracater
# []        cualquier ade los caracteres entre corchetes
# [^]       cualquier caracter que no esté entre corchetes
# ^         principio de linea
# $         final de linea
# *         0 o mas ocurrencias
# +         1 o mas ocurrencias
# ?         0 o 1 ocurrencia
# \w        caracteres alfanumericos
# |         a | b       # a o b
# \( \)     agrupa ER
# \         escapa un metacaracter
# \{n\}     concuerda con exactamente n ocurrencias de la ER previa
# \{n,\}    concuerda con al menos n ocurrencias de la ER previa
# \{n, m\}  concuerda con entre n y m ocurrencias de la ER previa

#_____________________________________________________________________#
#_____________________________________________________________________#
#_____________________________________________________________________#

# Comandos simples

# cat nombres-ord.txt
# Luis Andion
# Adriana Gomez
# Jorge Pena
# Maria Perez

# cut -c 1-7 nombres-ord.txt
# Luis An
# Adriana
# Jorge P
# Maria P

# cut -d ´ ´ -f 1 nombres-ord.txt
# Luis
# Adriana
# Jorge
# Maria

# wc quijote.txt
# 5 33 178 quijote.txt

# tr -d ´ ´ < quijote.txt
# EnunlugardelaMancha,decuyonombre...

# tr au pk < quijote.txt
# En kn lkgpr de lp Mpnchp, de ckyo nombre...

# uniq -f 1 -c nombres.txt
# 1 Julio Lorenzo
# 1 Pedro Andion
# 3 Celia Fernandez
# 1 Enrique Pena

# sed -e ´s/pepe/Pepe/g´ -e ´s/paco/Paco/g´ amigos
# cambia en amigos, todas las paraciones de pepe y paco y Pepe y Paco

# sed ´/Potamo/s/pepe/Pepe/g´ amigos
# cambia pepe por Pepe solo en las lineas que salga Potamo

# sed ´3,$s/stop/STOP/g´
# reemplaza de la linea 3 al final

# sed ´!3s/stop/STOP/g´
# reemplaza en todas las lienas menos la 3

# sed -r ´s/\<./\u&/g´
# cambia de minus a mayus la primera letra da cada palabra

# sed -r "s/^ +// ; s/ +$// ; s/ +/ /g" fich
# Poner los 4 primeros caracteres de cada línea al final de la misma

# sed -r ´s/^(.{4,4})(.*)/\2\1/´ fich
# poner los 3 primeros caracteres de cada linea al final de la misma

# echo "abc1234def" | sed -r "s/[0-9]+/NUMERO/"
# abcNUMEROdef

# echo "000x111x222x333" | sed ´s/x.*x/<&>/´
# 000<x111x222x>333

# 0\(abc\)*0
# cadenas que tengan un 0 seguido de 0 o mas
# ocurrencias de acb y seguido de otro 0



#_____________________________________________________________________#
#_____________________________________________________________________#
#_____________________________________________________________________#

#         Ejercicios clase

# #Lista elementos del directorio y los clasifica
#
# #!/bin/bash
# for fichero in $(ls)
# do
# 	if [ -d $fichero ]; then
# 		case $fichero in
# 			*.jpg | *.png )
# 				echo $fichero es un fichero normal de imagen ;;
# 			*.mpeg | *.avi )
# 				echo $fichero es un fichero normal de video ;;
# 			* )
# 				echo $fichero es de otro tipo ;;
# 		esac
# 	elif [ -f $fichero ]
# 		then echo "$fichero es un fichero"
# 	else
# 		echo "$fichero es otro tipo"
# 	fi
# done

#_____________________________________________________________________#

#Mataprocesos

# #!/bin/bash
#
# lista=`ps -o pid= -o comm=` #Guarda una lista de procesos
#
# count=1
# echo "$lista" | while read pid comm #comillas para los saltos de linea
# do
#   echo "$count ) $pid $comm"
#   count=$(($count+1))
# done           #ojo con la redireccion del fichero
#
# echo -n "Que proceso mato? "  #-n no salta de linea tras echo
# read numero
#
# count=1
# echo "$lista" | while read pid comm
# do
#   if [ $count = $numero ]
#     then
#       kill $pid
#       break                   #Para terminar el while
#     fi
#     count=$(($count+1))
# done


#version con for

# #!/bin/bash
#
# lista=`ps -o pid= -o comm=` #Guarda una lista de procesos
#
# count=1
# OldIFS=$IFS           #Para que interprete \n correctamente
# IFS=$'\n'
# for linea in $lista
# do
#   echo "$count ) $pid $comm"
#   count=$(($count+1))
# done

#_____________________________________________________________________#

#Listar el contenido de un directorio en orden decreciente de tamaño

# #!/bin/bash
# ls -l $1 | sort -k5 -n -r #ordena 5º columa, tratada como numero, al reves

#_____________________________________________________________________#

#Obtener una tabla de usuarios del sistema, con dos columnas separadas
#por un espacio, nombre de usuario e ID, ordenada por ID

# necesitamos la columna 1 y 3
# cut -d: -f1,3 /etc/passwd | tr : ' ' | sort -k2 -n

#_____________________________________________________________________#

# Encontrar usuarios con nombres de 4 o mas caracteres
# cat /etc/passwd | egrep '^.\w{4,}:' | cut -d ':' -f 1
# cat /etc/passwd | cut -d ':' -f 1 | egrep '.{4,}'
# cat /etc/passwd | cut -d ':' -f 1 | egrep '\w{4,}'    #\w es alfanumerico

#_____________________________________________________________________#

# Encontrar todos los usuarios del sistema cuyo ID sea > 99
# egrep '^\w*:\w*:[0-9]{3,}' /etc/passwd  #No vale con usuarios con caracteres no alfanumericos
# egrep '^[^:]*:[^:]*:[0-9]{3,}' /etc/passwd  #Solucion mas correcta

#_____________________________________________________________________#

# Cambiar de un fichero, las apariciones:
# unix -> unixTM
# unix -> UnixTM

# sed -r -e '/patron_de_busqueda/comando/patron de sust/sutituto/label'
# sed -r -e 's/[Uu]nix/&TM/g' text   #Sin patron de busqueda porque se aplica a todo
# sed -r -e 's/([Uu]nix)/\1TM/g' text

#_____________________________________________________________________#

# Borrar lineas en blanco de un fichero

# sed -r '/^[\t ]*$/d' text     #d borra lineas

#_____________________________________________________________________#

# Formatear el texto de espacios

# sed -r -e 'comando' -e 'comando'
# sed -r -e 's/ +/ /g' -e '/^ +//g' text     #el segundo + es redundante

#_____________________________________________________________________#

# Formatear la salida del date: mar abr 21 11:49:04 CEST 2015

# date | cut -d ' ' -f2,3,6 | sed -r -e 's/ [0-9]+$/,&/'
# date | cut -d ' ' -f2,3,6 | sed -r -e 's/[0-9]{1,2}/&,/'
# date | sed -r 's/^[^ ]+ (\w+) /\1/'

#_____________________________________________________________________#

# Encontrar telefonos en un fichero con el formato:
# Empieza por 6,7,8 o 9
# 987-654-321
# 987 654 321

# egrep '[6-9][0-9]{2}([ -][0-9]{3}){2}' #mal porque el espacio y el guion deben ser el mismo la 2º vez
# egrep '[6-9][0-9]{2}([ -])[0-9]{3}\1[0-9]{3}' #mal porque el 0987 657 456 le vale
# Los parentesis lo que hacen es capturarlo para usarlo con el \1
# egrep '(^|[ \t\n,:])[6-9][0-9]{2}([ -])[0-9]{3}\2[0-9]{3}([ \t\n,:]|$)'

#_____________________________________________________________________#

# Mover todos los ficheros que tengan una extension a ./tmp/

# a1 (no se mueve)
# a2.xyz (se mueve)
# a4.xy.xy (se mueve)

# mv *.* ./tmp
# ls *.* | xargs -I@ mv @ ./tmp

#_____________________________________________________________________#

# Renombrar los ficheros en el directorio actual, quitandoles la extension y moverlos.

# a1.xyz -> a1
# a2.xyz.abc -> a2.xyz

# ls *.* | sed -r 's/(.*)\.[^.]*/& \1/' | xargs -I@ echo @
# ls *.* | sed -r 's/(.*)\.[^.]*/& \1/' | xargs -n2 mv

#_____________________________________________________________________#

# Dado un fichero con nombres y apellidos, generar una lista de direcciones
# de correo electronico de la forma: 1ºletraname1ºapellido@unizar.es (minus)

# tr [A-Z] [a-z] nombres | sed -r 's/(^.)[^ ]* (\w+)/\1\2@unizar.es/'
# mal porque mostraria el 2º apellido, hay que consumir toda la linea

# cat nombres | tr [A-Z] [a-z] | sed -r 's/(^.)[^ ]* (\w+).*$/\1\2@unizar.es/'
# cat nombres | tr [A-Z] [a-z] | sed -r 's/(\w)\w* (\w+).*$/\1\2@unizar.es/'

# sin sed

# #!/bin/bash
# if [$# -ne 1]
# then
#   echo Uso: $0 fichero
#    exit 1
# fi
#
# while read nombre apellido1 apellido2
# do
#   inicial=$(echo $nombre | cut -c1)
#   echo ${inicial}${apellido1}@unizar.es | tr [A-Z] [a-z]
# done < $1

#_____________________________________________________________________#

#Simular el envio de un mail enviando apto no apto de la forma
#body: nombre apellido/s nota. Presentados:n, Aptos:m

wc -l

grep con contado en no apto y resta

#_____________________________________________________________________#
#_____________________________________________________________________#
#_____________________________________________________________________#

## 			Practicas Asis

#  Practica 2

# # practica2_1.sh
# # Devuelve el tipo de archivo
#
# echo -n "Escriba el nombre de un fichero: "
#
# read file
#
# if [ -f $file ];  then				#-f comprueba que existe y es regular
# 	if [ -r $file ];  then
# 		echo "El fichero es legible"
#     fi
#   if [ -w $file ]; then
# 		echo "El fichero es modificable"
# 		fi
# 	if [ -x $file ]; then
# 		echo "El fichero es ejecutble"
# 		fi
# fi
#_____________________________________________________________________#

# # practica2_2.sh
# # Pagina lista de ficheros
#
# echo -e "Has introducido como parámetros los ficheros: \n"
#
# for n in $*				#Analiza todos los parametros introducidos
# do
# 	if [ -f $n ]; then		#Comprueba la existencia del fichero
# 		echo -e "Mostrando el fichero $n \n"
# 		more $n
# 	else echo "El fichero no existe"
# 	fi
# done
#_____________________________________________________________________#

# # practica2_3.sh
# # Cambia el fichero a ejecutable para dueño y grupo y lo muestra
# if [ -f $1 ]; then
#
# 	chmod ug+x $1		#añade permisos de ejecucion para usuario y grupo
# 	ls -l $1
#
# else echo "El fichero introducido no existe"
# fi
#_____________________________________________________________________#

# # practica2_4.sh
# # Comprueba la tecla pulsada
#
# echo "Pulse una tecla: "		#Debe pulsarse una tecla solamente o devolverá caracter especial.
#
# read tecla
#
# case $tecla in
# 	[A-Za-z]) echo "Es una letra"
# 		;;
# 	[0-9]) echo "Es un número"
# 		;;
# 	*) echo "Es un carácter especial"
# 		;;
# esac
#_____________________________________________________________________#

# # practica2_5.sh
# # Comprueba cuantos archivos y directorios hay dentro de una ruta
#
# echo "Escriba una ruta de directorio válida: "
#
# read ruta
#
# if [ -d $ruta ]; then
# 	cd $ruta
# 	archivo=0;	fichero=0
# 	for n in *		#lee todos los archivos
# 	do
# 		if [ -f $n ]; then archivo=`expr $archivo + 1`
# 		else fichero=`expr $fichero + 1`
# 		fi
# 	done
# 	echo "Hay $archivo archivos"
# 	echo "Hay $fichero ficheros"
# else
# 	echo "No existe, o no es directorio"
# fi
#_____________________________________________________________________#

# # practica2_6.sh
# # mueve todos los ejecutables a $HOME/bin
#
# if [ ! -d "$HOME/bin" ]; then mkdir $HOME/bin	#si bin no existe lo crea
# fi
# movidos=0
# for n in *
# do
# 	if [ -x $n -a ! "$n" = "practica2_6.sh" ]	#movemos todo menos el propio script
# 		then
# 		mv $n $HOME/bin					#mueve los ficheros ejecutables
# 		echo "Se ha movido el archivo $n correctamente"
# 		movidos=`expr $movidos + 1`			#cuenta el numero de ejecuciones
# 	fi
# done
# echo "Se han movido $movidos archivos ejecutables"

#_____________________________________________________________________#

# practica3.sh

# El siguiente script se ejecuta de la siguiente forma ./practica3.sh [fichero] [instruccion]
# Las instruciones posibles son Anadir / Eliminar

# if [ ! -f $1 ]; then echo "No existe el fichero introducido"
# else
# 	if [ "$2" == "Anadir" ]
# 		then
# 		while read user pass
# 		do
# 			useradd $user -p $pass -m -U -K UID_MIN=1000
#       #Por defecto ya inicializa home con /etc/skel, devuelve 0 si añade correctamente
# 			if [ $? -eq 0 ]; then echo "Usuario $user añadido"
# 			fi
# 			echo "$user"vim:"$pass" | chpasswd
# 		done < $1
#
# 	elif [ "$2" == "Eliminar" ]
# 		then
# 		while read user pass
# 		do
# 			tar -cvf "$user".tar /home/"$user"
# 			userdel -r $user				 #Devuelve 0 si se ha eliminado correctamente
# 			if [ $? -eq 0 ]; then echo "Usuario $user eliminado"
# 			fi
# 		done < $1
# 		else echo "Orden no reconocida"
# 		fi
# 	fi
# fi

#_____________________________________________________________________#

# practica4.sh

# El siguiente script se ejecuta de la siguiente forma ./practica4.sh [ficheroip] [instruccion] [fichero_nombres]
# Las instruciones posibles son Anadir / Eliminar

# if [ ! -f $1 -a ! -f $3 ]; then echo "No existen los ficheros introducidos"
# else
# 	if [ "$2" == "Anadir" ]
# 		then
# 		while read userip IP <&5
# 		do
# 			while read user pass
# 			do
# 				ssh $userip@$ip "sudo useradd $user -p $pass -m -U -K UID_MIN=1000" < /dev/null
# 				ssh $userip@$ip "sudo echo "$user"vim:"$pass" | chpasswd" < /dev/null
# 			done < $3
# 		done 5<$1
#
# 	elif [ "$2" == "Eliminar" ]
# 		then
# 		while read userip IP <&5
# 		do
# 			while read user pass
# 			do
# 				ssh $userip@$ip "sudo tar -cvf "$user".tar /home/"$user"" < /dev/null
# 				ssh $userip@$ip "sudo userdel -r $user" < /dev/null
# 			done < $3
# 		done 5<$1
# 		else echo "Orden no reconocida"
# 		fi
# 	fi
# fi

#_____________________________________________________________________#
#_____________________________________________________________________#
#_____________________________________________________________________#
