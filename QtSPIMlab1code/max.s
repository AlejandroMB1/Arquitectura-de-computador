# ===============================================================
#
# File:         max.s
# Description:  This program finds the maximum value in a given
#               array
# Test:
#       age[] = { 15, 23, 14, 25, 60, 10, 9, 11, 60, 40 };
#
# Expected result
#       max = 60
#
# ======================================
#
# Mapping of variables to registers
#
# $s0 stores the address of array age
# $s1 stores max
# $s2 stores i
# $t0 stores internal flag used to compare to 1
# $t1 stores age_ptr
# $t2 stores the result of condition ( i < 10 )
# $t3 stores the value of element age[i]
# $t4 stores the value of condition ( max < age[i] )

#===( Data )=====================================================

          .data                   # Put Global Data here
          .align  2

age:      .word   15, 23, 14, 25, 60, 10, 9, 11, 60, 40

#===( Code )=====================================================

          .text                   # User code starts here
          .align  2
          .globl  main

#---( main )-----------------------------------------------------
main:
          la    $s0, age          # [pseudo] puts address of age into $s0
          addi  $s1, $zero, 0     # max = 0
          addi  $s2, $zero, 0     # i = 0
          addi  $t0, $zero, 1     # $t0 = 1
          addi  $t1, $s0, 0       # $t1 stores the address of age[0]

while:
          slti  $t2, $s2, 10      # $t2 = 1 iff ( i < 10 )
          bne   $t0, $t2, exit    # if ( i >= 10 ), exit from the loop
          lw    $t3, 0($t1)       # load age[i] to $t3
          addi  $t1, $t1, 4       # increment address of age[] by 4 bytes
          slt   $t4, $s1, $t3     # $t4 = 1 iff ( max < age[i] )
          bne   $t0, $t4, next    # if ( max >= age[i] ), do next iteration
          add   $s1, $0, $t3
next:
          addi  $s2, $s2, 1       # i = i + 1
          j     while

exit:
          li    $v0, 10                 # Code for program exit.
          syscall

# Program ends
          .end

# End of file
