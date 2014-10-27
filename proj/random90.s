.data
 
message: .asciz "The random function returned %d\n"
 
.text

/*void scaleRight(int &r1,int &r3,int &r2) */
.globl scaleRight
scaleRight:
	push {lr}             /* Push lr onto the stack */
	doWhile_r1_lt_r2:     /* Shift right until just under the remainder */
		mov r3,r3,ASR #1; /* Division counter */
		mov r2,r2,ASR #1  /* Mod/Remainder subtraction */
	cmp r1,r2
	blt doWhile_r1_lt_r2
	pop {lr}              /* Pop lr from the stack */
    bx lr                 /* Leave scaleRight */
/* end scaleRight */

/* void addSub(int &r3,int &r2,int &r0,int &r1) */
.globl addSub
addSub:
	push {lr}       /* Push lr onto the stack */
	doWhile_r3_ge_1:
		add r0,r0,r3
		sub r1,r1,r2
		bl scaleRight
	cmp r3,#1
	bge doWhile_r3_ge_1
    pop {lr}       /* Pop lr from the stack */
    bx lr          /* Leave addSub */
/* end addSub */

/* void scaleLeft(int &r1,int &r3,int &r2) */
.globl scaleLeft
scaleLeft:
	push {lr}             /* Push lr onto the stack */
	doWhile_r1_ge_r2:     /* Scale left till overshoot with remainder */
		mov r3,r3,LSL #1  /* scale factor */
		mov r2,r2,LSL #1  /* subtraction factor */
		cmp r1,r2
	bge doWhile_r1_ge_r2  /* End loop at overshoot */
	mov r3,r3,ASR #1      /* Scale factor back */
	mov r2,r2,ASR #1      /* Scale subtraction factor back */
	pop {lr}              /* Pop lr from the stack */
    bx lr                 /* Leave addSub */
/* end scaleLeft */

/* void divMod(int &r2,int &r0,int &r1) */
.globl divMod
divMod:
	push {lr}       /* Push lr onto the stack */
	/* Determine the quotient and remainder */
	mov r0,#0
	mov r3,#1
	cmp r1,r2
	blt end
		bl scaleLeft
		bl addSub
	end:
	pop {lr}       /* Pop lr from the stack */
    bx lr          /* Leave addSub */

.global main
main:
    push {r4,lr}                 /* Push lr onto the top of the stack */

	mov r0,#0                    /* Set time(0) */
    bl time                      /* Call time */
	bl srand                     /* Call srand */
	
	mov r4,#0                    /* Setup loop counter */
	
  loop_rand:                     /* Create a 2 digit random number */
	bl rand                      /* Call rand */
	bl abs
       mov r1,r0         /* In case random return is negative */
	mov r2,#90                   /* Move 90 to r2 */
		                         /* We want rand()%90+10 so cal divMod with rand()%90 */
	bl divMod                    /* Call divMod function to get remainder */
	add r1,#10                   /* Remainder in r1 so add 10 giving between 10 and 99 -> 2 digits */
	
    ldr r0, address_of_message   /* Set &message2 as the first parameter of printf */
    bl printf                    /* Call printf */
	
	add r4,#1
	cmp r4,#20
	blt loop_rand
	
 
    pop {r4,lr}                     /* Pop the top of the stack and put it in lr */
    bx lr                        /* Leave main */
 
address_of_message: .word message

/*External Functions*/
.global printf
.global time
.global srand
.global rand
.global abs
