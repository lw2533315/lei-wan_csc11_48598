.data
m1:.asciz" I have a number between 1  and 1000, you have max 10 times chance to guess the number. \n"
m2:.asciz" Please type your No. %d guess number\n"
m3:.asciz" Congratulations, You guessed the number!   Would you like to play again(y or n)?\n"
m4:.asciz" Too low.  Try again.\n"
m5:.asciz" Too high.  Try again.\n"
m6:.asciz" Too many tries \n"
m7:.asciz" Would you like to play agai(y/n) \n"
.balign 4
save:.word 0

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
mov r1,r6
bl printf

ldr r0,=format   @test
mov r1,r5
bl printf
ldr r0,=format
ldr r1,=save
bl scanf 

/*ldr r0,=format
@mov r1,r5
bl printf*/

ldr r1,=save
ldr r1,[r1]
mov r7,r1

/*ldr r0,=format    @test
mov r1,r5
bl printf*/

cmp r5,r7       @compare random number and input number
blt  biger
bgt  smaller
beq  correct

biger:
ldr r1,=m5     @bigger than random number
bl printf
add r6,r6,#1
cmp r6,#11
blt loop
b    final

smaller:
ldr r1,=m4
bl printf
add r6,r6,#1
cmp r6,#11
blt loop
b final

correct:
ldr r1,=m3
bl printf

ldr r0,=format1
ldr r1,ad_save
bl scanf

ldr r0,=save
ldr r1,=cmp
bl strcmp
beq tryagain
b end

final:
ldr r1,=m6
bl printf

@ldr r1,=m7           @!!!!!!!!!!!!
@bl printf          @ !!!!!!!!!!1

ldr r0,=format1
ldr r1,=save
bl scanf

ldr r0,=save
ldr r1,=cmp
bl strcmp
beq tryagain

end:
pop {r4,lr}
bx lr

ad_m1:.word m1
ad_m2:.word m2
ad_m3:.word m3
ad_m4:.word m4
ad_m5:.word m5
ad_m6:.word m6
ad_m7:.word m7
ad_format1:.word format1
ad_save:.word save
ad_format:.word format
ad_cmp:.word cmp
.global printf
.global scanf
.global strcmp



