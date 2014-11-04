.data
in1: .asciz"Which number 1-36  do you bet?\n"
in2:.asciz"How much do you bet?\n"
in3:.asciz"You bet on %d, and you win, you banlance is %d\n\n"
in4:.asciz"You bet on %d, and you loose, you banlance is %d now\n\n"
format:.asciz"%d"
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

cmp r9,#37
moveq r9,#0
cmp r9,#38
moveq r9,#0

ldr r3,addr_store1      @bet what number store r3
ldr r3,[r3]
cmp r9,r3
moveq r5,#1             @win r5 is 1 loose r5 is 0
movne r5,#0

ldr r4,addr_store2       @bet how much
ldr r4,[r4]

pop {lr}
bx lr














addr_in1:.word in1
addr_in2:.word in2
addr_in3:.word in3
addr_in4:.word in4
addr_store2:.word store2
addr_store1:.word store1
addr_format:.word format

