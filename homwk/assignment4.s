.data


message1: .asciz"Hey,type a numerator"

message2: .asciz"Hey, type a denominator"

message3: .asciz"%d is numerator/denominator, %d is numerator%%denominator"

pattern: .asciz"%d"

.balign 4
read: .word 0


.balign 4
return1: .word 0

.balign 4
return2: .word 0

.text

divide:

 mov r0, #111 
 mov r1, #5 
 mov r5, #0 
 mov r4, #2    @times of shift 
 mov r2, #0 
 mov r3, #0  
 
 
cmp r0, r1 
blt swap 
 
 
 loop: 
 mov r6,#1 
 mov r7,#1    @couter  
 mov r5,r1 
 repeat:      @shift test 
 mov r6,r7 
 mov r5, r5,lsl#1 
 cmp r0,r5 
 blt small 
 mul r7,r6,r4 
 bge repeat 
 
 
 small: 
 mov r5, r5,lsr#1    @return 1 shift 
 sub r0,r0,r5 
 add r2,r2,r7 
 cmp r0,r1 
 bge  loop 
 mov r1,r0 
 mov r0,r2 
 b end 
 swap: 
 mov r3,r1 
 mov r1,r0 
 mov r0, r3 
 
 
 
 
 end: 
bx lr 
 
.global main
main:
ldr r1,address_return1
str lr, [r1]

ldr r0,address_message1
bl printf

ldr r0, address_pattern
ldr r1, address_read
bl scanf

mov r3,r1

ldr r0, address_message1
bl printf

ldr r0, address_pattern
ldr r1,address_read
bl scanf

mov r0, r3
bl divide

mov r3,r1
mov r1,r0
mov r2,r3
ldr r0,address_message3
bl printf

ldr r1, address_return1
ldr lr,[r1]
bx lr















address_return1: .word return1
address_return2: .word return2
address_message1: .word message1
address_message2: .word message2
address_read: .word read
address_message3: .word message3

address_pattern: .word pattern

.global printf
.global scanf

