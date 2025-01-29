main:
        push    {r7}
        sub     sp, sp, #28
        add     r7, sp, #0
        movs    r3, #44
        str     r3, [r7, #8]
        movs    r3, #0
        str     r3, [r7, #20]
        movs    r3, #1
        str     r3, [r7, #16]
        movs    r3, #2
        str     r3, [r7, #12]
        b       .L2
.L3:
        ldr     r2, [r7, #20]
        ldr     r3, [r7, #16]
        add     r3, r3, r2
        str     r3, [r7]
        ldr     r3, [r7, #16]
        str     r3, [r7, #20]
        ldr     r3, [r7]
        str     r3, [r7, #16]
        ldr     r3, [r7, #12]
        adds    r3, r3, #1
        str     r3, [r7, #12]
.L2:
        ldr     r2, [r7, #12]
        ldr     r3, [r7, #8]
        cmp     r2, r3
        ble     .L3
        ldr     r3, [r7, #16]
        str     r3, [r7, #4]
        movs    r3, #0
        mov     r0, r3
        adds    r7, r7, #28
        mov     sp, r7
        ldr     r7, [sp], #4
        bx      lr