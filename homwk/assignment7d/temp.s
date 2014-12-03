.data
.balign 4
save:.word 0

array:.skip 400

format:.asciz"%d"
.text

.global main

fillarray:
push {r4,r5,r6,r7,r8,lr}
mov r4,#212    @!!!
mov r5,r1

mov r7,#0
mov r8,#32


loop1:
str r8,[r5,r7,lsl#2]
add r7,r7,#1
add r8,r8,#5
cmp r8,r4
ble loop1


ldr r1,=save
str r7,[r1]

pop {r4,r5,r6,r7,r8,lr}
bx lr
outarray:    @@@
push {r4,r5,r6,lr}

ldr r4,=save
ldr r4,[r4]
mov r5,r1
mov r6,#0
loop2:
ldr r1,[r5,r6,lsl#2]
add r6,r6,#1
bl printf 
cmp  r6,r4
bne loop2



pop {r4,r5,r6,lr}



bx lr

main:
push {r4,lr}
ldr r1,=array
bl fillarray

ldr r1,=array
bl outarray
 

pop {r4,lr}
bx lr
