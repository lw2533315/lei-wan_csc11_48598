.data


m2:.asciz"The C-temperatrue is %d \n"
format:.asciz"%d"
.balign 4
store:.word 0
first:.skip 148
.text

.global main
main:
push {r4,lr}

ldr r9,ad_first
mov r10,#0
mov r5,#212
mov r6,#32

loop
str r6, [r9,r10,lsl#2]
add r10,r10,#1
add r6,r6,#5
cmp r6,r5
ble loop


loop2:
sub r10,r10,#1
ldr r9,ad_first
ldr r1,[r9,r10,lsr#2]



mov r6,#5
sub  r1,r1,#32
mul r1,r6,r1

mov r2,#9

bl div

mov r4,r0
mov r5,r1

ldr r0,ad_m2
mov r1,r4
bl printf

mov r11,#0
cmp r10,r11
bgt loop2

pop {r4,lr}
bx lr



ad_m1:.word m1
ad_m2:.word m2
ad_format:.word format
ad_store:.word store

.global printf
.global scanf 
