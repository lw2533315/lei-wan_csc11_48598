
 .global _start
_start:
mov r1,#111
mov r2, #0

repeat:
sub r1, r1, #2
add r2,r2, #1
cmp r2, #10
ble repeat
mov r0,r1
end:
mov r7,#1
swi 0




