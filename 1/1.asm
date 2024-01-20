.global _start
.text
#2022CS51827
_start:
	li a0, 1
	la a1, name
	li a2,15
	
	 li a7,64
	 ecall
	 
	  li a0,1 
	  la a1, entryNumber
	  li a2,12
	  
	   li a7, 64
	   ecall 
	
	
	#exits the code
	li a0, 0
	li a7, 93
	ecall

.data
name: .ascii "Anup Lal Nayak\n"
entryNumber: .ascii "2022CS51827\n"
