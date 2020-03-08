# ===============================================================
#
# File:         add4.s
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
# $s1 <- augend
# $v0 <- addend
# $t0 <- augend + addend

#===( Data )=====================================================

          .data                   # Put Global Data here
          .align  2

str1:
          .asciiz "Enter augend = "
str2:
          .asciiz "Enter addend = "
str3:
          .asciiz "Result = "

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
          move    $s1, $v0                # Copy augend to safer location.

          # Ask for another number.
          li      $v0, 4                  # Code for print_str.
          la      $a0, str2
          syscall                         # Ask the system for service.
          li      $v0, 5                  # Code for read int.
          syscall                         # Ask the system for service.

          # Add the previous value to the one we just read.
          add     $t0, $s1, $v0

          # Ask the system to print result.
          li      $v0, 4                  # Code for print_str.
          la      $a0, str3
          syscall                         # Ask the system for service.
          li      $a0, 0
          add     $a0, $0, $t0
          li      $v0, 1                  # Code for print int.
          syscall

exit:
          li      $v0, 10                 # Code for program exit.
          syscall

# Program ends
          .end

# End of file
