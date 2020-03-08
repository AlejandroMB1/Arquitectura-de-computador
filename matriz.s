.data
	matriz:  .word 5,4
			 .word 8,9

	size:    .word 2
	

.text
	main:
		la $a0, matriz
		lw $a1, size
		
		li $v0,0
		li $t0,0
		while:
		mul $t1, $t0, $a1
		move $a0, $v0

		li $v0,1
		syscall

		#Exit
		li $v0,10
		syscall