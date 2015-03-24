#!/bin/bash
# Alejandro Solanas - 647647

# El siguiente script se ejecuta de la siguiente forma ./practica5_1.sh [user] [ip] 


	ssh $1@$2 "sudo sfdisk -s" 
	ssh $1@$2 "sudo sfdisk -l"
	ssh $1@$2 "sudo pvs ; sudo pvdisplay"
	ssh $1@$2 "sudo vgs ; sudo vgdisplay" 
	ssh $1@$2 "sudo lvs ; sudo lvdisplay"  
	ssh $1@$2 "sudo df -hT" 		
			
