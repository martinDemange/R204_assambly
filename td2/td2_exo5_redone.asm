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
	save:	.word	0, 0, 0, 0, 0, 0, 0, 1, 2, 3
	
.text
main:
	lw	$a0,	save			# store the array in $a0
	ori	$a1,	1				# store in $a1 the int researched
	ori	$a2,	9				# store the max size of the search zone
	jal	Recherche				# goto Recheche and return here if instructed in 
								# Recherche
	# print the result of Recherche
	ori	$v0,	$zero,	5		# $v0 -> 0 + 5
	syscall						# print int
	# end programme
	ori	$v0,	$zero,	$zero	# $v0 -> 0 + 0
	syscall						# syscall 0, end programme

Recherche:
	# This function search in the array stored in $a0 the value in $a1, return the 
	# index, and stop if the index reach the value in $a2
	# Register for arguments :
	#	$a0 :	the array
	#	$a1 :	the value researched
	#	$a2 :	the max value for the index
	# Register :
	#	$s0:	the index
	#	$t0 : 	where the result of the bool test is stored
	
	or	$s0,	$zero,	$zero	# init the index to 0 in $s0
	# start the array loop, this loop is a for, where:
	#	i 	:	the index
	#	save:	the array
	#	rang:	the limit of the search zone, the max value of the index ( def as 9 )
	#	k	:	the value searched
	# for(i=0; i <= rang && save[i] != k; ++i){}
	array_loop:
		 slt	$t0,	$s0,	$a2		# if $s0 < $a2, put result in $t0, i < rang 
		 
	# [to finish ]