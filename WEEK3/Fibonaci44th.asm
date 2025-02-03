@ Step used to converted C into ARM Assembly
@ - Visit https://godbolt.org/
@ - Place your C code to the left-hand box of page
@ - Select compiler, using Arm 32-bit GCC 14.2.0
@ - After successful compilation, the ARM Assembly will appear on the right-hand box

main:
        push    {r7}            @ Save r7 (frame pointer) to the stack
        sub     sp, sp, #28     @ Allocate 28 bytes of stack space for local variables
        add     r7, sp, #0      @ Set r7 as the new frame pointer

        movs    r3, #44         @ Load the value 44 (Fibonacci sequence index) into r3
        str     r3, [r7, #8]    @ Store 44 at stack offset #8

        movs    r3, #0          @ Load 0 into r3 (Fibonacci first term)
        str     r3, [r7, #20]   @ Store 0 at stack offset #20 (variable 'a')

        movs    r3, #1          @ Load 1 into r3 (Fibonacci second term)
        str     r3, [r7, #16]   @ Store 1 at stack offset #16 (variable 'b')

        movs    r3, #2          @ Load 2 into r3 (loop counter 'i' starting from 2)
        str     r3, [r7, #12]   @ Store 2 at stack offset #12

        b       .L2             @ Branch to loop condition check

.L3:
        ldr     r2, [r7, #20]   @ Load 'a' that store at stack offset #20 into r2
        ldr     r3, [r7, #16]   @ Load 'b' that store at stack offset #16 into r3
        add     r3, r3, r2      @ Compute next Fibonacci number by adding r3 and r2, then store in r3
        str     r3, [r7]        @ Store result in r3 to 'temp' (stack offset #0)

        ldr     r3, [r7, #16]   @ Load 'b' that store at stack offset #16 into r3
        str     r3, [r7, #20]   @ Store 'b' into 'a' (stack offset #20) by r3

        ldr     r3, [r7]        @ Load 'temp' that store at stack offset #0 into r3
        str     r3, [r7, #16]   @ Store 'temp' into 'b' (stack offset #16) by r3

        ldr     r3, [r7, #12]   @ Load loop counter 'i' that store at stack offset #12 into r3
        adds    r3, r3, #1      @ Increment loop counter by adding r3 and 1, then store in r3
        str     r3, [r7, #12]   @ Store updated 'i' (stack offset #12) by r3

.L2:    @ Loop Condition Check
        ldr     r2, [r7, #12]   @ Load current loop counter 'i' that store at stack offset #12 into r2
        ldr     r3, [r7, #8]    @ Load value of n (44) that store at stack offset #8 into r3
        cmp     r2, r3          @ Compare r2(i) with r3(n)
        ble     .L3             @ If i <= n, continue looping (doing statement in loop .L3)


        ldr     r3, [r7, #16]   @ Load final Fibonacci number (b) that store at stack offset #16 into r3
        str     r3, [r7, #4]    @ Store the Fibonacci 44th result in stack offset #4

        movs    r3, #0          @ Load 0 (return value)
        mov     r0, r3          @ Set return value in r0

        adds    r7, r7, #28     @ Restore stack pointer
        mov     sp, r7          @ Reset stack pointer
        ldr     r7, [sp], #4    @ Restore frame pointer (r7)
        bx      lr              @ Return from function