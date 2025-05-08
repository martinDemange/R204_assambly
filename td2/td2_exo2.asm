#exo2
	.data
	invite: 	.asciiz		"\nEntre une valeur ( int ) : "
	
	.text
main :
	ori	$t0,	$zero,	2		# $t0 <- 2 ( by 0 + 2 = 2 )
e1: 	
	# print invite
	ori $v0,	$zero,	4		
	la	$a0,	invite			# put the string invite in $a0 for printing
	syscall						# syscall 4, print string invite
	
	# read user input
	ori	$v0,	$zero,	5		# start e1, which do : $v0 <- 5
	syscall						# syscall 5 ( read_int in $v0 ), read the input of the user
	
	
	# print the result ( int )
	or 	$a0, 	$zero,	$v0		# $a0 <- $v0 => $a0 
	sll	$a0,	$a0,	1		# mult by 2 by displacing of one bit the value ( the value is in binary ) 
	ori	$v0, 	$zero,	1		# $v0 <- 1 ( by  0 + 1 = 1 ) 
	syscall						# syscall 1, print int, so print $a0

	bne	$a0,	100,	e1		# if $a0 is not eqaul to 100 ,we gotot e1
	ori $v0, 	$zero, 	10		# if $a0 = 100 then we set $v0 <- 10 
	syscall						# syscall 10, exit

# this code is a loop that mult a value ( 5 at the start ) by 2 but stop if the result is equals to 100

# we can replace mult by sll since we are doing a mult by 2 and in binary a mult by 2 can be describe by 
# shiffting to the left by one bit so we have : 
#	sll	$a0,	$a0,	,1
#