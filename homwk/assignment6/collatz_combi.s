.data
m1:.asciz"time without predication: %d\n"
m2:.asciz"time with predication: %d\n"
.text
collatz:
    /* r0 contains the first argument */
    push {lr}
    sub sp, sp, #4  /* Make sure the stack is 8 byte aligned */
    mov r4, #222
    mov r3, #4194304
    
   mov r0,#0
bl time
mov r5,r0
  collatz_repeat:
    mov r1, r4                 /* r1 �� r0 */
    mov r0, #0                 /* r0 �� 0 */
  collatz_loop:
    cmp r1, #1                 /* compare r1 and 1 */
    beq collatz_end            /* if r1 == 1 branch to collatz_end */
    and r2, r1, #1             /* r2 �� r1 & 1 */
    cmp r2, #0                 /* compare r2 and 0 */
    bne collatz_odd            /* if r2 != 0 (this is r1 % 2 != 0) branch to collatz_odd */
  collatz_even:
    mov r1, r1, ASR #1         /* r1 �� r1 >> 1. This is r1 �� r1/2 */
    b collatz_end_loop         /* branch to collatz_end_loop */
  collatz_odd:
    add r1, r1, r1, LSL #1     /* r1 �� r1 + (r1 << 1). This is r1 �� 3*r1 */
    add r1, r1, #1             /* r1 �� r1 + 1. */
  collatz_end_loop:
    add r0, r0, #1             /* r0 �� r0 + 1 */
    b collatz_loop             /* branch back to collatz_loop */
  collatz_end:
    sub r3, r3, #1
    cmp r3, #0
    bne collatz_repeat
    
    mov r0,#0
bl time
mov r6,#0
sub r6,r6,r5
ldr r0, ad_m1
mov r1,r6
bl printf


    add sp, sp, #4  /* Make sure the stack is 8 byte aligned */
    pop {lr}
    bx lr


   collatz2:
    /* r0 contains the first argument */
    push {lr}
    sub sp, sp, #4  /* Make sure the stack is 8 byte aligned */
    mov r4, #222
    mov r3, #4194304

    mov r0,#0
bl time
mov r5,r0
  collatz_repeat2:
    mov r1, r4                 /* r1 �� r0 */
    mov r0, #0                 /* r0 �� 0 */
  collatz2_loop:
    cmp r1, #1                 /* compare r1 and 1 */
    beq collatz2_end           /* if r1 == 1 branch to collatz2_end */
    and r2, r1, #1             /* r2 �� r1 & 1 */
    cmp r2, #0                 /* compare r2 and 0 */
    moveq r1, r1, ASR #1       /* if r2 == 0, r1 �� r1 >> 1. This is r1 �� r1/2 */
    addne r1, r1, r1, LSL #1   /* if r2 != 0, r1 �� r1 + (r1 << 1). This is r1 �� 3*r1 */
    addne r1, r1, #1           /* if r2 != 0, r1 �� r1 + 1. */
  collatz2_end_loop:
    add r0, r0, #1             /* r0 �� r0 + 1 */
    b collatz2_loop            /* branch back to collatz2_loop */
  collatz2_end:
    sub r3, r3, #1
    cmp r3, #0
    bne collatz_repeat2

mov r0,#0
bl time
mov r6,r0
sub r6, r6,r5
ldr r0,ad_m2
mov r1,r6
bl printf
    add sp, sp, #4             /* Restore the stack */
    pop {lr}
    bx lr


 .global main
main:
push {lr}

bl collatz
bl collatz2

pop {lr}
bx lr

ad_m1:.word m1
ad_m2:.word m2
