.data
m1:.asciz"Integer Dynamic Pressure =  %d lbs\n"
m2:.asciz"Cross Sectional Area*32 = %d fit^2\n"
m2:.asciz"Integer Drag*32 = %d lbs\n"
.text
.global main
mian:
push {lr}
mov r1,#1        @iharf   1b,>>1
mov r2,0x9b5     @irho    12b,>>20
mov r3,200       @ivel     8b,
mov r4,0x3243f7  @ipi     24b,>>20
mov r5,6         @irad     4b,
mov r6,0x1c7     @iconv   12b,>>16
mov r7,0x666     @icd     12b,>>12

mul r1,r2,r1     @12b, bp-21
mul r1,r3,r1     @20b, bp-21
mul r1,r3,r1     @28b, bp-21   1/2*e*v*v
asr r1,#12       @16b, bp-9
mov r8,r1,asr#9
mul r4,r5,r4     @28b, bp-20
mul r4,r5,r4     @32b, bp-20   pi*r*r
asr r4,#12       @20b, bp-8
mul r4,r6,r4     @32b, bp-24
asr r4,#16       @16b, bp-8
mov r9,r4,asr#3
mul r1,r4,r1     @32b, bp-17
asr r1,#12       @20b, bp-5
mul r1,r7,r1     @32b,  bp-17
mov r10,r1,asr#12

ldr r0,ad_m1
mov r1,r8
bl printf

ldr r0,ad_m2
mov r1,r9
bl printf

ldr r0, ad_m3
mov r1,r10
bl printf

pop {lr}
bx lr

ad_m1:.word m1
ad_m2:.word m2
ad_m3:.word m3

.global printf
