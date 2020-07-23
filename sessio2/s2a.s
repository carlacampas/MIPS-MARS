.data
a: .byte 'A', 'a', 'B', 'b', 0
b: .half 0, -25, 275
c: .byte '3'
d: .word 345
e: .word 0x10010008
	.text
	.globl main
main:
la $t0, e
lw $t1, 0($t0)
lh $t2, 0($t1)
lh $t3, 2($t1)
xor $t1, $t2, $t3