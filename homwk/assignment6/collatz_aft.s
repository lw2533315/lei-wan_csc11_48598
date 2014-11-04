.data
 
message: .asciz "Type a number: "
scan_format : .asciz "%d"
message2: .asciz "Length of the Hailstone sequence for %d is %d\n"
 m3:.asciz"After loop, it take %d sec\n"
.text
 
collatz:

    
    mov r1, r0
    mov r4,#0
    mov r0, #0
    bl time
    mov r5,r0
  collatz_loop:
    cmp r1, #1                 /* compare r1 and 1 */
    beq collatz_end            /* if r1 == 1 branch to collatz_end */
    and r2, r1, #1             /* r2 ? r1 & 1 */
        cmp r2, #0                 /* compare r2 and 0 */
    moveq r1, r1, ASR #1       /* if r2 == 0, r1 ? r1 >> 1. This is r1 ? r1/2 */
    addne r1, r1, r1, LSL #1   /* if r2 != 0, r1 ? r1 + (r1 << 1). This is r1 ? 3*r1 */
    addne r1, r1, #1           /* if r2 != 0, r1 ? r1 + 1. */
            
  collatz_end_loop:
    add r4, r4, #1             /* r0 ? r0 + 1 */
    b collatz_loop 
    mov r0,#0
    bl time
    mov r6,r0
    sub r6,r6,r5
    ldr r0,ad_m3
    mov r1,r6
    bl printf
  collatz_end:
    bx lr
 
.global main
main:
    push {lr}                       /* keep lr */
    sub sp, sp, #4                  /* make room for 4 bytes in the stack */
                                    /* The stack is already 8 byte aligned */
 
    ldr r0, address_of_message      /* first parameter of printf: &message */
    bl printf                       /* call printf */
 
    ldr r0, address_of_scan_format  /* first parameter of scanf: &scan_format */
    mov r1, sp                      /* second parameter of scanf:
                                       address of the top of the stack */

    bl scanf                        /* call scanf */
 
    ldr r0, [sp]                    /* first parameter of collatz:
                                       the value stored (by scanf) in the top of the stack */
    bl collatz                      /* call collatz */
 
    mov r2, r0                      /* third parameter of printf:
                                       the result of collatz */
    ldr r1, [sp]                    /* second parameter of printf:
                                       the value stored (by scanf) in the top of the stack */
    ldr r0, address_of_message2     /* first parameter of printf: &address_of_message2 */
    bl printf
 
    add sp, sp, #4
    pop {lr}
    bx lr
 
 
address_of_message: .word message
address_of_scan_format: .word scan_format
address_of_message2: .word message2
ad_m3:.word m3
.global time
.global printf
.global scanf
