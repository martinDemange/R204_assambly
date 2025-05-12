#	$a0 :	where the array save is stored
#	$a1 : 	the var k, that represent what is searched
#	$a2 :	the var rang, that represent the size and a limit for the loop in Recherche

# return the index of the element researched in the array save
#	int Recherche (int save[], int k, int rang) { 
#		unsigned i;
#		for(i=0; i <= rang && save[i] != k; ++i) {};
#		return i;
#	} 					// Recherche()
#
#	int main (void) {
#		int rangmax=9;
#		int save [] = {0, 0, 0, 0, 0, 0, 0, 1, 2, 3};
#		cout << Recherche (save, 1, rangmax);
#		return 0;
#	} 					// main()

.data
	save :	.word	0, 0, 0, 0, 0, 0, 0, 1, 2, 3
	
	
.text
main : 	
	la	$a0,	save					# load save in $a0
	ori	$a1,	$zero,	1				# set $a1 to 1, k = 1
	ori	$a2,	$zero,	9				# set $a2 to 9, rang = 9
	jal recherche
	# print the value stored in $t1
	or	$a0,	$zero,	$v0				# put the value of $v0 in $a0
	ori	$v0,	$zero,	1				# $v0 <- 1
	syscall								# syscall 1, print $a0 ( integer )
	# end programm
	end:
	ori $v0, 	$zero, 	10				# set $v0 <- 10 
	syscall								# syscall 10, exit		

recherche :
	# 								param of recherche  
	#	$a0 :	where the array save is stored
	#	$a1 : 	the var k, that represent what is searched
	#	$a2 :	the var rang, that represent the size and a limit for the loop in Recherche
	#								register used
	#	$s0 : the index
	#	$t1	: the index but it is mult by 4 so it can be used 
	#	$t2 : where the output of slt is stored
	#	$t3	: where the output of another logical test
	
	
	or	$s0,	$zero,	$zero			# init $t0, the index as 0, $t0 is the index
	array_loop :
		# condition of the for loop and break of the loop
		slt	$t2,	$t0,	$a2			# if ($t0 < $a2) $t2=1; else $t2=0 // i <= rang
		bne	$t1,	$a1,	array_loop	# if $t1 != $a2 then jum to array_loop // save[i] != k;
	
		# reading of the array
		sll	$t1,	$t0,	2			# mult by four the index for accessing element
		add	$t1,	$t1,	$a0			# $t1 became the adress of the new index
		lw	$t1,	($t1)				# replace by load word the adress by its contents
		
		# increment the index by one
		addi	$t0,	$t0,	1		# $t0 = $t0 + 1
		
		# jum to array_loop for contuning the loop
		j array_loop					# jum to array_loop	
	exit_loop :	
		# made to exit the loop, of type for in this case
		or	$v0,	$zero,	$s0			# put the index in $v0 // return 1
		j	$ra							# jump to the jum register // return i
		
	