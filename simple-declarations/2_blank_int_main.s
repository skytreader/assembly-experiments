	.file	"2_blank_int_main.c"
	.text
	.globl	main
	.type	main, @function
main:    # function declaration
.LFB0:   # means Local Function Beginning
	.cfi_startproc # CFI means Call Frame Information
                   # startproc is used at the beginning of each function that
                   # needs an entry in the eh_frame, for possible exceptions.
                   # But C got no use for an eh_frame because there are no
                   # exceptions in C!
	pushq	%rbp # Save the pointer to the base of the stack frame (%rbp). Maybe
                 # so we can go back to it after this function call is done.
	.cfi_def_cfa_offset 16 # cfa means Canonical Frame Address. Typically
                           # the value of the stack pointer at the call site in
                           # the previous frame. (source)[https://stackoverflow.com/a/7535848/777225]
                           # This modifies the rule for computing the CFA. We
                           # still use the same register but the offset is new.
	.cfi_offset 6, -16 # previous value of register (6?) is saved at an
                       # offset (-16?) using the known displacement of the
                       # CFA register from the CFA.
	movq	%rsp, %rbp # copy the stack pointer (%rsp) to the base pointer.
                       # together with L12, this two commands in succession is
                       # known as the function prologue or preamble.
	.cfi_def_cfa_register 6 # Modify the register used for CFA. Offset remains
                            # the same.
	movl	$0, %eax # x86 calling convention requires the return value of a 
                     # function to be stored in %eax. This is how `return 0`
                     # works.
	popq	%rbp # We pop from the stack and move it to %rbp. This "reverses" L!2.
	.cfi_def_cfa 7, 8 # Take the address from register 7 and add an offset 8 to
                      # it. I have no idea what this is for. Even the register
                      # 7 seems like a magic number to me. At least I think I
                      # can explain 8 as "half of 16".
	ret # Jump back to our return address, also stored in the stack frame.
        # Together with L30, this is known as the function epilogue.
	.cfi_endproc # Just the closing tag of startproc.
.LFE0:   # means Local Function End
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
