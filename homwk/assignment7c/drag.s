
.data
@m1:.asciz"enter the velocity \n"
@m2:.asciz"enter the radius\n"
half: .float 0.5
threetwo: .float 32
rho: .float 0.00237	
vel: .word 0		
rad: .word 0	
pi:.float 3.1415926
conv: .float 0.006944444
cd: .float 0.4
scan: .asciz "%f"
outdynp: .asciz "Floating Dynamic Pressure = %f (lbs)\n";
outarea: .asciz "Cross Section Area x32 = %f (ft^2)\n"
outdrag: .asciz "Floating Drag x 32 = %f (lbs)\n"

.text
	.global main
main:
	push {r4, lr}
       @ ldr r0,ad_m1
       @ bl printf

	ldr r0, ad_scan
	ldr r1, ad_vel
	bl scanf
        
       @ ldr r0,ad_m2
       @bl printf
	ldr r0, ad_scan
	ldr r1, ad_rad
	bl scanf

	/* dynamic pressure */
	ldr r1, ad_vel	
	vldr s5, [r1]		@s1 =v
	ldr r1, ad_half
	vldr s6, [r1]		@s2=0.5
	ldr r1, ad_rho
	vldr s4, [r1]

	vmul.f32 s5, s4, s5	@s5=0.5 rho
	vmul.f32 s4, s5, s6	@s4=0.5 rho * v
	vmul.f32 s4, s4, s5	@s4=0.5 rho * v^2 (dynamic pressure)

	/* area */
	ldr r1, ad_pi
	vldr s7, [r1]		@s7=pi
	ldr r1, ad_rad
	vldr s8, [r1]		@s8=rad
	ldr r1, ad_conv
	vldr s9, [r1]		@s9=conv

	vmul.f32 s6, s7, s8	@s6=pi*rad
	vmul.f32 s6, s6, s8	@s6=pi*rad^2
	vmul.f32 s6, s6, s9	@s6=pi*rad^2*conv

	/* Drag */
	ldr r1, ad_cd
	vldr s3, [r1]		@s3=Cd

	vmul.f32 s8, s4, s6	@s2=dynp*area
	vmul.f32 s8, s8, s3	@s2=dynp*area*Cd

	/* x32 */
	ldr r1, ad_threetwo
	vldr s5, [r1]		@s5=32
	vmul.f32 s8, s8, s5	@dragx32
	vmul.f32 s6, s6, s5	@areax32

	vcvt.f64.f32 d15, s8
	vcvt.f64.f32 d14, s6
	vcvt.f64.f32 d13, s4
output:
	ldr r0, ad_outdynp
	vmov r2, r3, d13
	bl printf

	ldr r0, ad_outarea
	vmov r2, r3, d14
	bl printf

	ldr r0, ad_outdrag
	vmov r2, r3, d15
	bl printf

end:
	pop {r4, lr}
	bx lr
@ad_m1:.word m1
@ad_m2:.word m2
ad_half: .word half
ad_threetwo: .word threetwo
ad_rho: .word rho
ad_vel: .word vel
ad_rad: .word rad
ad_pi: .word pi
ad_conv: .word conv
ad_cd: .word cd
ad_scan: .word scan
ad_outdynp: .word outdynp
ad_outarea: .word outarea
ad_outdrag: .word outdrag

