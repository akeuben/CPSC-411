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
main:
	addi $sp, $sp, -16
	sw $ra, 0($sp)
	sw $zero, 4($sp)
	sw $zero, 8($sp)
	sw $zero, 12($sp)
	li $s6, 1
	sw $s6, 4($sp)
	j L2
L3:
	lw $s6, 4($sp)
	li $s5, 3
	div $s6, $s5
	mfhi $s6
	li $s5, 0
	beq $s6, $s5, L4
	li $s5, 0
	j L5
L4:
	li $s5, 1
L5:
	sw $s5, 8($sp)
	lw $s5, 4($sp)
	li $s6, 5
	div $s5, $s6
	mfhi $s5
	li $s6, 0
	beq $s5, $s6, L6
	li $s6, 0
	j L7
L6:
	li $s6, 1
L7:
	sw $s6, 12($sp)
	lw $s6, 8($sp)
	beq $s6, $zero, L8
.data
L9:
.byte 4, 102, 105, 122, 122
.text
	la $s6, L9
	move $a0, $s6
	jal sym1
	move $s6, $v0
L8:
	lw $s6, 12($sp)
	beq $s6, $zero, L10
.data
L11:
.byte 4, 98, 117, 122, 122
.text
	la $s6, L11
	move $a0, $s6
	jal sym1
	move $s6, $v0
L10:
	lw $s5, 8($sp)
	beq $s5, $zero, L14
	li $s5, 0
	b L15
L14:
	li $s5, 1
L15:
	move $s6, $s5
	beq $s6, $zero, L13
	lw $s5, 12($sp)
	beq $s5, $zero, L16
	li $s5, 0
	b L17
L16:
	li $s5, 1
L17:
	move $s6, $s5
L13:
	beq $s6, $zero, L12
	lw $s6, 4($sp)
	move $a0, $s6
	jal sym2
	move $s6, $v0
L12:
	lw $s6, 4($sp)
	li $s5, 35
	bne $s6, $s5, L19
	li $s5, 0
	j L20
L19:
	li $s5, 1
L20:
	beq $s5, $zero, L18
.data
L21:
.byte 2, 44, 32
.text
	la $s5, L21
	move $a0, $s5
	jal sym1
	move $s5, $v0
L18:
	lw $s5, 4($sp)
	li $s6, 1
	add $s5, $s5, $s6
	sw $s5, 4($sp)
L2:
	lw $s5, 4($sp)
	li $s6, 36
	blt $s5, $s6, L22
	li $s6, 0
	j L23
L22:
	li $s6, 1
L23:
	bne $s6, $zero, L3
	li $s6, 10
	move $a0, $s6
	jal sym4
	move $s6, $v0
L1:
	lw $ra, 0($sp)
	addi $sp, $sp, 16
	jal sym6
