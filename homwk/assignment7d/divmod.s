
.data

.text
.global scaleright
scaleRight:
	push {r4,lr}
	doWhile_r1_lt_r2:
		mov r3,r3,ASR #1
		mov r2,r2,ASR #1
	cmp r1,r2
	blt doWhile_r1_lt_r2
	pop {r4,lr}
    bx lr
.global addsub
addsub:
	push {r4,lr}
	doWhile_r3_ge_1:
		add r0,r0,r3
		sub r1,r1,r2
		bl scaleRight
	cmp r3,#1
	bge doWhile_r3_ge_1
    pop {r4,lr}
    bx lr
.global scaleleft
scaleleft:
	push {r4,lr}
	doWhile_r1_ge_r2:
		mov r3,r3,LSL #1
		mov r2,r2,LSL #1
		cmp r1,r2
	bge doWhile_r1_ge_r2
	mov r3,r3,ASR #1
	mov r2,r2,ASR #1
	pop {r4,lr}
    bx lr
.global div
div:
	push {r4,lr}
	mov r0,#0
	mov r3,#1
	cmp r1,r2
	blt end
		bl scaleleft
		bl addsub
	end:
       
       
	pop {r4,lr}
    bx lr
