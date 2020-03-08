.data 
	arreglo: .space 20

.text
	main:
		addi $t0,$0,5
		addi $t1,$0,5
		#indice
		addi $s0,$0,0
		addi $s1,$0,0 #contador
		addi $s3,$0,0 #contador2
	while:
		beq $s1,$t1,print
		sw $t0,arreglo($s0)
		addi $s0,$s0,4
		addi $s1,$s1,1
		addi $t0,$t0,5
		j while
	print:
		beq $s1,$0,exit
		lw $s2,arreglo($s3)
		li $v0,1
		addi $a0,$s2,0
		syscall
		addi $s3,$s3,4
		sub $s1,$s1,1
		j print

	exit:
		li $v0,10	
		syscall

