	.data
	.eqv print_hex, 34
str1:	.asciiz "\n"
	.text
	.globl main
main:	ori	$t0, $0, 0x5c1b		# $t0 = val_1
	ori 	$t1, $0, 0xa3e4		# $t1 = val_2
	and 	$t2, $t0, $t1		# $t2 = $t0 & $t1 
	or 	$t3, $t0, $t1		# $t3 = $t0 | $t1
	nor	$t4, $t0, $t1		# $t4 = ~( $t0 | $t1)
	xor	$t5, $t0, $t1		# $t5 = $t0 ^ $t1
	
	or $a0, $0, $t2			# $a0 = $t2
	ori $v0 , $0, print_hex	# $v0 = print_int10()
	syscall	
	
	la $a0, str1
	ori $v0, $0, 4
	syscall
	
	or $a0, $0, $t3			# $a0 = $t3
	ori $v0 , $0, print_hex	# $v0 = print_int10()
	syscall	
	
	la $a0, str1
	ori $v0, $0, 4
	syscall
	
	or $a0, $0, $t4			# $a0 = $t4
	ori $v0 , $0, print_hex	# $v0 = print_int10()
	syscall
	
	la $a0, str1
	ori $v0, $0, 4
	syscall
	
	or $a0, $0, $t5			# $a0 = $t5
	ori $v0 , $0, print_hex	# $v0 = print_int10()
	syscall
	
	jr $ra
		
