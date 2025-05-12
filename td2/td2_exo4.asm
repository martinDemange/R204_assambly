#	$s0 : the array is stored here 
#	$t0 : i an index for the array
	
.data
	str:	.asciiz	"T:\n"
	setw:	.asciiz	"  "
	array:	.word	1,2,3,4,5
	N:		.word 	5				# the sizeof the array
	
.text
main:	
	la	$s0,	array				# load array in $s0
	lw	$s1,	N					# load N in $s1
	or	$t0,	$zero,	$zero		# init $t0, the index as 0
	
	
	# show thing
	la	$a0,	str					# $a0 <- str
	ori	$v0,	$zero,	4
	syscall							# syscall 4, print $a0 ( string )
	
	
	array_loop:						# act like a for loop
	# jum to array_loop for contining the loop
	beq	$t0,	$s1,	end			# if $t0 == $s1 then jum to end
	
	sll	$t1,	$t0,	2			# mult by four the index for accessing element
	add	$t1,	$t1,	$s0			# $t1 became the adress of the new index
	lw	$t1,	($t1)				# replace by lw the adress by its contents
	
	# print of stwe(3) : set the wiht of the result as 3
	# since the value in the array take one space, we need to print 2 spaces
	la	$a0,	setw				# $a0 <- str
	ori	$v0,	$zero,	4
	syscall							# syscall 4, print $a0 ( string )	
	
	# print the value stored in $t1
	or	$a0,	$zero,	$t1			# put the value of $t1 in $a0
	ori	$v0,	$zero,	1
	syscall							# syscall 1, print $a0 ( integer )
	
	# increment the index by one
	addi	$t0,	$t0,	1		# $t0 = $t0 + 1
	j array_loop					# jum to array_loop
	 
	# end programm
	end:
	ori $v0, 	$zero, 	10		# set $v0 <- 10 
	syscall						# syscall 10, exit	
	
