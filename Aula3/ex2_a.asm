# Mapa de registos: 
# value: $t0 
# bit: $t1 
# i: $t2
	.data
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nO valor em binario e: "
	.eqv print_str, 4
	.eqv read_int, 5
	.eqv print_char, 11
	.text
	.globl main
main:					# void main(void) {
	la $a0, str1
	li $v0, 4
	syscall				# 	print_str("Introduza um numero");
	li $v0, 5
	syscall			
	move $t0, $v0			#	value = read_int();
	la $a0, str2
	li $v0, 4
	syscall				#	print_str("\nO valor em binario e: ");
	li $t2, 0			#	i = 0;
while:	
	bge $t2, 32, endwhile		#	while(i < 32) {
	li $t3, 0x80000000
	and $t1, $t0, $t3		#		bit = value & 0x8000000;
if:
	beq $t1, $0, else		#		if(bit != 0) {
	li $v0, print_char
	li $a0, '1'
	syscall				#			print_char('1');
	j endif
else:					#		else
	li $v0, print_char
	li $a0, '0'			#			print_char('0');
	syscall	
endif:
	sll $t0, $t0, 1			#		value = value << 1;
	addi $t2, $t2, 1		#		i++;
	j while
endwhile:				#	}
	jr $ra				#  termina o programa