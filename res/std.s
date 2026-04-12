.text

Lgetchar:
	li $v0, 12
	syscall
	jr $ra

Lhalt:
	li $v0, 10
	syscall

Lprintb:
	li $v0, 4
	bne $a0, $zero, STDL1
.data
strfalse: .asciiz "false"
strtrue: .asciiz "true"
.text
	la $a0, strfalse
	b STDL2
STDL1:
	la $a0, strtrue
STDL2:
	syscall
	jr $ra

Lprintc:
	li $v0, 11
	syscall
	jr $ra

Lprinti:
	li $v0, 1
	syscall
	jr $ra

Lprints:
	li $v0, 11
	lb $s0, 0($a0)
	move $s1, $a0		# Store the current address in s1
	b STDL4			# goto the loop
STDL3:
	addi $s1, $s1, 1	# add to the address
	sub $s0, $s0, 1	# subtract one from the count
	lb $a0, 0($s1)
	syscall 
STDL4:				# loop conditional
	bne $s0, $zero, STDL3
	jr $ra
