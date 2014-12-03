
.data
intF:.asciz "%dF\n"
intC: .asciz "%dC\n"
fC: .asciz"%fC\n"
sec: .asciz "time=%d\n"
F: .float 200.0
threetwo: .float 32
nine: .float 9
five: .float 5
fF: .asciz"%fF\n"

.text
	.global main
main:
	push {r4, lr}
	ldr r0, addr_intF
	mov r1, #200
	bl printf

	mov r0, #0
	bl time
	mov r4, r0	
	mov r7, #0	
	ldr r8, =2000000
	mov r9, #0
	ldr r10, =20

divloop:
	mov r1, #212
	sub r1, r1, #32
	mov r2, #5
	mul r1, r2, r1
	mov r2, #9
	bl divMod
	mov r1, r0
	add r7, r7, #1
	cmp r7, r8
	blt divloop
	mov r7, #0
	add r9, r9, #1
	cmp r9, r10
	blt divloop

OutputDivMod:
	mov r1, r0
	ldr r0, addr_intC
	bl printf
	mov r0, #0
	bl time
	mov r5, r0	/* time=r5-r4 */
	ldr r0, addr_sec
	sub r1, r5, r4
	bl printf

shifting:
	mov r0, #0
	bl time
	mov r4, r0
	mov r7, #0
	mov r9, #0

shiftloop:
	mov r1, #200
	sub r1, r1, #32
	ldr r6, =0x8e38f
	mul r1, r6, r1
	asr r1, #20
	add r7, r7, #1
	cmp r7, r8
	blt shiftloop
	mov r7, #0
	add r9, r9, #1
	cmp r9, r10
	blt shiftloop

OutputShifting:
	ldr r0, addr_intC
	bl printf
	mov r0, #0
	bl time
	sub r1, r0, r4
	ldr r0, addr_sec
	bl printf

floating:
	mov r0, #0			@set time
	bl time
	mov r4, r0			@r4=start
	mov r7, #0			@inner loop counter
	ldr r8, =2000000
	mov r9, #0			@outer loop counter
	ldr r10, =20

	ldr r0, addr_fF
	ldr r1, addr_F
	vldr s14, [r1]
	vcvt.f64.f32 d3, s14
	vmov r2, r3, d3
	bl printf			@output ?F

floatloop:
	ldr r1, addr_F
	vldr s12, [r1]
	ldr r2, addr_threetwo
	vldr s13, [r2]
	ldr r3, addr_five
	vldr s14, [r3]
	ldr r4, addr_nine
	vldr s15, [r4]

	vsub.f32 s12, s12, s13
	vmul.f32 s12, s14, s12
	vdiv.f32 s12, s12, s15

	vcvt.f64.f32 d0, s12	@calculation end

	add r7, r7, #1			@increase inner loop counter
	cmp r7, r8
	blt floatloop			@inner for loop
	add r9, r9, #1			@increase louter loop counter
	cmp r9, r10
	blt floatloop			@outer for loop

outputfloat:
	mov r0, #0
	bl time
	mov r5, r0
	sub r5, r5, r4			@difftime(end_r0, start_r4)
	ldr r0, addr_fC
	vmov r2, r3, d0
	bl printf

	ldr r0, addr_sec
	mov r5, r4				@r1=difftime
	bl printf

/* end */
	pop {r4, lr}
	bx lr
scaleRight:
	push {lr}
doWhile_r1_lt_r2:
	mov r3,r3,asr #1
	mov r2,r2,asr #1
	cmp r1,r2
	blt doWhile_r1_lt_r2
	pop {lr}
    	bx lr

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

scaleLeft:
	push {lr}
doWhile_r1_ge_r2:
	mov r3,r3,lsl #1
	mov r2,r2,lsl #1
	cmp r1,r2
	bge doWhile_r1_ge_r2
	mov r3,r3,asr #1
	mov r2,r2,asr #1
	pop {lr}
    	bx lr

divMod:
	push {lr}
	mov r0,#0
	mov r3,#1
	cmp r1,r2
	blt end
	bl scaleLeft
	bl addSub
end:
	pop {lr}
    	bx lr

addr_F: .word F
addr_intC: .word intC
addr_sec: .word sec
addr_five: .word five
addr_nine: .word nine
addr_threetwo: .word threetwo
addr_intF: .word intF
addr_fC: .word fC
addr_fF: .word fF
.global printf
.global scanf
.global time
