  .global _start
  _start:
  mov r2,#116
  mov r3, #5
  mov r0, #0
  mov r1, r2
  mov r4, #0
  cmp r1,r3
  blt swap
  
  
  repeat:
  add r0,r0,#1
  sub r1,r1,r3
  cmp r1,r3
  bge repeat
  
  swap:
  cmp r4,#0
  bne end;
  mov r5,r0
  mov r0,r1
  mov r1,r5
  
  
  end:
 mov r7,#1
 swi 0
