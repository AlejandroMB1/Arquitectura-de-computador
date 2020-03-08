# ===============================================================
#
# File:         add1.s
# Description:  This program adds two numbers
# Test:
# a = 3
# b = 6
# Expected result
# c = 9
#
# ======================================
#
# Mapping of variables to registers
#
# $s1 <- a
# $s2 <- b
# $s3 <- c

#===( Code )=====================================================

          .text                   # User code starts here
          .align  2
          .globl  main

#---( main )-----------------------------------------------------
main:
          andi    $s1, $s1, 0     # clear augend
          addi    $s1, $s1, 3     # load $s1 (R17) with 3, the augend
          andi    $s2, $s2, 0     # clear addend
          addi    $s2, $s2, 6     # load $s2 (R18) with 6, the addend
          add     $s3, $s1, $s2   # add the two numbers

exit:
          li      $v0, 10         # syscall to exit cleanly from main only
          syscall                 # this ends execution

# Program ends
        .end

# End of file
