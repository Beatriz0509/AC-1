	.data
str1:	.asciiz "Introduza 2 numeros "
str2:	.asciiz "A soma dos dois numeros é: "
	.eqv print_str, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	.text
	.globl main
main:
	la $a0, str1			# $a0 = str1
	ori $v0, $0, print_str		# $v0 = 4 = print_str
	syscall				# print_str(str1)
	ori $v0, $0, read_int		# $v0 = 5 = read_int
	syscall				# read_int()
	move $t0, $v0			# $t0 = a = read_int
	ori $v0, $0, read_int		# $v0 = 5 = read_int
	syscall				# read_int()
	move $t1, $v0			# $t1 = b = read_int()
	la $a0, str2			# $a0 = str2
	ori $v0, $0, print_str		# $v0 = 4 = print_str
	syscall				# print_str(str2)
	add $t2, $t0, $t1		# $t2 = a + b 
	move $a0, $t2			# $a0 = $t2 = a + b
	ori $v0, $0, print_int10	# $v0 = 4 = print_str
	syscall				# print_int10(a + b)
	
	jr $ra				# fim do programa
