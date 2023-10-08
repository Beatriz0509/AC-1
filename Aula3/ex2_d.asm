# Mapa de registos: 
# value: $t0 
# bit: $t1 
# i: $t2
# flag : $t5
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
	li $t5, 0			#	flag = 0; 
while:	
	bge $t2, 32, endwhile		#	while(i < 32) {
	srl $t1, $t0, 31		#		bit = value >> 31;
if:	beq $t5, 1, if2			#		if(flag == 1 || bit != 0){
	beq $t1, 0, endif
	j if2
if2:
	li $t5, 1			#			flag = 1;	
	rem $t4, $t2, 4					
	bne $t4, 0, endif2		#			if((i % 4) == 0)
	li $v0, print_char
	li $a0, ' '
	syscall				#				print_char(' ');		
	j endif2
endif2:
	li $v0, print_char
	addi $a0, $t1, '0'			 
	syscall				#			print_char(0x30 + bit)
	j endif
endif:
	sll $t0, $t0, 1			#		value = value << 1;
	addi $t2, $t2, 1		#		i++;
	j while
endwhile:
	jr $ra				# termina o programa
