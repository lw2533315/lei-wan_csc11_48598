.data
testd:.asciz"%d\n"
tests:.asciz"%s\n"
in1: .asciz "type 1 to choose Single Number\ntype 2 to choose Column\ntype 3 to choose Single Row\ntype 4 to choose Red/Black\ntype 5 to choose Even/Odd\ntype 7 to choose Exit\n"

t:.asciz"the number is %d\n"
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
push {r11,lr}
mov r10, #100        @acount balance initiate $100
more:
ldr r0,addr_in9
bl printf

ldr r0,addr_in8
mov r1,r10
bl printf

bl random

ldr  r9,addr_store4     @save the random number
str r1,[r9]
mov r9,r1


ldr r0, addr_in1        @ask to input choice
bl printf


ldr r0,addr_format
ldr r1,addr_store1      @number of your choice
bl scanf

ldr r11,addr_store1     @choice save in r11
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

mov r8,#0        @index to array

goto:

ldr r12,addr_a
str r5,[r12,r8,lsl#2]
add r8,r8,#1                 
str r3,[r12,r8,lsl#2]
/*ldr r0,=t
mov r1,r3
bl printf */ 
add r8,r8,#1
str r4,[r12,r8,lsl#2]
                    
add r8,r8,#1
str r6,[r12,r8,lsl#2]
add r8,r8,#1
/*ldr r0,=t
mov r1,r6
bl printf */     

output:
ldr r1,=store4
ldr r1,[r1]
ldr r0,addr_in11          @output the random number
bl printf

mov r8,#0    @outprint from array index
ldr r12,=a
output1:                      @present addrss


ldr r5,[r12,r8,lsl#2]
add r8,r8,#1


ldr r7, [r12,r8,lsl#2]           @bet number
add r8,r8,#1

ldr r4,[r12,r8,lsl#2] 
add r8,r8,#1
ldr r6,[r12,r8,lsl#2]
add r8,r8,#1





bl print    @call print
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
pop {r11,lr}
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

