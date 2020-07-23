# PRACTICA 1 #######################

	.data
	cadena: .byte -1, -1, -1, -1, -1, -1
	vec: .word 5, 6, 8, 9, 1

	.text
	.globl main
main:
	li $s0, 0
	
	while:
		li $t0, 5
		bge $s0, $t0, fi
		
		la $t0, cadena
		addu $t0, $t0, $s0
		la $t1, vec
		li $t2, 4
		subu $t2, $t2, $s0
		sll $t2, $t2, 2
		addu $t1, $t1, $t2
		lw $t1, 0($t1)
		addiu $t1, $t1, '0'
		sb $t1, 0($t0) 
		
		addiu $s0, $s0, 1
		b while
	fi:
		la $t0, cadena
		sb $zero, 5($t0)
		
		li $v0, 4
		la $a0, cadena
		syscall
		
	jr $ra		# main retorna al codi de startup

