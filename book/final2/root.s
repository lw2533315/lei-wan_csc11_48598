.data
 m1:.asciz"enter a int from 1 to 10000\n" 
m2:.asciz"the root is%f\n" 
.balign 4 
save:.word 0 
.balign 4 
f1:.float 100.0 
.balign 4 
f2:.float 200.0 
.balign 4 
f3:.float 300.0 
.balign 4 
f4:.float 400.0 
.balign 4 
f5:.float 500.0 
.balign 4 
f6:.float 0.0 
.balign 4 
f:.float 2
format:.asciz"%d" 
formatf:.asciz"%f"

.text
.global root
root:
push {r4,lr}

find:
ldr r0,=m1
bl printf 

ldr r0,=format
ldr r1,=save
bl scanf

ldr r1,=save
ldr r5,[r1]
vmov s0,r5
vcvt.f32.s32 s1,s0  @s1 is inputed number

ldr r1,=f
vldr s14,[r1]  @ s14 is 2



cmp r5,#1
blt find
cmp r5,#10
bge jump2
ldr r1,=f1
vldr s4,[r1]
b calculate

jump2:

cmp r5,#100
bge jump3
ldr r1,=f2
vldr s4,[r1]
b calculate

jump3:
cmp r5,#1000
bge jump4
ldr r1,=f3
vldr s4,[r1]
b calculate

jump4:
ldr r8,=10000
cmp r5,r8
beq  jump5
bgt find
ldr r1,=f4
vldr s4,[r1]
b calculate

jump5:
ldr r1,=f5
vldr s4,[r1]
b calculate



calculate:


vmov s13,s4


vdiv.f32 s17,s1,s4 @s/x

vadd.f32 s4,s17,s4  @+x

vdiv.f32 s4,s4,s14  @/2


vmov r5,s13
vmov r6,s4

cmp r5,r6
bne  calculate



ldr r0,=m2
vcvt.f64.f32 d10,s4
vmov r2,r3,d10
bl printf

pop {r4,lr}
bx lr
