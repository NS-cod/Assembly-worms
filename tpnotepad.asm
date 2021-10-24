.data
mapa: .asciz "______________________________________________________________________________________|\n                                                                                      |\n          *** WORMS ARMAGEDON - ORGA 1 ***                                            |\n______________________________________________________________________________________|\n                                                                                      |\n                                                                                      |\n                                                                                      |\n                                                                                      |\n                                                                                      |\n                                                                                      |\n           +------------+                                                             |\n           |            |                                             @               |\n           |            |                                             ####            |\n           |            |                                            +----------------+\n           +------------+                                            |                |\n                                                                     |                |\n                                                                     |                |\n                                                                     |                |\n                                               +--------------+      |                |\n                                               |              |      |                |\n           @                                   |              |      |                |\n        ####                                   |              |      |                |\n+---------------------------------------+      |              |      |                |\n|                                       |      |              |      |                |\n|                                       |      +--------------+      |                |\n|                                       |                            |                |\n|                                       |                            |                |\n|                                       |                            +----------------+\n|                                       |                                             |\n+---------------------------------------+                                             |\n______________________________________________________________________________________|\n"
longitud = . -mapa
gusanito: .int 1948 //posicion numerica del gusanito en los caracteres del mapa.
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
//r4,r5
trayectoria_derecha:
	.fnstart
		push{r4,r5}
		ldr r4,=gusanito
		ldr r4,[r4]
		mov r5,"*"
	repetir:														
		add r4,#1													
		bal colision//(R1), si colision devuelve 0 en R10, es porque no hubo. Si da 1, hubo.
		cmp r10,#0
		beq modificar_mapa //recibe siempre y para todas las subrutinas, R4,R5
		cmp r10,#0
		beq repetir
		pop{r4,r5}
		bx lr
	.fnend
	
modificar_mapa:
	.fnstart
		push{}
		r12,=mapa
		
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
	r12,=mapa
	ldr r6,=gusanito
	ldr r6,[r6]
	add r12,r6
	
	mov r7,#4
	mov r0,#1	
	mov r2,#longitud	//copiamos la longitud del mapa en r2
	ldr r1,r12		//direccionamos el mapa en memoria
	swi 0
	
	mov r7,#1
	swi 0

