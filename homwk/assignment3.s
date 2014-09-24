.text
.global _start
_start:
	/* Initialize */
	mov r1, #333    
	mov r3, #5       /* b=5 */
	mov r0, #0       /* r0=0 -> counter */
	mov r2, #0
	mov r7, #0
	mov r9,#0
	mov r4, #0 
        mov r8, #10  
	
	
	cmp  r1, r3    
	blt  swap

repeat2:
       mov r6,#1
       mul r7,r6,r3
       mul r9, r7,r8
       cmp r1,r9
       blt small
repeat:
       mul r2, r6,r8
       mul r7, r2, r3
       mul r9, r7, r8
       cmp r1,r9
       bge repeat
       add r0, r0, r2
       sub r1, r1, r7
       cmp r1, r3
       bge repeat2  
       b   end 

small:
       sub r1, r1, r3
       add r0, r0, #1
       cmp r1, r3
       bge small
       b   end




swap:

	cmp r4, #0
	bne end;
	mov r5, r0
	mov r0, r1
	mov r1, r5
end:
	mov r7, #1
	swi 0
