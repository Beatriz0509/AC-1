# Mapa de registos 
# P: $t0 
# pultimo: $t1 
# *p: $t2 
# soma: $t3	
	.data
array:	.word 7692, 23, 5, 234
	.eqv SIZE, 4
	.eqv print_int10, 1
	.text
	.globl main
main:
	li $t3, 0		# int soma = 0;
	la $t0, array		# p = array;
	li $t4, SIZE
	addi $t4, $t4, -1
	mul $t4, $t4, 4		
	addu $t1, $t0, $t4	# pultimo = array + SIZE-1
while:
	bgtu $t0, $t1, endwhile	# while (p <= pultimo) {
	lw $t2, 0($t0)		# int *p;
	add $t3, $t3, $t2	#	soma = soma + (*p);
	addiu $t0, $t0, 4	#	p++; (4 pq é inteiro)
	j while
endwhile:
	move $a0, $t3
	li $v0, print_int10
	syscall
	jr $ra
	
	
