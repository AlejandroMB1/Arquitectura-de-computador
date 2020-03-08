# ===============================================================
#
# File:         factorial.s
# Description:  This program calculates n!
# Test:
# input 3
# Expected result
# 6
#
# ======================================
#
# Mapping of variables to registers
#
# $a0 <- n
# $t0 <- n!

#===( Data )=====================================================

            .data                           # Put Global Data here
            .align  2

str1:
            .asciiz "Enter n = "
str2:
            .asciiz "n! = "

#===( Code )=====================================================

            .text                   # User code starts here
            .align  2
            .globl  main

#---( main )-----------------------------------------------------
main:
            # Ask the OS to read a number.
            li      $v0, 4                  # Code for print_str.
            la      $a0, str1
            syscall                         # Ask the system for service.
            li      $v0, 5                  # Code for read int.
            syscall                         # Ask the system for service.

            # Copy argument into argument registers
            add     $a0, $0, $v0            # Copy n
            # Call factorial function
            jal     factorial
            add     $t0, $0, $v0            # Copy result to safer location.

            # Ask the system to print result.
            li      $v0, 4                  # Code for print_str.
            la      $a0, str2
            syscall                         # Ask the system for service.
            li      $a0, 0
            add     $a0, $a0, $t0
            li      $v0, 1                  # Code for print int.
            syscall

exit:
            li      $v0, 10                 # Code for program exit.
            syscall

#---( factorial )------------------------------------------------
factorial:
            addi $sp, $sp, -8               # make room
            sw   $a0, 4($sp)                # store $a0
            sw   $ra, 0($sp)                # store $ra
            addi $t0, $0, 2
            slt  $t0, $a0, $t0              # n == 1 ?
            beq  $t0, $0, else              #  no: go to else
            addi $v0, $0, 1                 #  yes: 1! = 1
            addi $sp, $sp, 8                # restore $sp
            jr   $ra                        # return (1)
else:
            addi $a0, $a0, -1               # n = n - 1
            jal  factorial                  # recursive call
            lw   $ra, 0($sp)                # restore $ra
            lw   $a0, 4($sp)                # restore $a0
            addi $sp, $sp, 8                # restore $sp
            mul  $v0, $a0, $v0              # n * factorial(n-1)
            jr   $ra                        # return

# Program ends
            .end

# End of file
