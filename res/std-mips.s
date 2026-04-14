.data
lstread:
    .word -2
.text
divmodchk:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	lw $s6, 8($sp)
	li $s5, 0
	beq $s6, $s5, DMC3
	li $s5, 0
	j DMC4
DMC3:
	li $s5, 1
DMC4:
	beq $s5, $zero, DMC2
.data
DMC5:
.byte 24, 101, 114, 114, 111, 114, 58, 32, 100, 105, 118, 105, 115, 105, 111, 110, 32, 98, 121, 32, 122, 101, 114, 111, 10
.text
	la $s5, DMC5
	move $a0, $s5
	jal sym1
    li $v0, 17
    li $a0, 1 
    syscall
DMC2:
	lw $s6, 4($sp)
	li $s4, -2147483648
	beq $s6, $s4, DMC8
	li $s4, 0
	j DMC9
DMC8:
	li $s4, 1
DMC9:
	move $s5, $s4
	beq $s5, $zero, DMC7
	lw $s4, 8($sp)
	li $s6, -1
	beq $s4, $s6, DMC10
	li $s6, 0
	j DMC11
DMC10:
	li $s6, 1
DMC11:
	move $s5, $s6
DMC7:
	beq $s5, $zero, DMC6
	li $s5, 1
	move $v0, $s5
	j DMC1
DMC6:
	lw $s5, 8($sp)
	move $v0, $s5
	j DMC1
.data
DMC12:
.byte 40, 102, 117, 110, 99, 116, 105, 111, 110, 32, 39, 100, 105, 118, 109, 111, 100, 99, 104, 107, 39, 32, 109, 117, 115, 116, 32, 114, 101, 116, 117, 114, 110, 32, 97, 32, 118, 97, 108, 117, 101
.text
	la $a0, DMC12
	jal sym1
	jal sym6
DMC1:
	lw $ra, 0($sp)
	addi $sp, $sp, 12
	jr $ra

sym5:
	li $v0, 12
    syscall
    li $t0, 10
    bne $v0, $t0, STDL0
    lw $t1, lstread 
    bne $t1, $t0, STDL0 
    li $v0, -1
	jr $ra

STDL0:
    sw $v0, lstread 
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
