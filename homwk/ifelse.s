 .global _start
 _start:
mov r1, #9
mov r2,#8
cmp r1,r2
bge bigger
blt small

bigger:




sub r1,r1,r2
b end

small:
rsb r1,r1,r2
b end

end:
mov r7,#1
swi 0


 
