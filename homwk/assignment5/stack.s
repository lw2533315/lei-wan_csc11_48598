.data

.balign 4
in1: .asciz"enter divident "

.balign 4
in2: .asciz"enter a divisor "

.balign 4
pattern: .asciz"%d"

.balign 4
store1: .word 0
.balign 4
store2: .word 0

.balign 4
out1: .asciz"calculate a/b = %d \n "
.balign 4
out2: .asciz"calculate a%b =%d \n"

.text

.global main
main:
push {lr}
ldr r0, address_in1
bl  printf

ldr r0, address_pattern
ldr r1, address_store1
bl scanf

ldr r0, address_in2
bl printf

ldr r0,address_pattern
ldr r1,address_store2
bl scanf

ldr r0, address_store1
ldr r0,[r0]
ldr r1, address_store2
ldr r1,[r1]
bl  divmod

mov r5,r3
mov r6,r0

ldr r0, address_out1
mov r1,r5
bl printf

ldr r0, address_out2
mov r1,r6
bl printf

pop {lr}
bx lr

divmod:
push {lr}
mov r2, #1
bl scaleleft
bl addsub
pop {lr}
bx lr

scaleleft:
push {lr}
run1:
mov  r2,r2,lsl#1
mov r1,r1,lsl#1
cmp r0,r1
bge run1
mov r2,r2,lsr#1
mov r1,r1,lsr#1

pop {lr}
bx lr 


addsub:
push {lr}

mov r3, #0
run3:
add r3, r2,r3
sub r0,r0,r1
bl scaleright
cmp r2, #1
bge run3
pop {lr}
bx lr


scaleright:
push {lr}

run2:
mov r2,r2,lsr#1
mov r1,r1,lsr#1
cmp r0,r1
blt run2

pop {lr}
bx lr




address_in1: .word in1
address_in2: .word in2
address_pattern: .word pattern
address_out1: .word out1
address_out2: .word out2
address_store1: .word store1
address_store2: .word store2
.global printf
.global scanf
