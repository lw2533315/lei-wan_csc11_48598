.data
in1:.asciz"You win the single number. "
in2:.asciz"You loose the single number."
in3:.asciz"You bet on number %d "
in4:.asciz"Your accout balance now is %d /n"
in5:.asciz"You bet on Column %d "
in6:.asciz"You bet on Row %d"
in7:.asciz"You bet on %s (red/black)"
in8:.asciz"You bet on %s (odd/even)"
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

game2:     @Column
cmp r1,#2
bne game3
cmp r5,#0
beq lose2
ldr r0,addr_in1
bl printf
ldr r0,addr_in5
mov r1,r3
bl printf

mov r2,#1
mul r4,r2,r4
add r10,r10,r4
ldr r0, addr_in4
mov r1,r10
bl printf
b end

lose2:
ldr r0,addr_in2
bl printf
ldr r0, addr_in5
mov r1,r3
bl printf

sub r10,r10,r4
ldr r0,addr_in4
mov r1,r10
bl printf
b end






game3:      @singlerow
cmp r1,#3
bne game4
cmp r5,#0
beq lose3
ldr r0,addr_in1
bl printf
ldr r0,addr_in6
mov r1,r3
bl printf

mov r2,#5            @5 times rate
mul r4,r2,r4
add r10,r10,r4
ldr r0, addr_in4
mov r1,r10
bl printf
b end

lose3:
ldr r0,addr_in2
bl printf
ldr r0, addr_in6
mov r1,r3
bl printf

sub r10,r10,r4
ldr r0,addr_in4
mov r1,r10
bl printf
b end



game4:                          @color
cmp r1,#4
bne game5
cmp r5,#0
beq lose4
ldr r0,addr_in1
bl printf
ldr r0,addr_in7
mov r1,r3
bl printf

mov r2,#1
mul r4,r2,r4
add r10,r10,r4
ldr r0, addr_in4
mov r1,r10
bl printf
b end

lose4:
ldr r0,addr_in2
bl printf
ldr r0, addr_in7
mov r1,r3
bl printf

sub r10,r10,r4
ldr r0,addr_in4
mov r1,r10
bl printf
b end






game5:                      @even or odd
cmp r5,#0
beq lose5
ldr r0,addr_in1
bl printf
ldr r0,addr_in8
mov r1,r3
bl printf

mov r2,#1
mul r4,r2,r4
add r10,r10,r4
ldr r0, addr_in4
mov r1,r10
bl printf
b end

lose5:
ldr r0,addr_in2
bl printf
ldr r0, addr_in8
mov r1,r3
bl printf

sub r10,r10,r4
ldr r0,addr_in4
mov r1,r10
bl printf



end:
pop {lr}
bx lr

addr_in1:.word in1
addr_in2:.word in2
addr_in3:.word in3
addr_in4:.word in4
addr_in5:.word in5
addr_in6:.word in6
addr_in7:.word in7
addr_in8:.word in8
