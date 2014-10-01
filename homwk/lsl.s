 .global _start
_start:

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
mov r7, #1
swi 0



