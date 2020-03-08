# ===============================================================
#
# File:         HelloWorld.s
# Description:  Hello, World!
# Test:
# input nothing
# Expected result
# "Hello, World!" on console
#
# ======================================
#
# Mapping of variables to registers
#

#===( Data )=====================================================

        .data             # Data declaration section

str:    .asciiz           "\nHello, World!\n"

#===( Code )=====================================================

        .text             # Assembly language instructions

#---( main )-----------------------------------------------------
main:                     # Start of code section
        li      $v0, 4    # system call code for printing string = 4
        la      $a0, str  # load address of string to be printed into $a0
        syscall           # call operating system to perform operation in $v0
                          # syscall takes its arguments from $a0, $a1, ...

exit:
        li      $v0, 10   # system call code for exit
        syscall           # make the system call to exit

# Program ends
        .end

# End of file
