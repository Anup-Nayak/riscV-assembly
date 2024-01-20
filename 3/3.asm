.global _start
.text
#2022CS51827
_start:
	li a0, 1
	la a1, label
	li a2,10
	
	 li a7,64
	 ecall
	 
	li a0, 0
	la a1, x
	li a2, 10
	
	 li a7, 63
	 ecall 
	 
	 li a0,1
	 la a1,nl
	 li a2, 1
	 
	 li a7, 64
	 ecall
	 
	 #input taken and new line character printed
	li t0, 0
	la t1, name
	la t2, x
	li t3,10
	
_print:
	li a0,1
	mv a1,t1
	li a2,1
	
	li a7, 64
	 ecall
	
	li a0 1
	mv a1,t2
	li a2,1
	
	li a7, 64
	 ecall
	
	addi t0,t0,1
	addi t1,t1,1
	addi t2,t2,1
	
	bne t0,t3, _print
		
	#exits the code
	li a0, 0
	li a7, 93
	ecall

.data
label: .ascii "Enter X: \n"
nl: .ascii "\n"
name: .ascii "anup nayak"
x: .space 10
