.data
testd:.asciz"%d\n"
tests:.asciz"%d\n"
in1: .asciz "type 1 to choose Single Number\ntype 2 to choose Column\ntype 3 to choose Single Row\ntype 4 to choose Red/Black\ntype 5 to choose Even/Odd\ntype 7 to choose Exit\n"


in7:.asciz"\nDo you wanna try again? (y/n)\n"
in8:.asciz"\nYour account balance is: %d\n"
in9:.asciz"\n Welcome to Roullette Game\n"

in11:.asciz"The ball stopped on %d\n"
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
.balign 4
a:.skip 4000

.balign 4
store5:.word 0
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

ldr  r9,addr_store4
str r1,[r9]

ldr r0, addr_in1
bl printf


ldr r0,addr_format
ldr r1,addr_store1      @number of your choice
bl scanf

ldr r11,addr_store1
ldr r11,[r11]

cmp r11,#7
beq final



cmp r11,#1
bne jump1
bleq  gamesinglenum


jump1:
cmp r11,#2
bne jump2
bleq gamecolumn

jump2:
cmp r11,#3
bne jump3
bleq gamesingler

jump3:
cmp r11,#4
bne jump4
bleq gamecolor

jump4:
cmp r11,#5

bleq gameoe

mov r8,#0
                   @initialize r8=0 to counter the address



goto:
ldr r9,addr_store4
ldr r9,[r9]


ldr r12,addr_a
add r7,r12,r8,lsl#2           @     point move to r7    counter*4+basic address
add r8,r8,#1                    @ counter +1  
str r5,[r7]                  @  [r5] store in r7address
add r7,r12,r8,lsl#2             @  point move 4*r8 to new r7
add r8,r8,#1                   @counter +1
str r3,[r7]                   @ [r3] store in r7 new address
add r7,r12,r8,lsl#2
add r8,r8,#1
str r4,[r7]
mov r9,#1                     @sigal 1. singlenum
add r7,r12,r8,lsl#2
add r8,r8,#1
str r9,[r7]


output:

ldr r0,addr_in11
mov r1,r9
bl printf
                       @

mov r11,#0
mov  r12,r7

output1:                      @present addrss
sub r7,r12,r11,lsl#2
ldr r6,[r7]
add r11,r11,#1
sub r7,r12,r11,lsl#2

ldr r4,[r7]
add r11,r11,#1
sub r7,r12,r11,lsl#2
ldr r9,[r7]
add r11,r11,#1
sub r7,r12,r11,lsl#2

ldr r5,[r7]
add r11,r11,#1                  @str a set of data from memory




bl print



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











ad_testd:.word testd
ad_tests:.word tests
addr_in1:.word in1
addr_in7:.word in7
addr_in8:.word in8
addr_in9:.word in9
addr_in11:.word in11
addr_store1:.word store1
addr_store2:.word store2
addr_store3:.word store3
addr_store4:.word store4
addr_format:.word format
addr_format1:.word format1
addr_cmp:.word cmp
addr_cmp1:.word cmp1
addr_a:.word a
.global printf
.global strcmp
.global srand

