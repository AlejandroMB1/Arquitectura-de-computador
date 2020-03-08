.data
	enter:	.asciiz	"\n"
.text
	main:
		addi $s1,$zero,5 #cantidad de numeros en pila
		addi $s2,$zero,0 #contador
		addi $s0,$zero,5
		addi $sp,$sp,-20
		sw $s0, 0($sp)

		addi $s0,$s0,5
		addi $sp,$sp,4
		sw $s0, 0($sp)

		addi $s0,$s0,5
		addi $sp,$sp,4
		sw $s0, 0($sp)

		addi $s0,$s0,5
		addi $sp,$sp,4
		sw $s0, 0($sp)

		addi $s0,$s0,5
		addi $sp,$sp,4
		sw $s0, 0($sp)
		jal print
		#exit:
		li $v0,10
		syscall

	print:
		#print pila 
		lw $s0,0($sp) 
		li $v0, 1
		move $a0,$s0
		syscall
		#space
		li $v0, 4
		la $a0,enter
		syscall
		#second number
		addi $sp,$sp,-4
		addi $s2,$s2,1
		bne $s1,$s2,print
		beq $s1,$s2,return

	return:
		jr $ra
		