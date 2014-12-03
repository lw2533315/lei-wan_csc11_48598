.data

m1:.asciz"the temperature F  is %d \n"
m2:.asciz"The C-temperatrue is %f \n"
format:.asciz"%d"
f1:.float 5.0
f2:.float 9.0

.balign 4
first:.skip 200
.text

.global main
main:
push {r4,lr}

ldr r9,ad_first
mov r10,#0
mov r5,#212
mov r6,#32

loop:

str r6, [r9,r10,lsl#2]
ldr r7,[r9,r10,lsl#2]
ldr r0,ad_m1

add r10,r10,#1
add r6,r6,#5
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
sub r1,r1,#32
vldr s14,[r1]
add r11, r11, #1

ldr r2,=f1
vldr s16,[r2]

ldr r3,=f2
vldr s18,[r3]

vmul.f32 s14,s16,s14
vmul.f32 s14,s14,s18
vcvt.f64.f32 d5,s14






ldr r0,ad_m2
vmov r2,r3,d5
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
