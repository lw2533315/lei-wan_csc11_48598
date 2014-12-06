.data
in1:.asciz"What color do you bet on r/b ?\n"
in2:.asciz"How much do you bet? \n"
in3:.asciz"You bet on Color %s, and you loose,your banlance is %d now\n\n"
in4:.asciz"You bet on Color %s, and you win, your balance is %d now\n\n"
format1:.asciz"%d"
format2:.asciz"%s"
tests:.asciz"%s\n"
cmp1:.asciz"r"


.balign 4
store1:.word 0
.balign 4
store2:.word 0

.text
.globl gamecolor
gamecolor:
push {r11,lr}
ldr r0,addr_in1
bl printf

ldr r0,addr_format2
ldr r1,addr_store1
bl scanf                            @color b/r

ldr r0,addr_in2
bl printf

ldr r0, addr_format1
ldr r1,addr_store2
bl scanf                             @money

ldr r0,addr_cmp1                    @assume r
ldr r1,addr_store1
 
bl strcmp




bne jump
cmp r9,#1
bne run2
beq out2

run2:
cmp r9,#3
bne run3
beq out2

run3:
cmp r9,#5
bne run4
beq out2

run4:
cmp r9,#7
bne run5
beq out2

run5:
cmp r9,#9
bne run6
beq out2

run6:
cmp r9,#12
bne run7
beq out2

run7:
cmp r9,#14
bne run8
beq out2

run8:
cmp r9,#16
bne run9
beq out2

run9:
cmp r9,#18
bne run10
beq out2

run10:
cmp r9,#19
bne run11
beq out2

run11:
cmp r9,#21
bne run12
beq out2

run12:
cmp r9,#23
bne run13
beq out2

run13:
cmp r9,#25
bne run14
beq out2

run14:
cmp r9,#27
bne run15
beq out2

run15:
cmp r9,#30
bne run16
beq out2

run16:
cmp  r9,#32
bne run17
beq out2

run17:
cmp r9,#34
bne run18
beq out2

run18:
cmp r9,#36
bne out1
beq out2


jump:                   @judge r or b or other, judge other part should be finished at main()

cmp r9,#2
bne run_2
beq out2

run_2:
cmp r9,#4
bne run_3
beq out2

run_3:
cmp r9,#6
bne run_4
beq out2

run_4:
cmp r9,#8
bne run_5
beq out2

run_5:
cmp r9,#10
bne run_6
beq out2

run_6:
cmp r9,#11
bne run_7
beq out2

run_7:
cmp r9,#13
bne run_8
beq out2

run_8:
cmp r9,#15
bne run_9
beq out2

run_9:
cmp r9,#17
bne run_10
beq out2

run_10:
cmp r9,#20
bne run_11
beq out2

run_11:
cmp r9,#22
bne run_12
beq out2

run_12:
cmp r9,#24
bne run_13
beq out2

run_13:
cmp r9,#26
bne run_14
beq out2

run_14:
cmp r9,#28
bne run_15
beq out2

run_15:
cmp r9,#29
bne run_16
beq out2

run_16:
cmp  r9,#31
bne run_17
beq out2

run_17:
cmp r9,#33
bne run_18
beq out2

run_18:
cmp r9,#35
bne out1
beq out2


out1:
ldr r4,addr_store2
ldr r4,[r4]
mov r5,#0
ldr r3,addr_store1
ldr r3,[r3]
b end
out2:      
ldr r4,addr_store2
ldr r4,[r4]                        @win
mov r5,#1
ldr r3,addr_store1

ldr  r3,[r3]


b end


end:
mov r6,#4
pop {r11,lr}
bx lr



ad_tests:.word tests
addr_in1:.word in1
addr_in2:.word in2
addr_in3:.word in3
addr_in4:.word in4
addr_format1:.word format1
addr_format2:.word format2
addr_cmp1:.word cmp1
addr_store1:.word store1
addr_store2:.word store2
.global strcmp
