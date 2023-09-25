	.data
	.eqv print_hex, 34
	.text
	.globl main
main:	ori	$t0, $0, 0xe543		# $t0 = val_1
	xori 	$t1, $t0, 0xFFFF	# 0xFFFF mascara a aplicar 
	
	or $a0, $0, $t1			# $a0 = $t1
	ori $v0 , $0, print_hex	# $v0 = print_int10()
	syscall
	
	jr $ra