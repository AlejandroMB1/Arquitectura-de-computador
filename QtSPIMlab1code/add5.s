# ===============================================================
#
# File:         add5.s
# Description:  This program adds two numbers
# Test:
# augend = 3
# addend = 6
# Expected result
# 9
#
# ======================================
#
# Mapping of variables to registers
#
# $a0 <- augend
# $a1 <- addend
# $t0 <- augend + addend

#===( Data )=====================================================

          .data                   # Put Global Data here
          .align  2

str1:
          .asciiz "Enter addend = "
str2:
          .asciiz "Enter augend = "
str3:
          .asciiz "Result = "

#===( Code )=====================================================

          .text                   # User code starts here
          .align  2
          .globl  main

#---( main )-----------------------------------------------------
main:
          # Ask the OS to read a number via getData.
          la      $a0, str1
          jal     getData
          add     $t0, $0, $v0            # Copy augend to safer location.

          # Ask for another number via getData.
          la      $a0, str2
          jal     getData
          add     $t1, $0, $v0            # Copy addend to safer location.

          # Copy arguments into argument registers
          add     $a0, $0, $t0            # augend
          add     $a1, $0, $t1            # addend
          # Call sum function
          jal     sum
          add     $t0, $0, $v0            # Copy result to safer location.

          # Ask the system to print result.
          li      $v0, 4                  # Code for print_str.
          la      $a0, str3
          syscall                         # Ask the system for service.
          add     $a0, $0, $t0
          li      $v0, 1                  # Code for print int.
          syscall

exit:
          li      $v0, 10                 # Code for program exit.
          syscall

#---( getData )--------------------------------------------------
getData:
          li      $v0, 4                  # Code for print_str.
          syscall                         # Ask the system for service.
          li      $v0, 5                  # Code for read int.
          syscall                         # Ask the system for service.
          jr      $ra

#---( sum )------------------------------------------------------
sum:
          add     $t0, $a0, $a1           # $s0 = arg1 + arg2
          add     $v0, $t0, $0            # return value in $v0
          jr      $ra                     # return to caller

# Program ends
          .end

# End of file
