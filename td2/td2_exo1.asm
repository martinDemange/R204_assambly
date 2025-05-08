# exo1
	.data
str:	.asciiz	"Ceci est une chaine de caracteres en ascii \n"	# set the string
	.text
main:
	ori	$v0, $zero, 4	# $v0 <- 4 ( by doing 0 + 4 = 4, the code 4 is for print string
	la	$a0, str	# load str in $a0
	syscall			# print str
	
	ori	$v0, $zero, 10	# $v0 <- 10, the code 10 is for terminating the code
	syscall
	