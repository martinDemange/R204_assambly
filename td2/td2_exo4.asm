#	$s0 : the array is stored here 
#	$t0 : i an index for the array

.data
	str:	.asciiz	"T:\n"
	array:	.word	1,2,3,4,5
	N:	5							# the sizeof the array

.text
main:	
	la	$s0,	tableau
	# show thing
	la	$a0,	str					# $a0 <- str
	ori	$v0,	$zero,	4
	syscall							# syscall 4, print $a0 ( string )
	
	array_loop:
	sll	$t1,	$t0,	2			# mult by four the index for accessing element
	add	$t1,	$t1,	$s0			# $t1 became the adress WIP
	lw	$t1,	($t1)
	
	# end programm
	end:
	ori $v0, 	$zero, 	10		# set $v0 <- 10 
	syscall						# syscall 10, exit	