.data
m1:.asciz"a number between 1 and 1000, you have 10 times chance to guess it\n"
m2:.asciz"Please type your No.%d guess number\n"
m3:.asciz"Congratuations,you guessed the number! woud you like to play again(y/n)"
m4:.asciz"Too low. Try again.\n"
m5:.asciz"Too high. try again.\n"
m6:.asciz"Too many tryes \n"
m7:.asciz"would you like to play again (y/n)"
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
mov r5,r1
ldr r0,ad_m1
bl printf
mov r6,#1 @accounter r6

loop:

ldr r0,ad_m2
mov r1,r6
bl printf



ldr r0, ad_format
ldr r1, ad_save
bl scanf



ldr r1,ad_save

ldr r7,[r1]

/*ldr r0,=format
mov r1,r5
bl printf*/

cmp r5,r7   @compare random number and input number
blt biger   
bgt smaller
beq correct

biger:
ldr r0,ad_m5
bl printf

add r6,r6,#1

cmp r6,#11
blt loop
b final

smaller:
ldr r0,ad_m4
bl printf
add r6,r6,#1
cmp r6,#11
blt loop
b final

correct:
ldr r0,ad_m3
bl printf

ldr r0,ad_format1
ldr r1,ad_save
bl scanf

ldr r0,ad_save
ldr r1,ad_cmp
bl strcmp
beq tryagain
bne end

final:
ldr r0,ad_m6
bl printf

ldr r0,=m7
bl printf

ldr r0,ad_format1
ldr r1,ad_save
bl scanf

ldr r0,ad_save
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
ad_save:.word save
ad_format:.word format
ad_format1:.word format1
ad_cmp:.word cmp
.global printf
.global scanf
.global strcmp
