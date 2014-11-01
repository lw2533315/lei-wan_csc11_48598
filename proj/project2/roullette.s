.data
in1: .asciz "type 1 to choose Single Number\n"
in2:.asciz"type 2 to choose Column\n"
in3:.asciz"type 3 to choose Single Row\n"
in4:.asciz"type 4 to choose Red/Black\n"
in5:.asciz"type 5 to choose Even/Odd\n"
in6:.asciz"Do you finish the choice and to start the game? (y/n)\n"
in7:.asciz"Do you wanna try again? (y/n)\n"
in8:.asciz"\nYour account balance is: %d\n"
in9:.asciz"\n Welcome to Roullette Game\n"
in10:.asciz"type 7 to exit\n"
format:.asciz"%d"
format1:.asciz"%s"
.balign 4
store1:.word 0
.balign 4
store2:.word 0
.balign 4
store3:.word 0
.balign 4
store4:.word 0       @exit lr value
cmp:.asciz"n"
cmp1:.asciz"y"
.text


.global main
main:
push {lr}
mov r10, #100        @acount balance initiate $100
more:
ldr r0,addr_in9
bl printf

ldr r0,addr_in8
mov r1,r10
bl printf

bl random
mov r9,r1      @recorder the ball
mov r11,#0    @counter
mov r4,#1
mov r5,#1
mov r6,#1
mov r7,#1
mov r8,#1   @judge whether keep on the same method
game:
ldr r0,addr_in10
bl printf
cmp r4,#1
beq singlenum
bne run1             @~~~~~~~~~~~~~
singlenum:
ldr r0, addr_in1
bl printf
run1:
cmp r5,#1
beq column
bne run2

column:
ldr r0, addr_in2
bl printf

run2:
cmp r6,#1
beq singler
bne run3
singler:
ldr r0,addr_in3
bl printf

run3:
cmp r7,#1
beq color
bne run4
color:
ldr r0,addr_in4
bl printf

run4:
cmp r8,#1
beq oe
bne run5
oe:
ldr r0, addr_in5
bl printf


run5:


ldr r0,addr_format
ldr r1,addr_store1      @number of your choice
bl scanf

ldr r3,addr_store1
ldr r3,[r3]

cmp r3,#7
beq final
push {r3,lr}
add r11,r11,#1
cmp r3,#1
beq jump1
bne jump2
jump1:
mov r4,#0

jump2:
cmp r3,#2
beq jump3
bne jump4

jump3:
mov r5,#0

jump4:
cmp r3,#3
beq jump5
bne jump6

jump5:
mov r6,#0
jump6:
cmp r3,#4
beq jump7
bne jump8
jump7:
mov r7,#0

jump8:
cmp r3,#5
beq jump9
bne jump10

jump9:
mov r8,#0

jump10:

ldr r0,addr_in6
bl printf


ldr r0,addr_format1
ldr r1,addr_store2
bl scanf

ldr r12,addr_save               @ldr save first address
mov r8,#0
                   @initialize r8=0 to counter the address
ldr r1,addr_store2
ldr r0,addr_cmp1
bl strcmp
beq goto
bne game


goto:
cmp r11,#0
mov r6,r11                 @record r11 to r6
ble  output                 @jump out no more bet
pop {r3,lr}
mov r1,r3
sub r11,r11,#1
cmp r1,#1
bne save1
bleq gamesinglenum
add r7,r12,r8,lsl#2            @     point move to r7    counter*4+basic address
add r8,r8,#1                    @ counter +1  
str r5,[r7]                     @  [r5] store in r7address
add r7,r12,r8,lsl#2             @  point move 4*r8 to new r7
add r8,r8,#1                   @counter +1
str r3,[r7]                   @ [r3] store in r7 new address
add r7,r12,r8,lsl#2
add r8,r8,#1
str r4,[r7]
mov r1,#1                     @sigal 1. singlenum
add r7,r12,r8,lsl#2
add r8,r8,#1
str r1,[r7]
save1:

