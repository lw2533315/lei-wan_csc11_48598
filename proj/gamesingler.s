.data
in1:.asciz"which row do you bet?1-12\n"
in2:.asciz"How much do you bet?\n"
in3:.asciz"You bet on Row %d, and you loose, your banlance is  %d now\n\n"
in4:.asciz"You bet on Row %d, and you win, your balance is %now\n\n"

.balign 4
store1:.word 0
.balign 4
store2:.word 0

format:.asciz"%d"


.text
.global gamesingler
gamesingler:
push {lr}

ldr r0,addr_in1
bl printf

ldr r0,addr_format
ldr r1,addr_store1
bl scanf                           @row number

ldr r0, addr_in2
bl printf

ldr r0,addr_format
ldr r1,addr_store2
bl scanf                           @money

ldr r4,addr_store1
ldr r4,[r4]

ldr r3,addr_store2
ldr r3,[r3]


cmp r4,#1                        @cmp with number of row1
bne run2
cmp r9,#1
blt out1
cmp r9,#3
bgt out1
ble out2

run2:
cmp r4,#2
bne run3
cmp r9,#4
blt out1
cmp r9,#6
bgt out1
ble out2

run3:                             @cmp with numbers of row3
cmp r4,#3
bne run4
cmp r9,#7
blt out1
cmp r9,#9
bgt out1
ble out2

run4:
cmp r4,#4
bne run5
cmp r9,#10
blt out1
cmp r9,#12
bgt out1
ble out2

run5:
cmp r4,#5
bne run6
cmp r9,#13
blt out1
cmp r9,#15
bgt out1
ble out2

run6:
cmp r4,#6
bne run7
cmp r9,#16
blt out1
cmp r9,#18
bgt out1
ble out2

run7:
cmp r4,#7
bne run8
cmp r9,#19
blt out1
cmp r9,#21
bgt out1
ble out2

run8:
cmp r4,#8
bne  run9
cmp  r9,#22
blt out1
cmp r9,#24
bgt out1
ble out2

run9:
cmp r4,#9
bne run10
cmp r9,#25
blt out1
cmp r9,#27
bgt out1
ble out2

run10:
cmp r4,#10
bne run11
cmp r9,#28
blt out1
cmp r9,#30
bgt out1
ble out2

run11:
cmp r4,#11
bne run12
cmp r9,#31
blt out1
cmp r9,#33
bgt out1
ble out2

run12:
cmp r4,#12
bne run13
cmp r9,#34
blt out1
cmp r9,#36
bgt out1
ble out2

run13:
b end                            @when enter is not include 1-12,this things happen,

out1:                               @bet wrong number
sub r10,r10,r3
ldr r0,addr_in3
mov r1,r4
mov r2,r10
bl printf
b end

out2:
mov r2,#5
mul r3,r2,r3                                 @bet correct number
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
addr_format:.word format
addr_store1:.word store1
addr_store2:.word store2

