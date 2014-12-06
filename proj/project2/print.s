.data

testd:.asciz"%d\n"
tests:.asciz"%s\n"
in1:.asciz"You win the single number. "
in2:.asciz"You loose the single number."
in11:.asciz"You win on Colume. "
in12:.asciz"You loose on Colume. "
in13:.asciz"You win on Row. "
in14:.asciz"You loose on Row. "
in15:.asciz"You win on Color. "
in16:.asciz"You loose on Color. "
in17:.asciz"You win on Odd/Even. "
in18:.asciz"You loose on Odd/Even. "
in3:.asciz"You bet on number %d "
in4:.asciz"Your accout balance now is %d \n"
in5:.asciz"You bet on Column %d "
in6:.asciz"You bet on Row %d"
in7:.asciz"You bet on Red, "
in9:.asciz"You bet on Black, "
in8:.asciz"You bet on Odd, "
in10:.asciz"You bet on Even, "
@t:.asciz"the number is  %d \n\n"
.text

.global print
print:
push {lr}


cmp r6,#1                    @r6 which game
bne game2
cmp r5,#0              @r5 win/lose   0 is loose  1 is win
beq lose1


ldr r0,addr_in1
bl printf


ldr r0,=in3
mov r1,r7
bl printf
mov r2,#35            @rate of bet
mul r4,r2,r4          @35time   r4 is how much to bet
add r10,r10,r4         @balance change         
ldr r0, addr_in4
mov r1,r10 
bl printf
b end

lose1:
ldr r0,addr_in2
bl printf
ldr r0, addr_in3
mov r1,r7
bl printf

sub r10,r10,r4
ldr r0,addr_in4
mov r1,r10
bl printf
b end

game2:     @Column
cmp r6,#2  
bne game3
cmp r5,#0
beq lose2
ldr r0,addr_in11
bl printf
ldr r0,addr_in5
mov r1,r7
bl printf

mov r2,#1
mul r4,r2,r4
add r10,r10,r4
ldr r0, addr_in4
mov r1,r10
bl printf
b end

lose2:
ldr r0,addr_in12
bl printf
ldr r0, addr_in5
mov r1,r7
bl printf

sub r10,r10,r4
ldr r0,addr_in4
mov r1,r10
bl printf
b end






game3:      @singlerow
cmp r6,#3
bne game4
cmp r5,#0
beq lose3
ldr r0,addr_in13
bl printf
ldr r0,addr_in6
mov r1,r7
bl printf

mov r2,#5            @5 times rate
mul r4,r2,r4
add r10,r10,r4
ldr r0, addr_in4
mov r1,r10
bl printf
b end

lose3:
ldr r0,addr_in14
bl printf
ldr r0, addr_in6
mov r1,r7
bl printf

sub r10,r10,r4
ldr r0,addr_in4
mov r1,r10
bl printf
b end



game4:                          @color
cmp r6,#4
bne game5
cmp r5,#0
beq lose4
ldr r0,addr_in15
bl printf
cmp r7,#114                     @type string store in to the array memory transform into number AscII 114=red
ldr r0,addr_in7
bleq printf
ldr r0,addr_in9
blne printf

mov r2,#1
mul r4,r2,r4
add r10,r10,r4
ldr r0, addr_in4
mov r1,r10
bl printf
b end

lose4:
ldr r0,addr_in16
bl printf

cmp r7,#114
ldr r0, addr_in7
bleq  printf
ldr r0,addr_in9
blne printf

sub r10,r10,r4
ldr r0,addr_in4
mov r1,r10
bl printf
b end






game5:                      @even or odd
cmp r6,#0
beq lose5
cmp r5,#0
beq lose5
ldr r0,addr_in17
bl printf
cmp r7,#111
ldr r0,addr_in8
bleq printf
ldr r0,addr_in10
blne printf


mov r2,#1
mul r4,r2,r4
add r10,r10,r4
ldr r0, addr_in4
mov r1,r10
bl printf
b end

lose5:
ldr r0,addr_in18
bl printf
cmp r7,#111
ldr r0, addr_in8
bleq printf
ldr r0,addr_in10
blne printf


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
ad_testd:.word testd
ad_tests:.word tests
addr_in9:.word in9
addr_in11:.word in11
addr_in12:.word in12
addr_in13:.word in13
addr_in14:.word in14
addr_in15:.word in15
addr_in16:.word in16
addr_in17:.word in17
addr_in18:.word in18
addr_in10:.word in10
