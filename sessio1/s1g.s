# PRACTICA 1 #######################

	.data
	fib: .space 40

	.text
	.globl main
main:
	li $s0, 2
	la $s1, fib
	sw $zero, 0($s1)
	li $t1, 1
	sw $t1, 4($s1)
	while:
		slti $t0, $s0, 10
		beq $t0, $zero, fi
		
		sll $t1, $s0, 2
		addu $t1, $s1, $t1
		lw $t2, -4($t1)
		lw $t3, -8($t1)
		addu $t2, $t2, $t3
		sw $t2, 0($t1)
		
		addiu $s0, $s0, 1
		b while
	fi: 
		jr $ra		# main retorna al codi de startup

