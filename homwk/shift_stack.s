.data
.balign 4
message1:.asciz"Enter  the divident"

.balign 4
message2: .asciz"Enter the divisor"
.balign 4
pattern: .asciz"%d"
.balign 4
read1: .word 0
.balign 4
read2: .word 0
.balign 4

message3: .asciz"Calculated a/b = %d"
.balign 4
message4: .asciz"Calculated  a%%b = %d"

.text

scaleleft:

run1:
mov r1,r1,lsl#1
mov r2,r2,lsl#1
cmp r0,r2
bge run1 
mov r1,r1,lsl#1
mov r2,r2,lsl#1


bx lr



scaleright:
run2:
mov r1,r1,lsr#1
mov r2,r2,lsr#1
cmp r0,r2
blt run2


bx lr


addsub:
push {lr}
run3:
add r2,r2,r0
sub r3,r3,r1
mov r8,r3
mov r6,r2
mov r10,r0
mov r5,r1
mov r0,r8
mov r1,r10
mov r2,r5
bl scaleright
cmp r1, #1
bge run3

pop {lr}
bx lr


divmod:
push {lr}
run4:
mov r6,#0
mov r10,#1

ldr r0,address_message1
bl printf

cmp r2,r0
bge big1
b  end1
big1:

mov r5,r0



mov r8,r1
mov r0,r8
mov r1,r10
mov r2,r5
bl scaleleft
mov r8,r0
mov r10,r1
mov r5,r2
mov r0,r10
mov r1,r5
mov r2,r6
mov r3,r8
bl addsub

end1:
pop {lr}
bx lr




.global main
main:
push {lr}

ldr r0,address_message1
bl printf

ldr r0,address_pattern
ldr r1, address_read1
bl scanf

ldr r0, address_message2
bl printf

ldr r0, address_pattern
ldr r1, address_read2

bl scanf

ldr r2,address_read2
ldr r0,[r2]
ldr r1,address_read1
ldr r2,[r1]
mov r1,#0
bl divmod

mov r8, r0
ldr r0,address_message3
mov r1,r6
bl printf

ldr r0, address_message4
mov r1,r8
bl printf

pop {lr}
bx lr



address_message1: .word message1
address_message2: .word message2
address_pattern: .word pattern
address_read1: .word read1
address_read2: .word read2
address_message3: .word message3
address_message4: .word message4
.global printf
.global scanf
