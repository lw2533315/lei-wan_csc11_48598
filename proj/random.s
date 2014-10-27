.data

.text
.global scaleright
scaleRight:
	push {lr}
	doWhile_r1_lt_r2:
		mov r3,r3,ASR #1
		mov r2,r2,ASR #1
	cmp r1,r2
	blt doWhile_r1_lt_r2
	pop {lr}
    bx lr
.global addsub
addSub:
	push {lr}
	doWhile_r3_ge_1:
		add r0,r0,r3
		sub r1,r1,r2
		bl scaleRight
	cmp r3,#1
	bge doWhile_r3_ge_1
    pop {lr}
    bx lr
.global scaleleft
scaleleft:
	push {lr}
	doWhile_r1_ge_r2:
		mov r3,r3,LSL #1
		mov r2,r2,LSL #1
		cmp r1,r2
	bge doWhile_r1_ge_r2
	mov r3,r3,ASR #1
	mov r2,r2,ASR #1
	pop {lr}
    bx lr
.global divmod
divMod:
	push {lr}
	mov r0,#0
	mov r3,#1
	cmp r1,r2
	blt end
		bl scaleleft
		bl addsub
	end:
	pop {lr}
    bx lr

.global random
random:
    push {lr}
mov r0,#0
bl time
  bl srand
	bl rand
mov r1,r0,asr #1
/*	bl abs
       mov r1,r0*/ 
	mov r2,#38
	bl divMod                    /* Call divMod function to get remainder */
	add r1,#1                   /* Remainder in r1 so add 10 giving between 10 and 99 -> 2 digits */
    pop {lr}
    bx lr



.global printf
.global time
.global srand
.global rand
.global abs