.data
m1:.asciz"enter the temperatrue in F\n"
m2:.asciz"The temperture in C is %d\n"
m3:.asciz"It take %d seconds\n"
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
bl scanf            @temperature in F

ldr r6,=100000000   @loop times

mov r0,#0
bl time
mov r11,r0       @r11 recoder begin time, r12 recorder the end time

loopshift:
cmp r6,#0
ble second

mov r4,#0
mov r5,#0

ldr r4, ad_store1
ldr r4,[r4]

sub r5,r4,#32
ldr r3,=0x8e38f    @5/9 shift left 20 bit's value
mul r5,r3,r5
asr r5,#20

sub r6,r6,#1
b loopshift


second:

mov r0,#0
bl time
mov r12,r0


sub r12,r12,r11

ldr r0,ad_m3
mov r1,r12
bl printf          @take time

ldr r0, ad_m2
mov r1,r5
bl printf

ldr r6,=100000000  @loop times

mov r0,#0
bl time
mov r11,r0

divloop:
cmp r6,#0
ble final


mov r2,#0
mov r4,#0
mov r5,#0
ldr r1,ad_store1
ldr r1,[r1]

mov r2,#5
sub  r1,r1,#32
mul r1,r2,r1

mov r2,#9

bl div

mov r4,r0
mov r5,r1
sub r6,r6,#1
b divloop

final:
mov r0,#0
bl time
mov r12,r0


sub r12,r12,r11

ldr r0,ad_m3
mov r1,r12
bl printf   


ldr r0, ad_m2
mov r1,r4
bl printf

pop {lr}
bx lr

ad_m1:.word m1
ad_m2:.word m2
ad_m3:.word m3
ad_format:.word format
ad_store1:.word store1

.global printf
.global scanf
