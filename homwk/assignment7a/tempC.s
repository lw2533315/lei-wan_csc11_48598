.data

m1:.asciz"Input the F-temperature (32-212)\n"
m2:.asciz"The C-temperatrue is %d \n"
format:.asciz"%d"
.balign 4
store:.word 0
.text

.global main
main:
push {lr}

ldr r0, ad_m1
bl printf

ldr r0, ad_format
ldr r1,ad_store
bl scanf



ldr r1,ad_store
ldr r1,[r1]

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


pop {lr}
bx lr



ad_m1:.word m1
ad_m2:.word m2
ad_format:.word format
ad_store:.word store

.global printf
.global scanf 
