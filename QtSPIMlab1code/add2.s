# ===============================================================
#
# File:         add2.s
# Description:  This program adds two numbers
# Test:
# Three = 3
# Six = 6
# Expected result
# Result = 9
#
# ======================================
#
# Mapping of variables to registers
#
# $s1 <- Three
# $s2 <- Six
# $s3 <- Result

#===( Data )=====================================================

          .data                   # Put Global Data here
          .align  2

Three:    .word   3               # allocate one word, initialize with 3
Six:      .word   6               # allocate one word, initialize with 6
Result:   .word   0               # allocate one word, initialize with 0

#===( Code )=====================================================

          .text                   # User code starts here
          .align  2
          .globl  main

#---( main )-----------------------------------------------------
main:
          lw      $s1, Three      # load $s1 (R17) with 3, the augend
          lw      $s2, Six        # load $s2 (R18) with 6, the addend
          add     $s3, $s1, $s2   # add the two numbers
          sw      $s3, Result     # store the result

exit:
          li      $v0, 10         # syscall to exit cleanly from main only
          syscall                 # this ends execution

# Program ends
          .end

# End of file

