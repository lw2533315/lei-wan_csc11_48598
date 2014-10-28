.data
in1:.asciz"Do you bet odd/even? input o/e\n"
in2:.asciz"How much do you bet? r/b\n"
in3:.asciz"You bet on  %s (odd/even), and you loose,your banlance is %d now\n\n"
in4:.asciz"You bet on  %s (odd/even), and you win, your balance is %d now\n\n"

format1:.asciz"%d"
format2:.asciz"%s"

cmp1:.asciz"o"
cmp2:.asciz"e"

.balign 4
store1:.word 0
.balign 4
store2:.word 0

.text
.globl gameoe
gameoe:
push {lr}
ldr r0,addr_in1
bl printf

ldr r0,addr_format2
ldr r1,addr_store1
bl scanf                            @odd or even o/e

ldr r0,addr_in2
bl printf

ldr r0, addr_format1
ldr r1,addr_store2
bl scanf                             @money

ldr r4,addr_store1
ldr r4,[r4]

ldr r3,addr_store2
ldr r3,[r3]

cmp r9,#37
bne  jump1
beq out1

jump1:
cmp r9,#38
bne jump2
beq out1

jump2:
mov r5,#3                         @judgement signal
ldr r0,addr_cmp1
mov r1,r4
bl strcmp
bne run1                          @is not odd
mov r5,#1
b compare


run1:
ldr r0,addr_cmp2
mov r1,r4
bl strcmp
bne run2
mov r5,#2
b compare

mov r6,#3
and r9,r9,#1
cmp r9,#0
moveq r6,#2
movne r6,#1
b compare

run2:
b end                             @input is not o,or e

compare:
cmp r5,r6
beq out2
bne out1








out1:
sub r10,r10,r3                                  @loose
ldr r0,addr_in3
mov r1,r4
mov r2,r10
bl printf
b end
out2:                              @win
add r10,r10,r3
ldr r0,addr_in4
mov r1,r4
mov r2,r10
bl printf

b end


end:
pop {lr}
bx lr









addr_in1:.word in1
addr_in2:.word in2
addr_in3:.word in3
addr_in4:.word in4
addr_format1:.word format1
addr_format2:.word format2
addr_cmp1:.word cmp1
addr_cmp2:.word cmp2
addr_store1:.word store1
addr_store2:.word store2
.global strcmp
