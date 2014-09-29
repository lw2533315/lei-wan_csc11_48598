 .global _start
_start:
mov r1,#0
mov r2,#0
repeat:
cmp r1, #10
bge bigger
add r2, r2,#3
add r1,r1,#1
b  repeat

bigger:
mov r0,r2
b end
end:
mov r7,#1
swi 0
