.data
mapa: .asciz "______________________________________________________________________________________|\n                                                                                      |\n          *** WORMS ARMAGEDON - ORGA 1 ***                                            |\n______________________________________________________________________________________|\n                                                                                      |\n                                                                                      |\n                                                                                      |\n                                                                                      |\n                                                                                      |\n                                                                                      |\n           +------------+                                                             |\n           |            |                                             @               |\n           |            |                                             ####            |\n           |            |                                            +----------------+\n           +------------+                                            |                |\n                                                                     |                |\n                                                                     |                |\n                                                                     |                |\n                                               +--------------+      |                |\n                                               |              |      |                |\n           @                                   |              |      |                |\n        ####                                   |              |      |                |\n+---------------------------------------+      |              |      |                |\n|                                       |      |              |      |                |\n|                                       |      +--------------+      |                |\n|                                       |                            |                |\n|                                       |                            |                |\n|                                       |                            +----------------+\n|                                       |                                             |\n+---------------------------------------+                                             |\n______________________________________________________________________________________|\n"
longitud = . -mapa
gusanito: .int 1948
.text

//Registros de uso:
//R7,R0,R2,R1
imprimir_mapa:
	.fnstart
		push {r0,r1,r2,r7}
		mov r7,#4
		mov r0,#1	
		mov r2,#longitud	//copiamos la longitud del mapa en r2
		ldr r1,=mapa		//direccionamos el mapa en memoria
		swi 0
		pop {r0,r1,r2,r7}
		bx lr
	.fnend
//Registros de uso:
//
trayectoria_derecha:
	.fnstart
		push{}
		ldr r4,=gusanito
		ldr r4,[r4]
	repetir:
		add r4,#1
		bal colision
		cmp r1,#0
		beq modificar_mapa
		cmp r1,#1
		bal 
		
		pop{}
		bx lr
	.fnend
	
modificar_mapa:
	.fnstart
		push{}
		pop{}
		bx lr
	.fnend
colision:
	.fnstart
		push{}
		pop{}
		bx lr
	.fnend
	
.global main
main:
	bal imprimir_mapa
	
	mov r7,#1
	swi 0

