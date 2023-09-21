	.data
str1:	.asciiz "\n"
	.text
	.globl main
	
main:	ori $v0, $0, 5		# $v0 = read_int()
	syscall			# a system call read_int() é chamada 
	or $t0, $0, $v0		# $t0 = $v0 (valor lido do teclado)
	
	ori $t2, $0, 8		# $t2 = 8
	add $t1, $t0, $t0	# $t1 = $t0 + $t0 = x + x
	sub $t1, $t1, $t2	# $t2 = $t1 + $t2 = 2x - 8
	
	or $a0, $0, $t1		# $a0 = $t1
	ori $v0 , $0, 1		# $v0 = print_int10()
	syscall			# chamada ao syscall "print_int10()"
	
	la $a0, str1
	ori $v0, $0, 4
	syscall
	
	or $a0, $0, $t1	
	ori $v0 , $0, 34	# $v0 = print_int16()
	syscall			# chamada ao syscall "print_int16()"
	
	la $a0, str1
	ori $v0, $0, 4
	syscall
	
	or $a0, $0, $t1	
	ori $v0 , $0, 36	# $v0 = print_intu10()
	syscall			# chamada ao syscall "print_intu10()"
	
	jr  $ra			# termina o programa
	