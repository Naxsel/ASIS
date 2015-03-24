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

#_____________________________________________________________________#
#_____________________________________________________________________#
#_____________________________________________________________________#

# Comandos simples

# cat nombres-ord.txt
# Luis Andion
# Adriana Gomez
# Jorge Pena
# Maria Perez

# cut-c 1-7 nombres-ord.txt
# Luis An
# Adriana
# Jorge P
# Maria P

# cut-d ´ ´ -f 1 nombres-ord.txt
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
#_____________________________________________________________________#
#_____________________________________________________________________#
