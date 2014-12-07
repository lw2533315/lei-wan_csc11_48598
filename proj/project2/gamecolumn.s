.data
in1: .asciz"which Column do you bet?1-3\n"
in2:.asciz"How much do you bet?\n"
in3:.asciz"You bet on Column %d, and you loose ,you banlance is  %d now\n\n"
in4:.asciz"You bet on Column %d, and you win, you banlance is %d  now\n\n"
m1:.asciz"r3 is %d\n"
format:.asciz"%d"
.balign 4
store1:.word 0
.balign 4
store2:.word 0
.balign 4
save:.word 0
.text
.global gamecolumn
gamecolumn:
push {r11,lr}
ldr r0,addr_in1
bl printf

ldr r0, addr_format
ldr r1,addr_store1       @number column
bl scanf


ldr r0,addr_in2
bl printf

ldr r0,addr_format
ldr r1,addr_store2           @money
bl scanf

cmp r9,#37
moveq r9,#0             @random ==37 or 38  r9=0
cmp r9,#38
moveq r9,#0


mov r2,#0
mov r6,#0
mov r7,#0
mov r8,#0
cmp r9,#1
beq col1
cmp r9,#4
beq col1
cmp r9,#7
beq col1
cmp r9,#10
beq col1
cmp r9,#13
beq col1
cmp r9,#16
beq col1
cmp r9,#19
beq col1
cmp r9,#22
beq col1
cmp r9,#25
beq col1
cmp r9,#28
beq col1
cmp r9,#31
beq col1
cmp r9,#34
beq col1
bne part2              @ball is not in column 1
col1:
mov r2,#1        @ sign the ball stop on column 1
b jump                @begin cmpare to the bet
part2:

cmp r9,#2
beq col2
cmp r9,#5
beq col2
cmp r9,#8
beq col2
cmp r9,#11
beq col2
cmp r9,#14
beq col2
cmp r9,#17
beq col2
cmp r9,#20
beq col2
cmp r9,#23
beq col2
cmp r9,#26
beq col2
cmp r9,#29
beq col2
cmp r9,#32
beq col2
cmp r9,#35
beq col2
bne part3


col2:
mov r6,#1      @sign the ball stop on column 2
b jump

part3:

cmp r9,#3
beq col3
cmp r9,#6
beq col3
cmp r9,#9
beq col3
cmp r9,#12
beq col3
cmp r9,#15
beq col3
cmp r9, #18
beq col3
cmp r9,#21
beq col3
cmp r9,#24
beq col3
cmp r9,#27
beq col3
cmp r9,#30
beq col3
cmp r9,#33
beq col3
cmp r9,#36
beq col3
bne part4

col3:
mov r7,#1
b jump
part4:
cmp r9,#0
beq col4

bne jump
col4:
mov r8,#1
b jump

jump:
ldr r3,addr_store1    @r3 is the column number
ldr r3,[r3]

ldr r4,addr_store2     @r4 is the money
ldr r4,[r4]

cmp r8,#1
moveq r5,#0               @r5==#0 loose
beq end


run1:
cmp r3,#1         
bne run2
cmp r2,#1
movne r5,#0
bne end
moveq r5,#1          @win 
b end


run2:
cmp r3,#2
bne run3
cmp r6,#1
movne r5,#0
bne end
moveq r5,#1
b end

run3:

cmp r3,#3
cmp r7,#1
movne r5,#0
bne end
moveq r5,#1
b end


end:
mov r6,#2       @the second game
pop {r11,lr}
bx lr


addr_in1:.word in1
addr_in2:.word in2
addr_in3:.word in3
addr_in4:.word in4
addr_format:.word format
addr_store1:.word store1
addr_store2:.word store2

