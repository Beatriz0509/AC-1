	.data
	
	.text
	.globl main
	
main:	ori $t0, $0, 3		# $t0 = val_x
	ori $t2, $0, 8		# $t2 = 8
	add $t1, $t0, $t0	# $t1 = $t0 + $t0 = x + x
	sub $t1, $t1, $t2	# $t2 = $t1 + $t2 = 2x - 8
	
	jr  $ra			# termina o programa