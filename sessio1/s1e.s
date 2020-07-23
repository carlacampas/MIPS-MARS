# PRACTICA 1 #######################

	.data
	A: .word 3, 5, 7
	punter: .word 0
	
	.text
	.globl main
main:
	li $s0, 0
	la $t0, A	
	addiu $t0, $t0, 8
	sw $t0,4($t0)
	
	lw $s0, 0($t0)
	addiu $s0, $s0, 2 

	lw $t1, -8($t0)
	addu $s0, $s0, $t1
	
	sw $s0, -4($t0)
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	jr $ra		# main retorna al codi de startup

