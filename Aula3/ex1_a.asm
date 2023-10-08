# Mapa de registos: 
# soma: $t0 
# value: $t1 
# i: $t2 
	.data
	.eqv read_int, 5
	.eqv print_str, 4
	.eqv print_int10, 1
str1:	.asciiz "Introduza um numero"
str2:	.asciiz "Valor ignorado\n"
str3:	.asciiz "A soma dos positivos e: "
	.text
	.globl main
main:					# void main(void) {
	li $t2, 0			# 	$t2 = i = 0;
	li $t0, 0			# 	$t0 = soma = 0;
	
while:	bge $t2, 5, endw		# 	while(i < 5) {
	li $v0, print_str		
	la $a0, str1
	syscall				#		print_str("Introduza um numero");
	li $v0, read_int
	syscall				#		value = read_int();
	move $t1, $v0
if:
	ble $t1, $0, else		#		if (value > 0) {
	add $t0, $t0, $t1		#			soma = soma + value;
	j endif
else:					#		else
	li $v0, print_str		
	la $a0, str2
	syscall				#			print_str("Valor ignorado\n")		
endif:	
	addi $t2, $t2, 1		#		i++ ;
	j while
endw:					#	}
	li $v0, print_str		
	la $a0, str3
	syscall				#	print_str("A soma dos positivos e: ")
	li $v0, print_int10
	move $a0, $t0
	syscall				#	print_int10(soma);
	
	jr $ra				#	termina o programa
		
