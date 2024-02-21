.global start
.text
#2022CS51827
start: 
	 li a0,1
	la a1,l1
	li a2,9
	
	li a7,64
	ecall
	
	li a7,5
	ecall
	
	mv t0,a0
	
	li a0,1
	la a1,l2
	li a2,9
	
	li a7,64
	ecall
	
	li a7,5
	ecall
	
	mv t1,a0
	
	sub t2,t0,t1
	
	#t0 is n, t1 is r,t2 is (n-r)
	
	beq t0,t1,nr
	beq t0,zero,nz
	beq t1,zero,rz
	
	mv a0,t0
	li t6,1
	
	jal fact
	
	mv s10,a0
	
	mv a0,t1
	li t6,1
	
	jal fact
	
	div s10,s10,a0
	
	mv a0,t2
	li t6,1
	
	jal fact
	
	div s10,s10,a0
	
	li a0,1
	la a1,l3
	li a2,17
	
	li a7,64
	ecall
	
	mv a0,s10
	li a7,1
	ecall
	
	b exit
	
	
	
fact:	
	mul t6,t6,a0
	addi a0,a0,-1
	bgt a0,zero, fact
	
	mv a0,t6
	jr ra
	
nr:
	
	li a0,1
	la a1,l3
	li a2,17
	
	li a7,64
	ecall
	
	li a0,1
	li a7,1
	ecall
	
	b exit
	
nz:
	li s10,1
	
	mv a0,t1
	li t6,1
	
	jal fact
	
	div s10,s10,a0
	
	mv a0,t2
	li t6,1
	
	jal fact
	
	div s10,s10,a0
	
	li a0,1
	la a1,l3
	li a2,17
	
	li a7,64
	ecall
	
	mv a0,s10
	li a7,1
	ecall
	
	b exit
	
rz:
	
	li a0,1
	la a1,l3
	li a2,17
	
	li a7,64
	ecall
	
	li a0,1
	li a7,1
	ecall
	
	b exit
	
	
exit:
	li a7,10
	ecall
	
	
.data
l1: .ascii "Enter n: "
l2: .ascii "Enter r: "
l3: .ascii "Value of nCr is: "