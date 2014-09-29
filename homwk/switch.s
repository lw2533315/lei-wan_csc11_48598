 .global _start
_start:
mov r1, #3
cmp r1, #1
beq _1
cmp r1, #2
beq _2
cmp r1, #3
beq _3
b end

_1:
mov r0,r1
b end

_2:
add r0, r1,#1
b end

_3:
mov r2, #2
mul r0, r1,r2
b end

end:
mov r7,#1
swi 0

