.data

m1:.asciz"the temperature F  is %d \n"
m2:.asciz"The C-temperatrue is %d \n"
format:.asciz"%d"
f1:.float 212
f2:.float 32
f3:.float 1
f4:.float 5


first:.skip 400
.text

.global main
main:
push {r4,lr}

ldr r9,ad_first
mov r10,#0
ldr r5,=212
ldr r6,=32

loop:

str r6, [r9,r10,lsl#2]
ldr r7,[r9,r10,lsl#2]
ldr r0,ad_m1

ldr r1,=f3
add r10,r10,r1
ldr r1,=f4
add r6,r6,r4
cmp r6,r5
ble loop


mid:

mov r11,#0
loop1:
ldr r9,=first


ldr r1,[r9,r11,lsl#2]
ldr r0,=m1		@out in array
bl printf

ldr r1, [r9, r11, lsl#2]
add r11, r11, #1
ldr r3,=f2     @r3=32
ldr r2,=0x8e38f
sub  r1,r1,r3
mul r1,r2,r1
mov r1,r1,asr#20






ldr r0,ad_m2
mov r1,r1
bl printf


cmp r10,r11
bne loop1

pop {r4,lr}
bx lr



ad_m1:.word m1
ad_m2:.word m2
ad_format:.word format

ad_first:.word first
.global printf
.global scanf 
