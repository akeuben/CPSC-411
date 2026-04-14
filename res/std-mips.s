.data 
divzeromsg: 
    .byte 24 
    .ascii "error: division by zero\n"

.text
handledivzero:
    la $a0, divzeromsg
    jal sym1
    jal sym6
    jr $ra

sym5:
	li $v0, 12
    syscall
    move $a0, $v0
    li $v0, 1 
    syscall
    move $v0, $a0
	jr $ra

STDL0:
    li $v0, -1 
    jr $ra

sym6:
	li $v0, 10
	syscall

sym3:
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

sym4:
	li $v0, 11
	syscall
	jr $ra

sym2:
	li $v0, 1
	syscall
	jr $ra

sym1:
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