cmp r1,#2
bne save2
bleq gamecolumn
add r7,r12,r8,lsl#2            @     point move to r7    counter*4+basic address
add r8,r8,#1                    @ counter +1  
str r5,[r7]                     @  [r5] store in r7address
add r7,r12,r8,lsl#2             @  point move 4*r8 to new r7
add r8,r8,#1                   @counter +1
str r3,[r7]                   @ [r3] store in r7 new address
add r7,r12,r8,lsl#2
add r8,r8,#1
str r4,[r7]
mov r1,#2
add r7,r12,r8,lsl#2
add r8,r8,#1
str r1,[r7]

save2:
cmp r1,#3
bne save3
bleq gamesingler
add r7,r12,r8,lsl#2            @     point move to r7    counter*4+basic address
add r8,r8,#1                    @ counter +1  
str r5,[r7]                     @  [r5] store in r7address
add r7,r12,r8,lsl#2             @  point move 4*r8 to new r7
add r8,r8,#1                   @counter +1
str r3,[r7]                   @ [r3] store in r7 new address
add r7,r12,r8,lsl#2
add r8,r8,#1
str r4,[r7]
mov r1,#3
add r7,r12,r8,lsl#2
add r8,r8,#1
str r1,[r7]

save3:
cmp r1,#4
bne save4
bleq gamecolor
add r7,r12,r8,lsl#2            @     point move to r7    counter*4+basic address
add r8,r8,#1                    @ counter +1  
str r5,[r7]                     @  [r5] store in r7address
add r7,r12,r8,lsl#2             @  point move 4*r8 to new r7
add r8,r8,#1                   @counter +1
str r3,[r7]                   @ [r3] store in r7 new address
add r7,r12,r8,lsl#2
add r8,r8,#1
str r4,[r7]
mov r1,#4
add r7,r12,r8,lsl#2
add r8,r8,#1
str r1,[r7]
save4:
cmp r1,#5
bleq gameoe
add r7,r12,r8,lsl#2            @     point move to r7    counter*4+basic address
add r8,r8,#1                    @ counter +1  
str r5,[r7]                     @  [r5] store in r7address
add r7,r12,r8,lsl#2             @  point move 4*r8 to new r7
add r8,r8,#1                   @counter +1
str r3,[r7]                   @ [r3] store in r7 new address
add r7,r12,r8,lsl#2
add r8,r8,#1
str r4,[r7]
mov r1,#5
add r7,r12,r8,lsl#2
add r8,r8,#1
str r1,[r7]
b goto

output:
mov  r12,r7                      @present addrss
cmp r11,r8
beq end  
sub r7,r12,r11,lsl#2
mov  r1,r7
ldr r1,[r1]
add r11,r11,#1
sub r7,r12,r11,lsl#2
mov r4,r7
ldr r4,[r4]
add r11,r11,#1
sub r7,r12,r11,lsl#2
mov r3,r7
ldr r3,[r3]
add r11,r11,#1
sub r7,r12,r11,lsl#2
mov r5,r7
ldr r5,[r7]
add r11,r11,#1                  @str a set of data from memory

bl print
b output




end:
ldr r0,addr_in7
bl printf

ldr r0,addr_format1
ldr r1,addr_store3
bl scanf

ldr r0, addr_cmp
ldr r1,addr_store3
bl strcmp
beq final
bne more

final:
pop {lr}
bx lr












addr_in1:.word in1
addr_in2:.word in2
addr_in3:.word in3
addr_in4:.word in4
addr_in5:.word in5
addr_in6:.word in6
addr_in7:.word in7
addr_in8:.word in8
addr_in9:.word in9
addr_in10:.word in10
addr_store1:.word store1
addr_store2:.word store2
addr_store3:.word store3
addr_format:.word format
addr_format1:.word format1
addr_cmp:.word cmp
addr_cmp1:.word cmp1
addr_save:.word save
.global printf
.global strcmp
.global srand

