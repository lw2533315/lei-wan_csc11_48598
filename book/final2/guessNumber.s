.data
m1:.asciz"i have a number beteen1 and 1000, can you guess the number, you have max 10 times chance please type your guess?\n"
m2:.asciz"Please type your %d time number\n"
m3:.asciz"Congratulations, You guessed the number!   Would you like to play again(y or n)?\n"
m4:.asciz" Too low.  Try again.\n"
m5:.asciz" Too high.  Try again.\n"
m6:.asciz"Too many tries \n"
store:.word 0
in1:.asciz"Please type your 
format:.asciz"%d"
format1:.asciz"%s"
cmp:.asciz"y"

.text
.global guess
guess:
push {r4,lr}

tryagain:
bl random
mov r5,r1      @mov random number to r5
ldr r0,=m1
bl printf

loop:
mov r6,#1      @counter r6
ldr r0, =m2
ldr r1,=store
bl scanf

ldr r1,=store
ldr r1,[r1]
mov r7,r1

cmp r5,r7       @compare random number and input number
bltb biger
bgtb smaller
beq  correct

biger:
ldr r1,=m5     @bigger than random number
bl printf
mov r6,r6,#1
cmp r6,#11
bltb loop
b    final

smaller:
ldr r1,=m4
bl printf
mov r6,r6,#1
cmp r6,#11
bltb loop
b final

correct:
ldr r1,=r3
bl printf

ldr r0,=format1
ldr r1,=stroe
bl scanf

ldr r0,=store
ldr r1,=cmp
bl strcmp
beq tryagain
b end

final:
ldr r1,=m6
bl printf

ldr r1,=r3
bl printf

ldr r0,=format1
ldr r1,=stroe
bl scanf

ldr r0,=store
ldr r1,=cmp
bl strcmp
beq tryagain

end:
pop {r4,lr}
bx lr}


.global printf
.global scanf
.global strcmp



