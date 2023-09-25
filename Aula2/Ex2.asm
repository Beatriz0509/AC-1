	.data
	.eqv imm, 1
	.text
	.globl main
main:	li $t0, 0x12345678
	
	sll $t2, $t0, imm		# $t2 = $t0 << 1
	srl $t3, $t0, imm		# $t3 = $t0 >> 1
	sra $t4, $t0, imm		# $t4 = $t0 \ 2 
	
	jr $ra