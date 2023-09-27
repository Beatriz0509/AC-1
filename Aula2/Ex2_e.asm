	.data
	.text
	.globl main
main:	ori $t0,$0,2	   	# substituir gray pelo valor desejado
	move $t1, $t0 		# $t1 = num = $t0 = gray 
	srl $a3,$t1,4  		# $a3 = $t1 >> 4
	xor $t1,$t1,$a3		# $t1 = $t1 ^ ($t1 >> 4)
	srl $a2,$t1,2  		# $a2 = $t1 >> 2
	xor $t1,$t1,$a2 	# $t1 = $t1 ^ ($t1 >> 2)
	srl $a1,$t1,1  		# $a3 = $t1 >> 1
	xor $t1,$t1,$a1		# $t1 = $t1 ^ ($t1 >> 1)
	move $t2, $t1		# $t2 = bin = $t1 = num
	
	jr $ra