	# Sessio 3

	.data 
# Declara aqui les variables mat1, mat4 i col
mat1: .space 120
mat4: .word 2, 3, 1, 2, 4, 3
col: .word 2

	.text 
	.globl main
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, mat4
	lw $a1, 8($a0)
	la $a2, col
	lw $a2 0($a2)
	jal subr
	
	la $t0, mat1
	sw $v0, 108($t0)
	
	la $a0, mat4
	li $a1, 1
	li $a2, 1
	jal subr
	
	la $t0, mat1
	sw $v0, 0($t0)
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
subr:
	li $t0, 3
	mult $a1,$t0
	mflo $t0
	addu $t0, $t0, $a2
	sll $t0, $t0, 2
	addu $t0, $t0, $a0 
	lw $t0, 0($t0)
	
	li $t1, 24
	mult $a2, $t1
	mflo $t1
	la $t2, mat1
	addu $t1, $t1, $t2
	sw $t0, 20($t1)
	
	move $v0, $a1
	jr $ra



