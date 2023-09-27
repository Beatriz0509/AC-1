	.data
	.text
	.globl main
main:	ori $t0, $0, 2		# $t0 = bin = 2
	srl $t1, $t0, 1		# $t1 = bin >> 1
	xor $t1, $t0, $t1 	# $t1 = bin ^ (bin >> 1)
	
	jr $ra