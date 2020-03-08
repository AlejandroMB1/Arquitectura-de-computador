# ===============================================================
#
# File:         template.s
# Description:  This program...
# Test:
#
#
# Expected result
#
#
# ======================================
#
# Mapping of variables to registers
#


#===( Data )=====================================================

          .data                   # Put Global Data here
          .align  2

#  Put your global data here

#===( Code )=====================================================

          .text                   # User code starts here
          .align  2
          .globl  main

#---( main )-----------------------------------------------------
main:

#  Put your MIPS assembly code here

exit:
          li      $v0, 10                 # Code for program exit.
          syscall

# Program ends
          .end

# End of file
