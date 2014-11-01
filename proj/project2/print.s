.data
in1:.asciz"You win the single number. "
in2:.asciz"You loose the single number."
in3:.asciz"You bet on number %d "
in4:.asciz"Your accout balance now is %d /n"

.text

.global print
print:
push {lr}

cmp r1,#1
bne game2
cmp r5,#0
beq lose1
ldr r0,addr_in1
bl printf
ldr r0,addr_in3
mov r1,r3
bl printf

mov r2,#35
mul r4,r2,r4
add r10,r10,r4
ldr r0, addr_in4
mov r1,r10
bl printf
b end

lose1:
ldr r0,addr_in2
bl printf
ldr r0, addr_in3
mov r1,r3
bl printf

sub r10,r10,r4
ldr r0,addr_in4
mov r1,r10
bl printf
b end

game2:
cmp r1,#2
bne game3





game3:
cmp r1,#3
bne game4


game4:
cmp r1,#4
bne game5





game5:




end:
pop {lr}
bx lr

addr_in1:.word in1
addr_in2:.word in2
addr_in3:.word in3
addr_in4:.word in4
