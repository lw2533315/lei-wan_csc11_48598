.data

m1: .asciz"type 1 to choose Guess Number\ntype 2 to choose present with interest\ntype 3 to choose  find root\ntype 4 to choose program4\ntype 5 to exit\n"

m2: .asciz"which one do you choose?\n"
m3:.asciz"do you wanna continue?(y/n)\n"
format:.asciz"%d"
format1:.asciz"%s"
store:.word 0
cmp1:.asciz"y"

.text
.global main
main:
push {r4,lr}
continue:
ldr r0,=m1
bl printf

ldr r0,=m2
bl printf

ldr r0,=format
ldr r1,=store
bl scanf

ldr r1,=store
ldr r4,[r1]

cmp r4,#1
bleq guess

cmp r4,#2
bleq fv
cmp r4,#3
bleq root

cmp r4,#4

cmp r4,#5

ldr r0,=m3
bl printf

ldr r0,=format1
ldr r1,=store
bl scanf

ldr r0,=cmp1                @continue or not
ldr r1,=store
bl strcmp
beq continue
bne end
end:
pop {r4,lr}
bx lr

.global strcmp






