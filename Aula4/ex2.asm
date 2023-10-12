# Mapa de registos 
# num: $t0 
# p: $t1 
# *p : $t2 

	.data
	.eqv SIZE, 20
	.eqv read_string, 8
	.eqv print_int10, 1
str:	.space 21
	.text
	.globl main
main:
	la	$a0, str
	li 	$a1, SIZE		# $a1 = SIZE;
	li 	$t0, 0			# num = 0;
	li 	$v0, read_string	
	syscall				# read_string(str, SIZE)
	la $t1, str			# 	p = str;
while:					# while() {
	lb $t2 , 0($t1)			# 	char *p = str[i];
	beq $t2, $0, endw		# 	if (*p == '\0') break;
if:
	blt $t2, '0', endif
	bgt $t2, '9', endif		#		if (tmp >= '0' && tmp <= '9') {
	addi $t0, $t0, 1		# 			num++;
endif:
	addiu $t1, $t1, 1		#		p++;
	j while				# }
endw:	
	li $v0, print_int10	
	move $a0, $t0			
	syscall				# print_int10(num);
	li $v0, 0
	jr $ra
	 
	
