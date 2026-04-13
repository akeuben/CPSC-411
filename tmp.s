.text

sym5:
	li $v0, 12
	syscall
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

.text
sym7:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
.data
L1:
.byte 21, 87, 101, 32, 104, 97, 118, 101, 32, 116, 104, 101, 32, 105, 110, 116, 101, 103, 101, 114, 58, 32
.text
	la $s6, L1
	move $a0, $s6
	jal sym1
	lw $s6, 4($sp)
	move $a0, $s6
	jal sym2
.data
L2:
.byte 1, 10
.text
	la $s6, L2
	move $a0, $s6
	jal sym1
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra
main:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $zero, 4($sp)
.data
L3:
.byte 14, 72, 101, 108, 108, 111, 44, 32, 119, 111, 114, 108, 100, 33, 10
.text
	la $s6, L3
	move $a0, $s6
	jal sym1
	lw $s6, 4($sp)
	li $s5, 5
	li $s4, 1
	add $s5, $s5, $s4
	move $a0, $s5
	jal sym7
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra
	jal sym6
