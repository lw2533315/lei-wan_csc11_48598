 .global _start
_start:

mov r1, #9
mov r2, #5
cmp r1, r2
bge bigger
b end

bigger:
sub r1, r1, r2
end:
mov r7,#1
swi 0
