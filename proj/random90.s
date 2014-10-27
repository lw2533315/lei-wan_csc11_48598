.data
in1: .asciz "type 1 to choose Single Number\n"
in2:.asciz"type 2 to choose Column\n"
in3:.asciz"type 3 to choose Single Row\n"
in4:.asciz"type 4 to choose Red/Black\n"
in5:.asciz"type 5 to choose Even/Odd\n"
in6:.asciz"type 6 to start,any other number continue to choose bet method\n"
format:.asciz"%d"
.balign 4
store1:.word 0
.balign 4
store2:.word 0
.balign 4
store3:.word 0
.balign 4
store4:.word 0
.balign 4
store5:.word 0
.text

scaleRight:
	push {lr}
	doWhile_r1_lt_r2:
		mov r3,r3,ASR #1
		mov r2,r2,ASR #1
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
		mov r3,r3,LSL #1
		mov r2,r2,LSL #1
		cmp r1,r2
	bge doWhile_r1_ge_r2
	mov r3,r3,ASR #1
	mov r2,r2,ASR #1
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

.global main
main:
mov r10, #100        @acount balance initiate $100
more:
bl random
mov r9,r1      @recorder the ball
mov r11,#0    @counter
mov r4,#1
mov r5,#1
mov r6,#1
mov r7,#1
mov r8,#1   @judge whether keep on the same method
game:
cmp r4,#1
beq singlenum
bne run1             @~~~~~~~~~~~~~
singlenum:
ldr r0, addr_in1
bl printf
run1:
cmp r5,#1
beq column
bne run2

column:
ldr r0, addr_in2
bl printf

run2:
cmp r6,#1
beq singler
bne run3
singler:
ldr r0,addr_in3
bl printf

run3:
cmp r7,#1
beq color
bne run4
color:
ldr r0,addr_in4
bl printf

run4:
cmp r8,#1
beq oe
bne run5
oe:
ldr r0, addr_in5
bl printf

run5:


ldr r0,addr_format
ldr r1,addr_store1
bl scanf

ldr r3,addr_store1
ldr r3,[r3]
push {r3}
add r11,r11,#1
cmp r3,#1
beq jump1
bne jump2
jump1:
mov r4,#0

jump2:
cmp r3,#2
beq jump3
bne jump4

jump3:
mov r5,#0

jump4:
cmp r3,#3
beq jump5
bne jump6

jump5:
mov r6,#0
jump6:
cmp r3,#4
beq jump7
bne jump8
jump7:
mov r7,#0

jump8:
cmp r3,#5
beq jump9
bne jump10

jump9:
mov r8,#0

jump10:

ldr r0,addr_in6
bl printf


ldr r0,addr_format
ldr r1,addr_store2
bl scanf

ldr r1,addr_store2
ldr r1,[r1]
cmp  r1,#6
beq goto
bne game

goto:
cmp r11,#0
blt  end                 @jump out no more bet
pop {r3}
mov r1,r3
sub r11,r11,#1
cmp r1,#1
bleq gamesinglenum
cmp r1,#2
bleq gamecolumn
cmp r1,#3
bleq gamesingler
cmp r1,#4
bleq gamecolor
cmp r1,#5
bleq gameoe
b goto

end:








































addr_in1:.word in1
addr_in2:.word in2
addr_in3:.word in3
addr_in4:.word in4
addr_in5:.word in5
addr_in6:.word in6
addr_store1:.word store1
addr_store2:.word store2
addr_store3:.word store3
addr_store4:.word store4
addr_store5:.word store5
addr_format:.word format
.global printf
.global time
.global srand
.global rand
.global abs
