
.data

m1:.asciz"the temperature F  is %f \n"
m2:.asciz"The C-temperatrue is %f \n"
format:.asciz"%d"
f1:.float 32.0
f2:.float 212.0
f3:.float 5.0
f4:.float 9.0

.balign 4
first:.skip 400
.text

.global main
main:
push {r4,lr}

ldr r9,ad_first
mov r10,#0



ldr r6,=f1



loop:

vstr s6, [r9,r10,lsl#2]

add r10,r10,#1
ldr r7,=f3
vldr s7,[r7]
vadd.f32  s6,s6,s7



cmp r10,#37
ble loop


mid:

mov r11,#0
loop1:
ldr r9,=first


ldr r1,[r9,r11,lsl#2]
vldr s14,[r1]		@out in array
vcvt.f64.f32 d5,s14
ldr r0,=m1
vmov r2,r3,d5
bl printf


ldr r1, [r9, r11, lsl#2]
add r11, r11, #1
/*
ldr r2,=0x8e38f
sub  r1,r1,#32
mul r1,r2,r1
mov r1,r1,asr#20






ldr r0,ad_m2
mov r1,r1
bl printf

*/
cmp r10,r11
bgt loop1

pop {r4,lr}
bx lr



ad_m1:.word m1
ad_m2:.word m2
ad_format:.word format

ad_first:.word first
.global printf
.global scanf 
