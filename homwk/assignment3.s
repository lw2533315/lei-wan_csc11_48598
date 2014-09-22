.text
.global main
main:
	/* Initialize */
	mov r2, #111     /* a=111 */
	mov r3, #5       /* b=5 */
	mov r0, #0       /* r0=0 -> counter */
	mov r1, r2       /* r1=a=111 */
	mov r4, #0   
	
	
	cmp  r1, r3      /* compare and leave if less */
	blt  swap
	/* Now just perform repeated subtractions */
repeat_subtraction:
    mov r6, #1       @record how many times
	mov r8, #10
	mov r7, #0       @ r3*r6
	mov r9, #0
	mul r7, r6,r3
	mul r9, r7,r8
	cmp r1,r9
	blt small
	
repeat_scale:
    mul r6, r6,r8     
    mul r7, r6,r3
    mul r9, r7,r8
    
    cmp r1,r9
    
    bge repeat_scale
small:
    sub r1,r1,r7 
    add r0, r0, r6  
    
    cmp r1, r7 
    
	
	bge repeat_subtraction    
swap:
	/* Exchange r0 and r1 using r5 with a swap if flag set */
	cmp r4, #0
	bne end;
	mov r5, r0
	mov r0, r1
	mov r1, r5
end:
	bx lr
	