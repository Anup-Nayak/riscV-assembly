.global start
#2022CS51827

.data
equation: .space 200

.text
start:

	li a0, 0
	la a1, equation
	li a2, 200
	
	 li a7, 63
	 ecall 

	
	la x10,equation              
	lb x5,0(x10)
	addi x10,x10,4
	
	li s9,-1698
	
	li x8,97
	beq x5,x8,addo	
	
	li x8,115
	beq x5,x8,subo
	
	li x8,109
	beq x5,x8,mulo
	
	li x8,100
	beq x5,x8,divo
	
	b wrong
	
addo:
	
	li s10,5
	
	jal str2int
	mv t4,a0

	
	beq a0,s9,wrong
	
	la x10,equation
	add x10,x10,s10
	
	jal str2int
	mv t3,a0
	
	beq a0,s9,wrong
	
	add a0,t4,t3
	
	jal x0,exit
	
subo:
	
	li s10,5
	
	jal str2int
	mv t4,a0
	
	beq a0,s9,wrong
	
	la x10,equation
	add x10,x10,s10
	
	jal str2int
	mv t3,a0
	
	beq a0,s9,wrong
	
	sub a0,t4,t3
	
	jal x0,exit
	
mulo:
	li s10,5
	
	jal str2int
	mv t4,a0
	
	beq a0,s9,wrong
	
	la x10,equation
	add x10,x10,s10
	
	jal str2int
	mv t3,a0
	
	beq a0,s9,wrong
	
	mul a0,t4,t3
	
	jal x0,exit
	
divo:
	li s10,5
	
	jal str2int
	mv t4,a0
	
	beq a0,s9,wrong
	
	la x10,equation
	add x10,x10,s10
	
	jal str2int
	mv t3,a0
	
	beq a0,s9,wrong
	
	div a0,t4,t3
	
	jal x0,exit

wrong:	
	li a0,-1

exit:
	li a7,1
	ecall
 
	li a7,10
	ecall
                        

str2int: 

	lb x5, 0(x10)
	
	li x8,43           
	beq x5, x8, plus 
	           
	li x8,45           
	beq x5, x8, minus      
	     
	jal x0, so         

      

plus:

	li x19,0                
	addi x10,x10,1          
	addi s10,s10,1
	jal,x0, so 

minus:

	li x19,1               
	addi x10,x10,1          
	addi s10,s10,1
	  

so:
	li x18,10          
	li x9,0          
	
wow:
	
	lb x5,0(x10)            
	beq x5,x0,sk      
	li t6,32
	beq x5,t6,sk       
	li t6,10
	beq x5,t6,sk       
	li x8,48           
	blt x5, x8,ero         
	li x8,58           
	bge x5, x8,ero         
	addi x5,x5,-48           
	mul x9,x9,x18           
	add x9,x9,x5            
	addi x10,x10,1          
	addi s10,s10,1
	jal x0,wow               

ero:

	addi x10, x0,-1698         
	b retu                

sk:

	beq x19,x0,hu      
	neg x9,x9               

hu:

	mv x10,x9               
	
retu:
	li x19,0
	jr ra                   
