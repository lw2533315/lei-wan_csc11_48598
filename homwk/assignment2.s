 .global _startf
_start:
mov r2, #102
mov r3, #7
cmp r2,r3
beq aeb
blt asb
mov r0,#0

ab:
subs r2, r2,r3

add r0, r0,#1
cmp r3,r2
blt ab
mov r1,r2
bal end



asb:
mov r0,#0
mov r1,#102
bal end


aeb:
mov r0,#1
mov r1,#0
bal end

end:
mov r7,#1
swi 0