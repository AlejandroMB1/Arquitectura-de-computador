# ===============================================================
#
# File:         add3.s
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
# $s2 <- addend
# $a0 <- augend + addend

#===( Code )=====================================================

          .text                   # User code starts here
          .align  2
          .globl  main

#---( main )-----------------------------------------------------
main:
          # Ask the OS to read a number.
          li      $v0, 5                  # Code for read int.
          syscall                         # Ask the system for service.
          move    $s1, $v0                # Copy to safer location.

          # Ask for another number.
          li      $v0, 5                  # Code for read int.
          syscall                         # Ask the system for service.
          move    $s2, $v0                # Copy to safer location.

          # Add the previous value to the one we just read.
          add     $a0, $s1, $s2

          # Ask the system to print it.
          li      $v0, 1                  # Code for print int.
          syscall

exit:
          # Call exit.
          li      $v0, 10                 # Code for program exit.
          syscall

# Program ends
          .end

# End of file
