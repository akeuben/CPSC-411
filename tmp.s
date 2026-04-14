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
	addi $sp, $sp, -4
	sw $ra, 0($sp)
.data
L2:
.byte 17, 115, 104, 111, 117, 108, 100, 32, 110, 111, 116, 32, 112, 114, 105, 110, 116, 10
.text
	la $s6, L2
	move $a0, $s6
	jal sym1
	move $s6, $v0
	li $s6, 1
	move $v0, $s6
	j L1
.data
L3:
.byte 59, 101, 114, 114, 111, 114, 58, 32, 102, 117, 110, 99, 116, 105, 111, 110, 32, 116, 101, 115, 116, 32, 109, 117, 115, 116, 32, 114, 101, 116, 117, 114, 110, 32, 97, 32, 118, 97, 108, 117, 101, 32, 97, 116, 32, 111, 114, 32, 110, 101, 97, 114, 32, 108, 105, 110, 101, 32, 49, 10
.text
	la $a0, L3
	jal sym1
	jal sym6
L1:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
main:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $zero, 4($sp)
	li $s6, 1
	move $s6, $s6
	bne $s6, $zero, L5
	addi $sp, $sp, -4
	sw $s6, 0($sp)
	jal sym7
	addi $sp, $sp, 4
	lw $s6, 0($sp)
	move $s5, $v0
	move $s6, $s5
L5:
	sw $s6, 4($sp)
	lw $s6, 4($sp)
	move $a0, $s6
	jal sym3
	move $s6, $v0
L4:
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jal sym6
