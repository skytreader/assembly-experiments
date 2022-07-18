    .file   "2_blank_int_main.c"
    .text
    .globl  main
    .type   main, @function
main:    # function declaration
.LFB0:   # means Local Function Beginning
    .cfi_startproc # CFI means Call Frame Information
                   # startproc is used at the beginning of each function that
                   # needs an entry in the eh_frame, for possible exceptions.
                   # But C got no use for an eh_frame because there are no
                   # exceptions in C!
    pushq   %rbp # Save the pointer to the base of the stack frame (%rbp). Maybe
                 # so we can go back to it after this function call is done.
    .cfi_def_cfa_offset 16 # cfa means Canonical Frame Address. Typically
                           # the value of the stack pointer at the call site in
                           # the previous frame. (source)[https://stackoverflow.com/a/7535848/777225]
                           # This modifies the rule for computing the CFA. We
                           # still use the same register but the offset is new.
    .cfi_offset 6, -16 # previous value of register (6?) is saved at an
                       # offset (-16?) using the known displacement of the
                       # CFA register from the CFA.
################################################################################
    # ON REGISTERS
    # (https://www.eecg.utoronto.ca/~amza/www.mindsec.com/files/x86regs.html)

    # General registers: EAX EBX ECX EDX
    # - R*X - 64 bit
    # - E*X - 32 bit
    # - *X - 16 bit (and this actually represents the register's name)
    # - *H *L - 8 bit (representing the High and Low parts of the 16 bit)
    #
    # Values for *:
    #
    # (A) the accumulator register, used for I/O port access, arithmetic,
    # interrupt calls, etc.
    #
    # (B) the base register, used as a base pointer for memory access. Also gets
    # some interrupt _return_ values.
    #
    # (C) the counter register, used as a loop counter and for shifts. Also gets
    # some interrupt values.
    #
    # (D) the data register, used for I/O port access, arithmetic, some
    # interrupt calls.

    # Segment registers: CS DS ES FS GS SS
    #  - hold the segment address of various items.
    #  - only available in 16-bit values.
    #  - can only be set by a general register or special instructions.
    #  - "Some of them are critical for the good execution of the program and
    #    you might want to consider playing with them when you'll be ready for
    #    multi-segment programming."
    #
    # CS - holds the code segment in which your program runs. Changing its value
    # could cause the computer to hang.
    #
    # DS - holds the data segment that your program accesses. Changins its value
    # could lead to "corrupted" data.
    #
    # ES FS GS - extra segment registers available for far pointer addressing
    # like video memory, etc.
    #
    # SS - holds the stack segment your program uses. Sometimes has the same
    # value as DS (when?). Changing its value can give unpredictable results.

    # Indexes and pointers: ESI EDI EBP EIP ESP
    #  - these are the offset parts of an address.
    # (TBC because I can't decode the English of the source material.)
    movq    %rsp, %rbp # copy the stack pointer (%rsp) to the base pointer.
                       # together with L12, this two commands in succession is
                       # known as the function prologue or preamble.
    .cfi_def_cfa_register 6 # Modify the register used for CFA. Offset remains
                            # the same.
    movl    $0, %eax # x86 calling convention requires the return value of a 
                     # function to be stored in %eax. This is how `return 0`
                     # works.
################################################################################
    popq    %rbp # We pop from the stack and move it to %rbp. This "reverses" L!2.
    .cfi_def_cfa 7, 8 # Take the address from register 7 and add an offset 8 to
                      # it. I have no idea what this is for. Even the register
                      # 7 seems like a magic number to me. At least I think I
                      # can explain 8 as "half of 16".
    ret # Jump back to our return address, also stored in the stack frame.
        # Together with L30, this is known as the function epilogue.
    .cfi_endproc # Just the closing tag of startproc.
.LFE0:   # means Local Function End
    .size   main, .-main
    .ident  "GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
    .section    .note.GNU-stack,"",@progbits
