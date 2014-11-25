.data
m1:.asciz"enter the temperatrue in F\n"
m2:.asciz"The temperture in C is %d\n"
format:.asciz"%d"

.balign 4
store1:.word 0

.text

.global main
main:
push {lr}


ldr r0,ad_m1
bl printf

ldr r0,ad_format
ldr r1,ad_store1
bl scanf

ldr r4, ad_store1
ldr r4,[r4]

sub r5,r4,#32         @F-32
ldr r6,=0x8e38f
mul r5,r6,r5          @c*(f-32)

asr r5,#20           @>>20


ldr r0, ad_m2
mov r1,r5
bl printf

pop {lr}
bx lr

ad_m1:.word m1
ad_m2:.word m2
ad_format:.word format
ad_store1:.word store1

.global printf
.global scanf
