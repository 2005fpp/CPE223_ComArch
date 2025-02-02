main:
        push    {r7}		@ save r7 on stack
        sub     sp, sp, #28	@ Allocate 28 bytes memory on stack for local variables
        add     r7, sp, #0	@ Set r7 as new frame pointer
        movs    r3, #44		@ Load constant 44 to r3 | int n = 44;
        str     r3, [r7, #8]	@ then store r3 (44) in memory offset 8 | int n = 44;
        movs    r3, #0		@ Load constant 0 to r3 | int a = 0
        str     r3, [r7, #20]	@ then store r3 (0) in memory offset 20 |
        movs    r3, #1		@ Load constant 1 to r3
        str     r3, [r7, #16]	@ then store r3 (1) in memory offset 16
        movs    r3, #2		@ Load constant 2 to r3
        str     r3, [r7, #12]	@ then store r3 (2) in memory offset 12
        b       .L2		@ Branch, loop condition check

		
.L3:    @Loop
        ldr     r2, [r7, #20]	@ Load a to r2 (previous fibonacci value)
        ldr     r3, [r7, #16]	@ Load b to r3 (current fibonacci value)
        add     r3, r3, r2      @ Add a and b then store result on r3
        str     r3, [r7]	@ Store r3 (temp) in memory offset 0
        ldr     r3, [r7, #16]	@ Load b to r3
        str     r3, [r7, #20]	@ Store b on a (update a = b)
        ldr     r3, [r7]	@ Load temp result (a+b) to r3
        str     r3, [r7, #16]	@ Store temp result on b (update b = temp)
        ldr     r3, [r7, #12]	@ Load current loop counter (i) to r3
        adds    r3, r3, #1	@ Add r3 and 1 then store result on r3 (increment counter)
        str     r3, [r7, #12]	@ Store r3 (new counter value) on memory offset 12

		
.L2:    @ Loop condition check
        ldr     r2, [r7, #12]	@ Load loop counter to r2
        ldr     r3, [r7, #8]	@ Load loop stop condition (44) to r3
        cmp     r2, r3		@ Compare r2 and r3
        ble     .L3		@ If loop counter <= 44, continue looping
        ldr     r3, [r7, #16]	@ Load b to r3
        str     r3, [r7, #4]	@ Store b on result
        movs    r3, #0		@ Load 0 into r3 (for return main func.)
        mov     r0, r3		@ Load r3 into r0 (return 0)
        adds    r7, r7, #28	@ Deallocate local variables
        mov     sp, r7		@ Restore stack pointer
        ldr     r7, [sp], #4	@ Restore frame pointer
        bx      lr		@ Return from the function

@ Using Arm 32-bit GCC 14.2.0 compiler