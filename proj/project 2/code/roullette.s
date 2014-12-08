.data
f:.float 100.0
in1: .asciz "type 1 to choose Single Number\ntype 2 to choose Column\ntype 3 to choose Single Row\ntype 4 to choose Red/Black\ntype 5 to choose Even/Odd\ntype 7 to choose Exit\n"
in2:.asciz"You winning percentage is  %f% \n"
in7:.asciz"\nDo you wanna try again? (y/n)\n"
in8:.asciz"\nYour account balance is: %d\n"
in9:.asciz"\n Welcome to Roullette Game\n"
in11:.asciz"The ball stopped on %d\n"
format:.asciz"%d"
format1:.asciz"%s"
.balign 4
store1:.word 0
.balign 4
win:.word 0
.balign 4
total:.word 0
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
ldr r0,=win
mov r1,#0
str r1,[r0]
ldr r0,=total
str r1,[r0]        @initialize =win and =total
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
add r8,r8,#1
str r4,[r12,r8,lsl#2]
add r8,r8,#1
str r6,[r12,r8,lsl#2]
add r8,r8,#1
output:
ldr r1,=store4
ldr r1,[r1]
ldr r0,addr_in11          @output the random number
bl printf
mov r8,#0    @outprint from array index
ldr r12,=a
output1:
ldr r5,[r12,r8,lsl#2]
ldr r0,=total        @value in =total  ++1
ldr r1,[r0]
add r1,r1,#1
str r1,[r0]

ldr r0,=win
ldr r1,[r0]               @r5==1 =win++
cmp r5,#1
addeq r1,r1,#1
str r1,[r0]
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
ldr r0,=total                      @realize float
ldr r5,[r0]

vmov s4,r5
vcvt.f32.s32 s6,s4
ldr r0,=win
ldr r6,[r0]
vmov s10,r6
vcvt.f32.s32 s14,s10
vdiv.f32 s14,s14,s6
ldr r1,=f
vldr s20,[r1]
vmul.f32 s14,s20,s14
vcvt.f64.f32 d5,s14
ldr r0,=in2
vmov r2,r3,d5
bl printf


pop {r11,lr}
bx lr



addr_in1:.word in1
addr_in7:.word in7
addr_in8:.word in8
addr_in9:.word in9
addr_in11:.word in11
addr_store1:.word store1
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

