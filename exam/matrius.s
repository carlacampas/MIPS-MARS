.data

A: .word    2,-1,-1,-2,
            1,-4, 0, 0,
            1, 2, 8, 2,
            0, 4,-2, 3                                                                    

.text
.globl main
main:
	li $s0, 0 #i = 0
	la $s2, A #A(i)
	fori: 
		li $t0, 4 
		bge $s0, $t0, fi_fori #comprovem i < 4
		addiu $s1, $s0, 1 # j = i + 1
		forj:
			li $t0, 4
			bge $s1, $t0, fi_forj #comprovem j < 4
			
			sll $t0, $s1, 2 # carguem la adreça corresponent a A(i)(j)
			addu $t0, $s2, $t0
			lw $t0, 0($t0) #inicialitzem la suma amb A(i)(j)
			
			sll $t1, $s1, 2 #carguem la adreça corresponent a A(j)(i)
			addu $t1, $t1, $s0
			sll $t1, $t1, 2 
			la $t2, A
			addu $t1, $t1, $t2
			
			ble $t0, $zero, fi_if 
			lw $t2, 0($t1) #si mes gran que 0 tambe carreguem a la suma A(j)(i)
			addu $t0, $t0, $t2
			fi_if:
			sw $t0, 0($t1) #A(j)(i) = suma
			
			addiu $s1, $s1, 1
			b forj	
		fi_forj:
		addiu $s0, $s0, 1
		addiu $s2, $s2, 16 #afegim 16 a la posicio de A(i) per fer A (i+1)
		b fori
	fi_fori:
      	jr  $ra 

