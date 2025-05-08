#	$v0 : contain the sys code and if sys code 5 contain the user input
# 	$t0 : cntain the variable integer Somme

.data
	invite:	.asciiz	"\nEntre un entier ( 0 pour arreté ): "
	result:	.asciiz	"\nSomme = "
	
.text
main :
	or	$t0,	$zero, 	$zero
	loop:
	#Invite
	la	$a0,	invite				# put invite in $a0
	ori	$v0,	$zero,	4
	syscall							# syscall 4, print string in $a0 ( invite )
	
	# read input
	ori	$v0,	$zero,	5
	syscall							# syscall 5, read user input
	
	# somme is stored in $t0  
	# somme += [ input_user ]
	beq	$v0,	$zero,	end_loop	# if input_user ( $v0 ) == 0 then go to end_loop
	add	$t0,	$t0,	$v0			# somme = somme + [ input_user ]	// input is stored in $v0
	j	loop						# go to loop
	
	end_loop:
	# show result
	la	$a0,	result
	ori	$v0,	$zero,	4
	syscall							# syscall 4, print $a0 ( string )
	
	or	$a0,	$zero,	$t0			# put somme in $a0
	ori	$v0,	$zero,	1
	syscall							# syscall 1, print $a0 ( int )
	
	# end programm
	ori $v0, 	$zero, 	10		# set $v0 <- 10 
	syscall						# syscall 10, exit	