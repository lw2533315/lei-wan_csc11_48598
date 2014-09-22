  .global _start
 _start:
      mov r2, #102
	  mov r3,#7
	  mov r4,#0
	  cmp r2,r3
	  beq equal
	  blt small

ab:
      subs r2, r2,r3
	  adds r4, r4, #1
	  cmp r2,r3
	  blt small
	  bge ab


small:
      mov r1,r4
	  mov r0,r2
	  b end

equal:
      mov r1,r4
	  mov r0,#0
	  b end

end:
     mov r7,#1
	 swi 0
