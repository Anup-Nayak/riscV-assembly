.global start
.text
#2022CS51827

start:
	li a7,5
	ecall
	
	li a1,0
	jal sum
	
	mv a0,a2
	li a7,1
	ecall
	
	li a7,10
	ecall
	
sum:
	ble a0,zero,sum_exit
	add a1,a1,a0
	addi a0,a0,-1
	jal x0,sum

sum_exit:
	addi a2,a1,0
	jalr x0,0(x1)