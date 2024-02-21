.global start
.text
#2022CS51827

start:
	li a7,5
	ecall

	li t5,0
	
	
	
sum:
	add t5,t5,a0
	addi a0,a0,-1
	bgt a0,zero,sum
	
	mv a0,t5

	li a7,1
	ecall
	
	li a7,10
	ecall
