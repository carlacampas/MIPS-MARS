	.data
result: .word 0
num:	.byte '7'

	.text
	.globl main
main:
	li $s0, 0
	li $s1, ';'
	
	li $t0, 'a'
	blt $s1, $t0, con2
	li $t0, 'z' 
	ble $s1, $t0, if

	con2:
		li $t0, 'A'
		blt $s1, $t0, else
		li $t0, 'Z'
		bgt $s1, $t0, else

	if:
		move $s0, $s1
		b fi

	else:
		li $t0, '0'
		blt $s1, $t0, else1
		li $t0, '9'
		bgt  $s1, $t0,  else1
		
		li $t0, '0'
		subu $s0, $s1, $t0
		b fi
		else1:
			li $s0, -1
	fi:
	jr $ra

