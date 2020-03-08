#Ejercicio lista de contactos.
.data
	mensaje1:	.asciiz "---LISTA DE CONTACTOS---\n"
	mensaje2:	.asciiz "[1]: Agregar contacto\n"
	mensaje3:	.asciiz "[2]: Borrar contacto\n"
	mensaje4:	.asciiz "[3]: Editar contacto\n"
	mensaje5:	.asciiz "[4]: Buscar contacto\n"
	mensaje6:	.asciiz "[5]: Listado\n"
	mensaje7:	.asciiz "[0]: Salir\n"
	mensaje8:	.asciiz "Que desea hacer? "
	mensaje9: .asciiz "Ingrese el nombre completo del contacto: "
	mensaje10: .asciiz "Ingrese la direccion del contacto: "
	mensaje11: .asciiz "Ingrese el numero celular del contacto: "
	mensaje12: .asciiz "Ingrese el contacto que desea buscar: "
	mensaje13: .asciiz "El contacto se encuentra en la lista"
	arreglo: .space 200
	busqueda: .space 20


	.text	#Inicio instrucciones del programa
main:
	#directiva
	#(addi) #destino, registro a sumar, constante
	#(add) 	#destino,registro 1, registro 2
	#Imprimir en la consola el inicio:
	li $v0,4
	la $a0,mensaje1
	syscall
	li $v0,4
	la $a0,mensaje2
	syscall
	li $v0,4
	la $a0,mensaje3
	syscall
	li $v0,4
	la $a0,mensaje4
	syscall
	li $v0,4
	la $a0,mensaje5
	syscall
	li $v0,4
	la $a0,mensaje6
	syscall
	li $v0,4
	la $a0,mensaje7
	syscall
	li $v0,4
	la $a0,mensaje8
	syscall
	
	#recibir un numero:
	addi $v0,$0,5
	syscall
	add $t0, $0, $v0
	add $t1,$0,$0 #t1 = 0
	addi $t2,$0,1 #t2 = 1
	addi $t3,$0,2 #t3 = 2
	addi $t4,$0,3 #t4 = 3
	addi $t5,$0,4 #t5 = 4
	addi $t6,$0,5 #t6 = 5
	addi $t7,$0,6 #t7 = 6
	addi $t9, $0,200
	add $s0, $0, $0 
	addi $s5, $0, 10
	bne $t8,$0,condicionales
	add $t8,$0,$0
	
condicionales:
	beq $t0,$t1,salir
	beq $t0,$t2,agregar
	#beq $t0,$t3,borrar 
	#beq $t0,$t4,editar 
	beq $t0,$t5,buscar
	beq $t0,$t6,listado
	j salir

agregar:
	
	li $v0,4
	la $a0,mensaje9
	syscall
	li $v0,8 #leer la cadena
	la $a0,arreglo($t8)
	syscall
	li $v0,4
	la $a0,mensaje10
	syscall
	addi $t8,$t8,20
	li $v0,8 #leer la cadena
	la $a0, arreglo($t8)
	syscall
	addi $t8,$t8,20
	li $v0,4
	la $a0,mensaje11
	syscall
	li $v0,8 #leer la cadena
	la $a0,arreglo($t8)
	syscall
	addi $t8,$t8,20
	j salir

buscar:
	beq $s0,$s5,print 
	slt $s2,$t1,$t9
	beq $s2,$0,salir
	addi $t1, $t1, 20
	li $v0,4
	la $a0,mensaje12
	syscall
	li $v0,8
	la $s3,busqueda
	syscall
	add $s3, $0, $0
	add $s4, $0, $0
	#la $s4,arreglo($0)
	jal comparar
	j salir

comparar:
	lb $t1,busqueda($s3)
	lb $t2,arreglo($s4)
	bne $t1,$t2, salir
	beq $t1,$t2 counter

print:
	li $v0,4
	la $a0,mensaje13
	syscall
	j salir

counter:
	addi $s0,$s0,1
	j buscar
listado:
	slt $s1,$t1,$t9
	beq $s1,$0,salir
	addi $t1, $t1, 20
	li $v0,4
	la $a0, arreglo($s0)
	syscall
	addi $s0,$s0,20
	j listado

salir:
	addi $v0,$0,10 #salir del programa
	syscall
	.end
	
	