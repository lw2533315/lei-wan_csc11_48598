.data
m1:.asciz"We have a function ax^2+bx\n a=0.037;b=0.876.\n please enter the x's value(0,255)\n"
m2:.asciz"ax^2+bx= %d \n"
format:.asciz"%d"

.balign 4
save:.word 0

.global main
main:
 
push {r4,lr}
ldr r5,=0x12b02  @a  20bit >>20
ldr r6,=0xe04188  @b 24bit >>24

ldr r0,=m1
bl printf

ldr r0,=format
ldr r1,=save
bl scanf

ldr r1,=save
ldr r1,[r1]              @r1 is value of x

mul r2,r5,r1       @ 28bit  >>20   ax
mov r2,r2,asr#4    @ 24bit  >>16   ax
mul r2,r1,r2       @ 32bit   >>16  ax^2
mov r2,r2,asr#4    @28bit   >>12

mul r3,r1,r6       @32bit   >>24   bx
mov r3,r3,asr#12       @20      >>12
add r2,r2,r3       
mov r1,r2,asr#12

ldr r0,=m2
bl printf

pop {r4,lr}
bx lr
