.data
in1:.asciz"Do you bet odd/even? input o/e\n"
in2:.asciz"How much do you bet? \n"
in3:.asciz"You bet on  %s (odd/even), and you loose,your banlance is %d now\n\n"
in4:.asciz"You bet on  %s (odd/even), and you win, your balance is %d now\n\n"

format1:.asciz"%d"
format2:.asciz"%s"

cmp1:.asciz"o"

.balign 4
store1:.word 0
.balign 4
store2:.word 0


.text
.globl gameoe
gameoe:
push {r11,lr}

ldr r0,addr_in1
bl printf

ldr r0,addr_format2
ldr r1,addr_store1
bl scanf                            @odd or even o/e

ldr r0,addr_in2
bl printf

ldr r0, addr_format1
ldr r1,addr_store2
bl scanf                                   @money


cmp r9,#37
bne  jump1
beq out1

jump1:
cmp r9,#38
bne jump2
beq out1

jump2:
mov r5,#3                         @judgement sign
ldr r0,addr_cmp1
ldr r1,addr_store1
bl strcmp
bne run1                          @is not odd
mov r5,#1
b compare

run1:
mov r5,#2
b compare
                             @input is not o,or e

compare:

mov r6,#3
and r9,r9,#1                @and             
cmp r9,#0     
moveq r6,#2               @r6==2  r9 is even
movne r6,#1              @r6==1   r9 is oven
cmp r5,r6
beq out2
bne out1


out1:
mov r5,#0
ldr r3,addr_store1
ldr r3,[r3]
ldr r4,addr_store2
ldr r4,[r4]
b end
out2:                              @win
mov r5,#1
ldr r3,addr_store1
ldr r3,[r3]
ldr r4,addr_store2
ldr r4,[r4]
b end


end:
mov r6,#5
pop {r11,lr}
bx lr






addr_in1:.word in1
addr_in2:.word in2
addr_in3:.word in3
addr_in4:.word in4
addr_format1:.word format1
addr_format2:.word format2
addr_cmp1:.word cmp1
addr_store1:.word store1
addr_store2:.word store2
