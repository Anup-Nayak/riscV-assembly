.global _start
.text
#2022CS51827
_start:

	li a0, 1
	la a1, label1
	li a2,21
	
	 li a7,64
	 ecall
	
takeinput1:
	li a0, 0
	la a1, input1
	li a2, 25
	
	 li a7, 63
	 ecall 
	
	li a0, 1
	la a1, newline
	li a2,1
	
	 li a7,64
	 ecall
	
	li a0, 1
	la a1, label2
	li a2,22
	
	 li a7,64
	 ecall
	 
takeinput2:
	li a0, 0
	la a1, input2
	li a2, 25
	
	 li a7, 63
	 ecall 
	
	li a0, 1
	la a1, newline
	li a2,1
	
	 li a7,64
	 ecall
	
wow:
	la a0, num1          
	la a1, num2          
	la a2, result        
	
	li a3, 25             
	li t5,26
	
	#counter
	li t6,0
	
	li t3,10
	
	#carry 
	li t4, 0
	
# Perform addition
add_loop:

	lw t0, 0(a0)         
	lw t1, 0(a1)         
	
	add t2, t0, t1       # t2 = num1 + num2
	add t2, t2, t4	     # t2 = t2 + carry
	
	#check if t2 > 10
	
	bge t2, t3 , ss
	li t4,0
	b so

ss:
	li t4,1
	sub t2, t2, t3
	
so:
	sw t2, 0(a2)         
	
	addi a0, a0, 4       
	addi a1, a1, 4       
	addi a2, a2, 4       
	
	addi a3, a3, -1      
	bnez a3, add_loop    
	
	sw t4,0(a2)
	
	li a0, 1
	la a1, label3
	li a2,8
	
	 li a7,64
	 ecall
	
	la a2,result
	addi a2, a2, 100
	
exit:    
	
	lw t0, 0(a2)
	mv a0,t0
	
	li a7,1
	ecall
	
	addi a2,a2,-4
	addi t6,t6,1
	bne t6,t5,exit
	 
	li a0, 0
	li a7, 93
	ecall


.data
label1: .ascii "Enter first number : "
label2: .ascii "Enter second number : "
label3: .ascii "Sum is : "
input1: .space 25
input2: .space 25

newline: .ascii "\n"
num1:  .word 9,6,7,8,6,7,8,1,2,5,4,3,5,7,8,9,0,4,5,6,3,5,6,7,9   
num2:  .word 7,8,6,9,8,6,5,8,4,3,7,1,5,8,4,5,4,8,4,7,2,3,4,1,5    
result: .word 
