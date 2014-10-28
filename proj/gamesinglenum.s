.data
in1: .asciz"Which number 1-36  do you bet?\n"
in2:.asciz"How much do you bet?\n"
in3:.asciz"You bet on %d, and you win, you banlance is %d\n\n"
in4:.asciz"You bet on %d, and you loose, you banlance is %d now\n\n"
format: .asciz"%d"
.balign 4
store1: .word 0
.balign 4
store2:.word 0
.text

.global gamesinglenum
gamesinglenum:
push {lr}
ldr r0,addr_in1
bl printf

ldr r0,addr_format
ldr r1,addr_store1
bl scanf                         @bet number on store1

ldr r0, addr_in2
bl printf

ldr r0,addr_format
ldr r1,addr_store2
bl scanf                        @bet money on store2

ldr r5,addr_store1
ldr r5,[r5]
ldr r2,addr_store2
ldr r2,[r2]
mov r3,#35
mul r2,r3,r2
cmp r5,r9
bne run1
add r10,r10,r2
ldr r0,addr_in3
mov r1,r5
mov r2,r10
bl printf

b end
run1:
ldr r2,addr_store2
ldr r2,[r2]
sub r10,r10,r2
ldr r0,addr_in4
mov r1,r5
mov r2,r10
bl printf
end:
pop {lr}
bx lr















addr_in1:.word in1
addr_in2:.word in2
addr_in3:.word in3
addr_in4:.word in4
addr_store2:.word store2
addr_store1:.word store1
addr_format:.word format

