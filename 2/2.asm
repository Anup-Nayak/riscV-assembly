.global _start
.text
#2022CS51827
_start:
	li t0, 0
	li t3, 10
	
	li a0, 1
	la a1, label
	li a2,19
	
	 li a7,64
	 ecall

loop:
	
	li a7,5
	ecall
	
	addi sp,sp,-4
	sw a0,0(sp)
	
	add t1,t1,a0
	addi t0, t0, 1
	
	bne t0,t3,loop
	
	addi sp,sp,40
	
	mv a0, t1
	li a7, 1
	ecall
			
	li a0, 0
	li a7, 93
	ecall
	
.data
label:.ascii "Enter 10 numbers: \n" 
	
	
