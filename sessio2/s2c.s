	.data
w:        .asciiz "8754830094826456674949263746929"
resultat: .byte 0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	la	$a0, w
	li	$a1, 31
	jal	moda
	la	$s0, resultat
	sb	$v0, 0($s0)
	move	$a0, $v0
	li	$v0, 11
	syscall
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra

nofares:
	li	$t0, 0x12345678
	move	$t1, $t0
	move	$t2, $t0
	move	$t3, $t0
	move	$t4, $t0
	move 	$t5, $t0
	move	$t6, $t0
	move 	$t7, $t0
	move 	$t8, $t0
	move 	$t9, $t0
	move	$a0, $t0
	move	$a1, $t0
	move	$a2, $t0
	move	$a3, $t0
	jr	$ra


moda:
	addiu $sp, $sp, -60
	sw $s0, 40($sp)
	sw $s1, 44($sp)
	sw $s2, 48($sp)
	sw $s3, 52($sp)
	sw $ra, 56($sp)
	
	li $s0, 0 #k
	for:
		li $t0, 10
		bge $s0, $t0, fi_for
		sll $t0, $s0, 2
		addu $t0, $sp, $t0
		sw $zero, 0($t0)
		addiu $s0, $s0, 1
		b for
	fi_for:
	li $s1, '0' #max
	li $s0, 0
	move $s2, $a1
	move $s3, $a0
	for1:
		bge $s0, $s2, fi_for1
		move $a0, $sp
		addu $a1, $s3, $s0
		lb $a1, 0($a1)
		li $t0, '0'
		subu $a1, $a1, $t0
		subu $a2, $s1, $t0
		jal update
		addiu $s1, $v0, '0'
		addiu $s0, $s0, 1
		b for1
	fi_for1:
	move $v0, $s1
	lw $s0, 40($sp)
	lw $s1, 44($sp)
	lw $s2, 48($sp)
	lw $s3, 52($sp)
	lw $ra, 56($sp)
	addiu $sp, $sp, 60
	jr $ra

update:
	addiu $sp, $sp, -16
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $ra, 12($sp)
	
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2

	jal nofares
	
	sll $t0, $s1, 2
	addu $t0, $t0, $s0
	lw $t1, 0($t0)
	addiu $t1, $t1, 1
	sw $t1, 0($t0)
	
	sll $t0, $s2, 2
	addu $t0, $t0, $s0
	lw $t0, 0($t0)
	
	ble $t1, $t0, else
	move $v0, $s1
	b fi
	else:
		move $v0, $s2
	fi:		
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $ra, 12($sp)
	addiu $sp, $sp, 16
	jr $ra

