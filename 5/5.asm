.global _start
.text
#2022CS51827
_start:

	li a0, 1
	la a1, label
	li a2,10
	
	 li a7,64
	 ecall
	 
	#take n as input
	li a7,5
	ecall
	
	add t6,t6,a0
	
	li t0,0
	li t1,1
	
	li t5,2
	li t3,0
	
	bgt t6,t1,fib
	beq t6,zero,z
	beq t6,t1,o
	
z:
	mv a0, t0
	li a7, 1
	ecall
	
	b exit
	
o:
	mv a0, t1
	li a7, 1
	ecall
	
	
	b exit
fib:
	
	#li a0, 45
	#li a7, 1
	#ecall
	
	add t3, t0,t1
	mv t0,t1
	mv t1,t3
	
	addi t5,t5,1
	blt t5,t6 fib
	
	
print:
	mv t6,t3
	mv a0,t6
	li a7, 1
	ecall
	
	
	
	
exit:
	li a0, 0
	li a7, 93
	ecall
	
.data
label: .ascii "Enter X: \n"

	
	
	
