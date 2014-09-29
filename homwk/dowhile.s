 .global _start
_start:

mov r1,#2



repeat:
add r1, r1,#5
cmp r1,#15
ble repeat

mov r0, r1

mov r7, #1
swi 0
