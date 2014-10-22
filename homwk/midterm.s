.data
.balign 4
int1: .asciz"type 1 to choose problem1\ntype 2 to choose problem 2\ntype 3 to choose  problem 3\ntype 4 to exit\n"

.balign 4
int2: .asciz"which one do you choose?\n"

.balign 4
int3: .asciz"enter the hours of work\n"

.balign 4
int4: .asciz"enter the rate of pay\n"

.balign 4
input1: .word 0

.balign 4
pattern1: .asciz"%s"

.balign 4
pattern2: .asciz"the term number %d is %d\n"

.balign 4
input3: .word 0

.balign 4
input2: .word 0

.balign 4
pattern: .asciz"%d"

.balign 4
int5: .asciz"over 60 hours is illegal\n"

.balign 4
int6: .asciz"The gross payment is %d\n"

.balign 4
int7: .asciz"type a to choose package a\ntype b to choose package b\ntype c to choose  package c\ntype d to exit\nwhich package do you  choose\n"

.balign 4
int8: .asciz"how many hours to you access internet\n"

.balign 4
int9: .asciz"Monthly charge is %d\n"

.balign 4
int10: .asciz"Enter the term on the sequence\n"


.balign 4
cmp1: .asciz"a"

.balign 4
cmp2: .asciz"b"

.balign 4
cmp3: .asciz"c"
.balign 4
cmp4:.asciz"d"
.text

payment:

push {lr}

ldr r0,address_int3
bl printf

ldr r0,address_pattern
ldr r1,address_input1
bl scanf

ldr r0,address_int4
bl printf

ldr r0,address_pattern
ldr r1,address_input2
bl scanf

ldr r2,address_input1
ldr r2,[r2]

ldr r1,address_input2
ldr r1,[r1]

cmp r2,#20
ble run2
bgt run3

run2:
mul r3,r1,r2
b end2

run3:
cmp r2,#40
bgt run4
sub r4,r2,#20                   @the part of over 20
mov r5,r1,lsl#1                 @double rate of pay
mul r4,r5,r4
mov r6,#20
mul r7,r6,r1
add r3,r4,r7
b end2

run4:
cmp r2,#60
bgt run5
sub r4,r2,#40                       @the part of over 40
mov r5,r1,lsl#1                    @double rate of pay
add r8,r5,r1                       @triple rate of pay
mul  r4,r8,r4                     @the payment of over 60
mov  r6,#20
mul r7,r6,r1
mul r9,r6,r5
add  r4,r4,r7
add  r3,r4,r9
b end2

run5:
ldr r0,address_int5
bl printf
b end3

end2:
ldr r0,address_int6
mov r1,r3
bl printf
end3:

pop {lr}
bx lr


package1:                              @problem2  package 1
push {lr}
ldr r0,address_int8
bl printf

ldr r0,address_pattern
ldr r1,address_input1
bl scanf

ldr r1,address_input1
ldr r1,[r1]
cmp r1 ,#11
ble run6
bgt run7
run6:
mov r2,#30
b end4
run7:
cmp r1,#22
bgt  run8
mov r2,#30
add r2,r2,#3
b end4

run8:
sub r1,r1,#22
mov r3,#6
mul r1,r3,r1
add r1,r1,#30
add r2,r1,#3

end4:
ldr r0,address_int9
mov r1,r2
bl printf
pop {lr}
bx lr

package2:
push {lr}
ldr r0,address_int8
bl printf

ldr r0,address_pattern
ldr r1,address_input1
bl scanf

ldr r1,address_input1
ldr r1,[r1]
cmp r1,#22
ble pa2run6
bgt pa2run7

pa2run6:
mov r2,#35
b pa2end4

pa2run7:
cmp r1,#44
bgt pa2run8
mov r2,#35
add r2,r2,#2
b pa2end4

pa2run8:
sub r1,r1,#44
mov r3,#4
mul r1,r3,r1
add r1,r1,#35
add r2,r1,#2

pa2end4:
ldr r0,address_int9
mov r1,r2
bl printf

pop {lr}
bx lr
package3:
push {lr}
ldr r0,address_int8
bl printf

ldr r0,address_pattern
ldr r1,address_input1
bl scanf

ldr r1,address_input1
ldr r1,[r1]
cmp r1,#33
ble pa3run6
bgt pa3run7

pa3run6:
mov r2,#40
b pa3end4

pa3run7:
cmp r1,#66
bgt pa3run8
mov r2,#40
add r2,r2,#1
b pa3end4

pa3run8:
sub r1,r1,#66
mov r3,#2
mul r1,r3,r1
add r1,r1,#40
add r2,r1,#1

pa3end4:
ldr r0,address_int9
mov r1,r2
bl printf

pop {lr}
bx lr



isp_fee:
push {lr}
jump5:
ldr r0,address_int7
bl printf

ldr r0,address_pattern1
ldr r1,address_input1
bl scanf

ldr r0,address_cmp1
ldr r1,address_input1
bl strcmp
bleq package1
bne jump1
b end5
jump1:
ldr r0,address_cmp2
ldr r1,address_input1
bl strcmp
bleq package2
bne jump3
b end5

jump3:
ldr r0,address_cmp3
ldr r1,address_input1
bl strcmp
bleq package3
bne jump4
b end5
jump4:
ldr r0,address_cmp4
ldr r1,address_input1
bl  strcmp
bleq end5
bne jump5 
 
end5:
pop {lr}
bx lr

fibon:
push {lr}
mov r2,#0
cmp r0,#0
beq firun
cmp r0,#1
bet firun1
sub r0,r0,#1
cmp r0,#1
mov r2,#
bl fibon

firun:
add r2,r2,#0
bl fiend

firun1:
add r2,r2,#1
bl fiend

fiend: 


fibonacci:
push {lr}
ldr r0, address_int10
bl printf

ldr r0, address_pattern
ldr r1,address_input1
bl scanf

ldr r0, address_input1
ldr r1,[r1]
bl fibon                                        @not finish


pop {lr}


.global main
main:
push {lr}

ldr r0,address_int1
bl printf

run1:
ldr r0,address_int2
bl printf

ldr r0,address_pattern
ldr r1,address_input1
bl scanf

ldr r1,address_input1
ldr r1,[r1]
cmp r1,#1
bleq payment

cmp r1,#2
bleq isp_fee

cmp r1,#3
bleq fibonacci


cmp r1,#4
bleq end1
bne run1

end1:
pop {lr}
bx lr

address_cmp1:.word cmp1
address_cmp2:.word cmp2
address_cmp3:.word cmp3
address_pattern1:.word pattern1
address_pattern2:.word pattern2
address_input3: .word input3
address_int6: .word int6
address_int5: .word int5
address_input2: .word input2
address_int1: .word int1
address_int2: .word int2
address_pattern: .word pattern
address_input1: .word input1
address_int3: .word int3
address_int4: .word int4
address_int7:.word int7
address_int8:.word int8
address_int9:.word int9
address_int10:.word int10
address_cmp4:.word cmp4
.global printf
.global scanf
.global strcmp
