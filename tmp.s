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

.data
sym7: .word 0
sym8: .word 0
sym9: .word 0
sym10: .word 0
sym11: .word 0
sym12: .word 0
sym13: .word 0
sym14: .word 0
sym15: .word 0
sym16: .word 0
sym17: .word 0
sym18: .word 0
sym19: .word 0
sym20: .word 0
sym21: .word 0
sym22: .word 0
.text
main:
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	li $s6, 1
	move $a0, $s6
	jal sym26
	move $s6, $v0
	li $s6, 0
	sw $s6, 4($sp)
	j L2
L3:
	lw $s6, 4($sp)
	li $s5, 0
	beq $s6, $s5, L7
	li $s5, 0
	j L8
L7:
	li $s5, 1
L8:
	beq $s5, $zero, L6
	jal sym27
	move $s5, $v0
	li $s6, 100
# save registers
	addi $sp, $sp, -4
	sw $s5, 0($sp)
# save registers
	move $a0, $s5
	move $a1, $s6
	jal divmodchk
# restore registers
	lw $s5, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s5, $s5, $v0
	sw $s5, sym7
	j L5
L6:
	lw $s5, 4($sp)
	li $s6, 1
	beq $s5, $s6, L11
	li $s6, 0
	j L12
L11:
	li $s6, 1
L12:
	beq $s6, $zero, L10
	jal sym27
	move $s6, $v0
	li $s5, 100
# save registers
	addi $sp, $sp, -4
	sw $s6, 0($sp)
# save registers
	move $a0, $s6
	move $a1, $s5
	jal divmodchk
# restore registers
	lw $s6, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s6, $s6, $v0
	sw $s6, sym8
	j L9
L10:
	lw $s6, 4($sp)
	li $s5, 2
	beq $s6, $s5, L15
	li $s5, 0
	j L16
L15:
	li $s5, 1
L16:
	beq $s5, $zero, L14
	jal sym27
	move $s5, $v0
	li $s6, 100
# save registers
	addi $sp, $sp, -4
	sw $s5, 0($sp)
# save registers
	move $a0, $s5
	move $a1, $s6
	jal divmodchk
# restore registers
	lw $s5, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s5, $s5, $v0
	sw $s5, sym9
	j L13
L14:
	lw $s5, 4($sp)
	li $s6, 3
	beq $s5, $s6, L19
	li $s6, 0
	j L20
L19:
	li $s6, 1
L20:
	beq $s6, $zero, L18
	jal sym27
	move $s6, $v0
	li $s5, 100
# save registers
	addi $sp, $sp, -4
	sw $s6, 0($sp)
# save registers
	move $a0, $s6
	move $a1, $s5
	jal divmodchk
# restore registers
	lw $s6, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s6, $s6, $v0
	sw $s6, sym10
	j L17
L18:
	lw $s6, 4($sp)
	li $s5, 4
	beq $s6, $s5, L23
	li $s5, 0
	j L24
L23:
	li $s5, 1
L24:
	beq $s5, $zero, L22
	jal sym27
	move $s5, $v0
	li $s6, 100
# save registers
	addi $sp, $sp, -4
	sw $s5, 0($sp)
# save registers
	move $a0, $s5
	move $a1, $s6
	jal divmodchk
# restore registers
	lw $s5, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s5, $s5, $v0
	sw $s5, sym11
	j L21
L22:
	lw $s5, 4($sp)
	li $s6, 5
	beq $s5, $s6, L27
	li $s6, 0
	j L28
L27:
	li $s6, 1
L28:
	beq $s6, $zero, L26
	jal sym27
	move $s6, $v0
	li $s5, 100
# save registers
	addi $sp, $sp, -4
	sw $s6, 0($sp)
# save registers
	move $a0, $s6
	move $a1, $s5
	jal divmodchk
# restore registers
	lw $s6, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s6, $s6, $v0
	sw $s6, sym12
	j L25
L26:
	lw $s6, 4($sp)
	li $s5, 6
	beq $s6, $s5, L31
	li $s5, 0
	j L32
L31:
	li $s5, 1
L32:
	beq $s5, $zero, L30
	jal sym27
	move $s5, $v0
	li $s6, 100
# save registers
	addi $sp, $sp, -4
	sw $s5, 0($sp)
# save registers
	move $a0, $s5
	move $a1, $s6
	jal divmodchk
# restore registers
	lw $s5, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s5, $s5, $v0
	sw $s5, sym13
	j L29
L30:
	lw $s5, 4($sp)
	li $s6, 7
	beq $s5, $s6, L35
	li $s6, 0
	j L36
L35:
	li $s6, 1
L36:
	beq $s6, $zero, L34
	jal sym27
	move $s6, $v0
	li $s5, 100
# save registers
	addi $sp, $sp, -4
	sw $s6, 0($sp)
# save registers
	move $a0, $s6
	move $a1, $s5
	jal divmodchk
# restore registers
	lw $s6, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s6, $s6, $v0
	sw $s6, sym14
	j L33
L34:
	lw $s6, 4($sp)
	li $s5, 8
	beq $s6, $s5, L39
	li $s5, 0
	j L40
L39:
	li $s5, 1
L40:
	beq $s5, $zero, L38
	jal sym27
	move $s5, $v0
	li $s6, 100
# save registers
	addi $sp, $sp, -4
	sw $s5, 0($sp)
# save registers
	move $a0, $s5
	move $a1, $s6
	jal divmodchk
# restore registers
	lw $s5, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s5, $s5, $v0
	sw $s5, sym15
	j L37
L38:
	lw $s5, 4($sp)
	li $s6, 9
	beq $s5, $s6, L43
	li $s6, 0
	j L44
L43:
	li $s6, 1
L44:
	beq $s6, $zero, L42
	jal sym27
	move $s6, $v0
	li $s5, 100
# save registers
	addi $sp, $sp, -4
	sw $s6, 0($sp)
# save registers
	move $a0, $s6
	move $a1, $s5
	jal divmodchk
# restore registers
	lw $s6, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s6, $s6, $v0
	sw $s6, sym16
	j L41
L42:
	lw $s6, 4($sp)
	li $s5, 10
	beq $s6, $s5, L47
	li $s5, 0
	j L48
L47:
	li $s5, 1
L48:
	beq $s5, $zero, L46
	jal sym27
	move $s5, $v0
	li $s6, 100
# save registers
	addi $sp, $sp, -4
	sw $s5, 0($sp)
# save registers
	move $a0, $s5
	move $a1, $s6
	jal divmodchk
# restore registers
	lw $s5, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s5, $s5, $v0
	sw $s5, sym17
	j L45
L46:
	lw $s5, 4($sp)
	li $s6, 11
	beq $s5, $s6, L51
	li $s6, 0
	j L52
L51:
	li $s6, 1
L52:
	beq $s6, $zero, L50
	jal sym27
	move $s6, $v0
	li $s5, 100
# save registers
	addi $sp, $sp, -4
	sw $s6, 0($sp)
# save registers
	move $a0, $s6
	move $a1, $s5
	jal divmodchk
# restore registers
	lw $s6, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s6, $s6, $v0
	sw $s6, sym18
	j L49
L50:
	lw $s6, 4($sp)
	li $s5, 12
	beq $s6, $s5, L55
	li $s5, 0
	j L56
L55:
	li $s5, 1
L56:
	beq $s5, $zero, L54
	jal sym27
	move $s5, $v0
	li $s6, 100
# save registers
	addi $sp, $sp, -4
	sw $s5, 0($sp)
# save registers
	move $a0, $s5
	move $a1, $s6
	jal divmodchk
# restore registers
	lw $s5, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s5, $s5, $v0
	sw $s5, sym19
	j L53
L54:
	lw $s5, 4($sp)
	li $s6, 13
	beq $s5, $s6, L59
	li $s6, 0
	j L60
L59:
	li $s6, 1
L60:
	beq $s6, $zero, L58
	jal sym27
	move $s6, $v0
	li $s5, 100
# save registers
	addi $sp, $sp, -4
	sw $s6, 0($sp)
# save registers
	move $a0, $s6
	move $a1, $s5
	jal divmodchk
# restore registers
	lw $s6, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s6, $s6, $v0
	sw $s6, sym20
	j L57
L58:
	lw $s6, 4($sp)
	li $s5, 14
	beq $s6, $s5, L62
	li $s5, 0
	j L63
L62:
	li $s5, 1
L63:
	beq $s5, $zero, L61
	jal sym27
	move $s5, $v0
	li $s6, 100
# save registers
	addi $sp, $sp, -4
	sw $s5, 0($sp)
# save registers
	move $a0, $s5
	move $a1, $s6
	jal divmodchk
# restore registers
	lw $s5, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s5, $s5, $v0
	sw $s5, sym21
L61:
L57:
L53:
L49:
L45:
L41:
L37:
L33:
L29:
L25:
L21:
L17:
L13:
L9:
L5:
	lw $s5, 4($sp)
	li $s6, 1
	addu $s5, $s5, $s6
	sw $s5, 4($sp)
L2:
	lw $s5, 4($sp)
	li $s6, 14
	ble $s5, $s6, L64
	li $s6, 0
	j L65
L64:
	li $s6, 1
L65:
	bne $s6, $zero, L3
L4:
	jal sym24
	move $s6, $v0
.data
L66:
.byte 2, 67, 10
.text
	la $s6, L66
	move $a0, $s6
	jal sym1
	move $s6, $v0
	li $s6, 0
	sw $s6, 4($sp)
	j L67
    nop
    nop
    nop
L68:
    nop
    nop
    nop
    li $v0, 1
    li $a0, 20003
    syscall
.data
L70:
.byte 2, 65, 10
.text
	la $s6, L70
	move $a0, $s6
	jal sym1
	move $s6, $v0
	lw $s6, 4($sp)
	sw $s6, 16($sp)
	lw $s6, 4($sp)
	li $s5, 1
	addu $s6, $s6, $s5
	sw $s6, 8($sp)
	j L71
L72:
.data
L74:
.byte 2, 66, 10
.text
	la $s6, L74
	move $a0, $s6
	jal sym1
	move $s6, $v0
	lw $s6, 8($sp)
	li $s5, 1
	beq $s6, $s5, L77
	li $s5, 0
	j L78
L77:
	li $s5, 1
L78:
	beq $s5, $zero, L76
.data
L79:
.byte 4, 106, 61, 49, 10
.text
	la $s5, L79
	move $a0, $s5
	jal sym1
	move $s5, $v0
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L82
	li $s6, 0
	j L83
L82:
	li $s6, 1
L83:
	beq $s6, $zero, L81
	lw $s6, sym8
	lw $s5, sym7
	blt $s6, $s5, L85
	li $s5, 0
	j L86
L85:
	li $s5, 1
L86:
	beq $s5, $zero, L84
	li $s5, 1
	sw $s5, 16($sp)
L84:
	j L80
L81:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L89
	li $s6, 0
	j L90
L89:
	li $s6, 1
L90:
	beq $s6, $zero, L88
	lw $s6, sym8
	lw $s5, sym8
	blt $s6, $s5, L92
	li $s5, 0
	j L93
L92:
	li $s5, 1
L93:
	beq $s5, $zero, L91
	li $s5, 1
	sw $s5, 16($sp)
L91:
	j L87
L88:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L96
	li $s6, 0
	j L97
L96:
	li $s6, 1
L97:
	beq $s6, $zero, L95
	lw $s6, sym8
	lw $s5, sym9
	blt $s6, $s5, L99
	li $s5, 0
	j L100
L99:
	li $s5, 1
L100:
	beq $s5, $zero, L98
	li $s5, 1
	sw $s5, 16($sp)
L98:
	j L94
L95:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L103
	li $s6, 0
	j L104
L103:
	li $s6, 1
L104:
	beq $s6, $zero, L102
	lw $s6, sym8
	lw $s5, sym10
	blt $s6, $s5, L106
	li $s5, 0
	j L107
L106:
	li $s5, 1
L107:
	beq $s5, $zero, L105
	li $s5, 1
	sw $s5, 16($sp)
L105:
	j L101
L102:
	lw $s5, 16($sp)
	li $s6, 4
	beq $s5, $s6, L110
	li $s6, 0
	j L111
L110:
	li $s6, 1
L111:
	beq $s6, $zero, L109
	lw $s6, sym8
	lw $s5, sym11
	blt $s6, $s5, L113
	li $s5, 0
	j L114
L113:
	li $s5, 1
L114:
	beq $s5, $zero, L112
	li $s5, 1
	sw $s5, 16($sp)
L112:
	j L108
L109:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L117
	li $s6, 0
	j L118
L117:
	li $s6, 1
L118:
	beq $s6, $zero, L116
	lw $s6, sym8
	lw $s5, sym12
	blt $s6, $s5, L120
	li $s5, 0
	j L121
L120:
	li $s5, 1
L121:
	beq $s5, $zero, L119
	li $s5, 1
	sw $s5, 16($sp)
L119:
	j L115
L116:
	lw $s5, 16($sp)
	li $s6, 6
	beq $s5, $s6, L124
	li $s6, 0
	j L125
L124:
	li $s6, 1
L125:
	beq $s6, $zero, L123
	lw $s6, sym8
	lw $s5, sym13
	blt $s6, $s5, L127
	li $s5, 0
	j L128
L127:
	li $s5, 1
L128:
	beq $s5, $zero, L126
	li $s5, 1
	sw $s5, 16($sp)
L126:
	j L122
L123:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L131
	li $s6, 0
	j L132
L131:
	li $s6, 1
L132:
	beq $s6, $zero, L130
	lw $s6, sym8
	lw $s5, sym14
	blt $s6, $s5, L134
	li $s5, 0
	j L135
L134:
	li $s5, 1
L135:
	beq $s5, $zero, L133
	li $s5, 1
	sw $s5, 16($sp)
L133:
	j L129
L130:
	lw $s5, 16($sp)
	li $s6, 8
	beq $s5, $s6, L138
	li $s6, 0
	j L139
L138:
	li $s6, 1
L139:
	beq $s6, $zero, L137
	lw $s6, sym8
	lw $s5, sym15
	blt $s6, $s5, L141
	li $s5, 0
	j L142
L141:
	li $s5, 1
L142:
	beq $s5, $zero, L140
	li $s5, 1
	sw $s5, 16($sp)
L140:
	j L136
L137:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L145
	li $s6, 0
	j L146
L145:
	li $s6, 1
L146:
	beq $s6, $zero, L144
	lw $s6, sym8
	lw $s5, sym16
	blt $s6, $s5, L148
	li $s5, 0
	j L149
L148:
	li $s5, 1
L149:
	beq $s5, $zero, L147
	li $s5, 1
	sw $s5, 16($sp)
L147:
	j L143
L144:
	lw $s5, 16($sp)
	li $s6, 10
	beq $s5, $s6, L152
	li $s6, 0
	j L153
L152:
	li $s6, 1
L153:
	beq $s6, $zero, L151
	lw $s6, sym8
	lw $s5, sym17
	blt $s6, $s5, L155
	li $s5, 0
	j L156
L155:
	li $s5, 1
L156:
	beq $s5, $zero, L154
	li $s5, 1
	sw $s5, 16($sp)
L154:
	j L150
L151:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L159
	li $s6, 0
	j L160
L159:
	li $s6, 1
L160:
	beq $s6, $zero, L158
	lw $s6, sym8
	lw $s5, sym18
	blt $s6, $s5, L162
	li $s5, 0
	j L163
L162:
	li $s5, 1
L163:
	beq $s5, $zero, L161
	li $s5, 1
	sw $s5, 16($sp)
L161:
	j L157
L158:
	lw $s5, 16($sp)
	li $s6, 12
	beq $s5, $s6, L166
	li $s6, 0
	j L167
L166:
	li $s6, 1
L167:
	beq $s6, $zero, L165
	lw $s6, sym8
	lw $s5, sym19
	blt $s6, $s5, L169
	li $s5, 0
	j L170
L169:
	li $s5, 1
L170:
	beq $s5, $zero, L168
	li $s5, 1
	sw $s5, 16($sp)
L168:
	j L164
L165:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L173
	li $s6, 0
	j L174
L173:
	li $s6, 1
L174:
	beq $s6, $zero, L172
	lw $s6, sym8
	lw $s5, sym20
	blt $s6, $s5, L176
	li $s5, 0
	j L177
L176:
	li $s5, 1
L177:
	beq $s5, $zero, L175
	li $s5, 1
	sw $s5, 16($sp)
L175:
	j L171
L172:
	lw $s5, 16($sp)
	li $s6, 14
	beq $s5, $s6, L179
	li $s6, 0
	j L180
L179:
	li $s6, 1
L180:
	beq $s6, $zero, L178
	lw $s6, sym8
	lw $s5, sym21
	blt $s6, $s5, L182
	li $s5, 0
	j L183
L182:
	li $s5, 1
L183:
	beq $s5, $zero, L181
	li $s5, 1
	sw $s5, 16($sp)
L181:
L178:
L171:
L164:
L157:
L150:
L143:
L136:
L129:
L122:
L115:
L108:
L101:
L94:
L87:
L80:
	j L75
L76:
	lw $s5, 8($sp)
	li $s6, 2
	beq $s5, $s6, L186
	li $s6, 0
	j L187
L186:
	li $s6, 1
L187:
	beq $s6, $zero, L185
.data
L188:
.byte 4, 106, 61, 50, 10
.text
	la $s6, L188
	move $a0, $s6
	jal sym1
	move $s6, $v0
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L191
	li $s5, 0
	j L192
L191:
	li $s5, 1
L192:
	beq $s5, $zero, L190
	lw $s5, sym9
	lw $s6, sym7
	blt $s5, $s6, L194
	li $s6, 0
	j L195
L194:
	li $s6, 1
L195:
	beq $s6, $zero, L193
	li $s6, 2
	sw $s6, 16($sp)
L193:
	j L189
L190:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L198
	li $s5, 0
	j L199
L198:
	li $s5, 1
L199:
	beq $s5, $zero, L197
	lw $s5, sym9
	lw $s6, sym8
	blt $s5, $s6, L201
	li $s6, 0
	j L202
L201:
	li $s6, 1
L202:
	beq $s6, $zero, L200
	li $s6, 2
	sw $s6, 16($sp)
L200:
	j L196
L197:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L205
	li $s5, 0
	j L206
L205:
	li $s5, 1
L206:
	beq $s5, $zero, L204
	lw $s5, sym9
	lw $s6, sym9
	blt $s5, $s6, L208
	li $s6, 0
	j L209
L208:
	li $s6, 1
L209:
	beq $s6, $zero, L207
	li $s6, 2
	sw $s6, 16($sp)
L207:
	j L203
L204:
	lw $s6, 16($sp)
	li $s5, 3
	beq $s6, $s5, L212
	li $s5, 0
	j L213
L212:
	li $s5, 1
L213:
	beq $s5, $zero, L211
	lw $s5, sym9
	lw $s6, sym10
	blt $s5, $s6, L215
	li $s6, 0
	j L216
L215:
	li $s6, 1
L216:
	beq $s6, $zero, L214
	li $s6, 2
	sw $s6, 16($sp)
L214:
	j L210
L211:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L219
	li $s5, 0
	j L220
L219:
	li $s5, 1
L220:
	beq $s5, $zero, L218
	lw $s5, sym9
	lw $s6, sym11
	blt $s5, $s6, L222
	li $s6, 0
	j L223
L222:
	li $s6, 1
L223:
	beq $s6, $zero, L221
	li $s6, 2
	sw $s6, 16($sp)
L221:
	j L217
L218:
	lw $s6, 16($sp)
	li $s5, 5
	beq $s6, $s5, L226
	li $s5, 0
	j L227
L226:
	li $s5, 1
L227:
	beq $s5, $zero, L225
	lw $s5, sym9
	lw $s6, sym12
	blt $s5, $s6, L229
	li $s6, 0
	j L230
L229:
	li $s6, 1
L230:
	beq $s6, $zero, L228
	li $s6, 2
	sw $s6, 16($sp)
L228:
	j L224
L225:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L233
	li $s5, 0
	j L234
L233:
	li $s5, 1
L234:
	beq $s5, $zero, L232
	lw $s5, sym9
	lw $s6, sym13
	blt $s5, $s6, L236
	li $s6, 0
	j L237
L236:
	li $s6, 1
L237:
	beq $s6, $zero, L235
	li $s6, 2
	sw $s6, 16($sp)
L235:
	j L231
L232:
	lw $s6, 16($sp)
	li $s5, 7
	beq $s6, $s5, L240
	li $s5, 0
	j L241
L240:
	li $s5, 1
L241:
	beq $s5, $zero, L239
	lw $s5, sym9
	lw $s6, sym14
	blt $s5, $s6, L243
	li $s6, 0
	j L244
L243:
	li $s6, 1
L244:
	beq $s6, $zero, L242
	li $s6, 2
	sw $s6, 16($sp)
L242:
	j L238
L239:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L247
	li $s5, 0
	j L248
L247:
	li $s5, 1
L248:
	beq $s5, $zero, L246
	lw $s5, sym9
	lw $s6, sym15
	blt $s5, $s6, L250
	li $s6, 0
	j L251
L250:
	li $s6, 1
L251:
	beq $s6, $zero, L249
	li $s6, 2
	sw $s6, 16($sp)
L249:
	j L245
L246:
	lw $s6, 16($sp)
	li $s5, 9
	beq $s6, $s5, L254
	li $s5, 0
	j L255
L254:
	li $s5, 1
L255:
	beq $s5, $zero, L253
	lw $s5, sym9
	lw $s6, sym16
	blt $s5, $s6, L257
	li $s6, 0
	j L258
L257:
	li $s6, 1
L258:
	beq $s6, $zero, L256
	li $s6, 2
	sw $s6, 16($sp)
L256:
	j L252
L253:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L261
	li $s5, 0
	j L262
L261:
	li $s5, 1
L262:
	beq $s5, $zero, L260
	lw $s5, sym9
	lw $s6, sym17
	blt $s5, $s6, L264
	li $s6, 0
	j L265
L264:
	li $s6, 1
L265:
	beq $s6, $zero, L263
	li $s6, 2
	sw $s6, 16($sp)
L263:
	j L259
L260:
	lw $s6, 16($sp)
	li $s5, 11
	beq $s6, $s5, L268
	li $s5, 0
	j L269
L268:
	li $s5, 1
L269:
	beq $s5, $zero, L267
	lw $s5, sym9
	lw $s6, sym18
	blt $s5, $s6, L271
	li $s6, 0
	j L272
L271:
	li $s6, 1
L272:
	beq $s6, $zero, L270
	li $s6, 2
	sw $s6, 16($sp)
L270:
	j L266
L267:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L275
	li $s5, 0
	j L276
L275:
	li $s5, 1
L276:
	beq $s5, $zero, L274
	lw $s5, sym9
	lw $s6, sym19
	blt $s5, $s6, L278
	li $s6, 0
	j L279
L278:
	li $s6, 1
L279:
	beq $s6, $zero, L277
	li $s6, 2
	sw $s6, 16($sp)
L277:
	j L273
L274:
	lw $s6, 16($sp)
	li $s5, 13
	beq $s6, $s5, L282
	li $s5, 0
	j L283
L282:
	li $s5, 1
L283:
	beq $s5, $zero, L281
	lw $s5, sym9
	lw $s6, sym20
	blt $s5, $s6, L285
	li $s6, 0
	j L286
L285:
	li $s6, 1
L286:
	beq $s6, $zero, L284
	li $s6, 2
	sw $s6, 16($sp)
L284:
	j L280
L281:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L288
	li $s5, 0
	j L289
L288:
	li $s5, 1
L289:
	beq $s5, $zero, L287
	lw $s5, sym9
	lw $s6, sym21
	blt $s5, $s6, L291
	li $s6, 0
	j L292
L291:
	li $s6, 1
L292:
	beq $s6, $zero, L290
	li $s6, 2
	sw $s6, 16($sp)
L290:
L287:
L280:
L273:
L266:
L259:
L252:
L245:
L238:
L231:
L224:
L217:
L210:
L203:
L196:
L189:
	j L184
L185:
	lw $s6, 8($sp)
	li $s5, 3
	beq $s6, $s5, L295
	li $s5, 0
	j L296
L295:
	li $s5, 1
L296:
	beq $s5, $zero, L294
.data
L297:
.byte 4, 106, 61, 51, 10
.text
	la $s5, L297
	move $a0, $s5
	jal sym1
	move $s5, $v0
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L300
	li $s6, 0
	j L301
L300:
	li $s6, 1
L301:
	beq $s6, $zero, L299
	lw $s6, sym10
	lw $s5, sym7
	blt $s6, $s5, L303
	li $s5, 0
	j L304
L303:
	li $s5, 1
L304:
	beq $s5, $zero, L302
	li $s5, 3
	sw $s5, 16($sp)
L302:
	j L298
L299:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L307
	li $s6, 0
	j L308
L307:
	li $s6, 1
L308:
	beq $s6, $zero, L306
	lw $s6, sym10
	lw $s5, sym8
	blt $s6, $s5, L310
	li $s5, 0
	j L311
L310:
	li $s5, 1
L311:
	beq $s5, $zero, L309
	li $s5, 3
	sw $s5, 16($sp)
L309:
	j L305
L306:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L314
	li $s6, 0
	j L315
L314:
	li $s6, 1
L315:
	beq $s6, $zero, L313
	lw $s6, sym10
	lw $s5, sym9
	blt $s6, $s5, L317
	li $s5, 0
	j L318
L317:
	li $s5, 1
L318:
	beq $s5, $zero, L316
	li $s5, 3
	sw $s5, 16($sp)
L316:
	j L312
L313:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L321
	li $s6, 0
	j L322
L321:
	li $s6, 1
L322:
	beq $s6, $zero, L320
	lw $s6, sym10
	lw $s5, sym10
	blt $s6, $s5, L324
	li $s5, 0
	j L325
L324:
	li $s5, 1
L325:
	beq $s5, $zero, L323
	li $s5, 3
	sw $s5, 16($sp)
L323:
	j L319
L320:
	lw $s5, 16($sp)
	li $s6, 4
	beq $s5, $s6, L328
	li $s6, 0
	j L329
L328:
	li $s6, 1
L329:
	beq $s6, $zero, L327
	lw $s6, sym10
	lw $s5, sym11
	blt $s6, $s5, L331
	li $s5, 0
	j L332
L331:
	li $s5, 1
L332:
	beq $s5, $zero, L330
	li $s5, 3
	sw $s5, 16($sp)
L330:
	j L326
L327:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L335
	li $s6, 0
	j L336
L335:
	li $s6, 1
L336:
	beq $s6, $zero, L334
	lw $s6, sym10
	lw $s5, sym12
	blt $s6, $s5, L338
	li $s5, 0
	j L339
L338:
	li $s5, 1
L339:
	beq $s5, $zero, L337
	li $s5, 3
	sw $s5, 16($sp)
L337:
	j L333
L334:
	lw $s5, 16($sp)
	li $s6, 6
	beq $s5, $s6, L342
	li $s6, 0
	j L343
L342:
	li $s6, 1
L343:
	beq $s6, $zero, L341
	lw $s6, sym10
	lw $s5, sym13
	blt $s6, $s5, L345
	li $s5, 0
	j L346
L345:
	li $s5, 1
L346:
	beq $s5, $zero, L344
	li $s5, 3
	sw $s5, 16($sp)
L344:
	j L340
L341:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L349
	li $s6, 0
	j L350
L349:
	li $s6, 1
L350:
	beq $s6, $zero, L348
	lw $s6, sym10
	lw $s5, sym14
	blt $s6, $s5, L352
	li $s5, 0
	j L353
L352:
	li $s5, 1
L353:
	beq $s5, $zero, L351
	li $s5, 3
	sw $s5, 16($sp)
L351:
	j L347
L348:
	lw $s5, 16($sp)
	li $s6, 8
	beq $s5, $s6, L356
	li $s6, 0
	j L357
L356:
	li $s6, 1
L357:
	beq $s6, $zero, L355
	lw $s6, sym10
	lw $s5, sym15
	blt $s6, $s5, L359
	li $s5, 0
	j L360
L359:
	li $s5, 1
L360:
	beq $s5, $zero, L358
	li $s5, 3
	sw $s5, 16($sp)
L358:
	j L354
L355:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L363
	li $s6, 0
	j L364
L363:
	li $s6, 1
L364:
	beq $s6, $zero, L362
	lw $s6, sym10
	lw $s5, sym16
	blt $s6, $s5, L366
	li $s5, 0
	j L367
L366:
	li $s5, 1
L367:
	beq $s5, $zero, L365
	li $s5, 3
	sw $s5, 16($sp)
L365:
	j L361
L362:
	lw $s5, 16($sp)
	li $s6, 10
	beq $s5, $s6, L370
	li $s6, 0
	j L371
L370:
	li $s6, 1
L371:
	beq $s6, $zero, L369
	lw $s6, sym10
	lw $s5, sym17
	blt $s6, $s5, L373
	li $s5, 0
	j L374
L373:
	li $s5, 1
L374:
	beq $s5, $zero, L372
	li $s5, 3
	sw $s5, 16($sp)
L372:
	j L368
L369:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L377
	li $s6, 0
	j L378
L377:
	li $s6, 1
L378:
	beq $s6, $zero, L376
	lw $s6, sym10
	lw $s5, sym18
	blt $s6, $s5, L380
	li $s5, 0
	j L381
L380:
	li $s5, 1
L381:
	beq $s5, $zero, L379
	li $s5, 3
	sw $s5, 16($sp)
L379:
	j L375
L376:
	lw $s5, 16($sp)
	li $s6, 12
	beq $s5, $s6, L384
	li $s6, 0
	j L385
L384:
	li $s6, 1
L385:
	beq $s6, $zero, L383
	lw $s6, sym10
	lw $s5, sym19
	blt $s6, $s5, L387
	li $s5, 0
	j L388
L387:
	li $s5, 1
L388:
	beq $s5, $zero, L386
	li $s5, 3
	sw $s5, 16($sp)
L386:
	j L382
L383:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L391
	li $s6, 0
	j L392
L391:
	li $s6, 1
L392:
	beq $s6, $zero, L390
	lw $s6, sym10
	lw $s5, sym20
	blt $s6, $s5, L394
	li $s5, 0
	j L395
L394:
	li $s5, 1
L395:
	beq $s5, $zero, L393
	li $s5, 3
	sw $s5, 16($sp)
L393:
	j L389
L390:
	lw $s5, 16($sp)
	li $s6, 14
	beq $s5, $s6, L397
	li $s6, 0
	j L398
L397:
	li $s6, 1
L398:
	beq $s6, $zero, L396
	lw $s6, sym10
	lw $s5, sym21
	blt $s6, $s5, L400
	li $s5, 0
	j L401
L400:
	li $s5, 1
L401:
	beq $s5, $zero, L399
	li $s5, 3
	sw $s5, 16($sp)
L399:
L396:
L389:
L382:
L375:
L368:
L361:
L354:
L347:
L340:
L333:
L326:
L319:
L312:
L305:
L298:
	j L293
L294:
	lw $s5, 8($sp)
	li $s6, 4
	beq $s5, $s6, L404
	li $s6, 0
	j L405
L404:
	li $s6, 1
L405:
	beq $s6, $zero, L403
.data
L406:
.byte 4, 106, 61, 52, 10
.text
	la $s6, L406
	move $a0, $s6
	jal sym1
	move $s6, $v0
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L409
	li $s5, 0
	j L410
L409:
	li $s5, 1
L410:
	beq $s5, $zero, L408
	lw $s5, sym11
	lw $s6, sym7
	blt $s5, $s6, L412
	li $s6, 0
	j L413
L412:
	li $s6, 1
L413:
	beq $s6, $zero, L411
	li $s6, 4
	sw $s6, 16($sp)
L411:
	j L407
L408:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L416
	li $s5, 0
	j L417
L416:
	li $s5, 1
L417:
	beq $s5, $zero, L415
	lw $s5, sym11
	lw $s6, sym8
	blt $s5, $s6, L419
	li $s6, 0
	j L420
L419:
	li $s6, 1
L420:
	beq $s6, $zero, L418
	li $s6, 4
	sw $s6, 16($sp)
L418:
	j L414
L415:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L423
	li $s5, 0
	j L424
L423:
	li $s5, 1
L424:
	beq $s5, $zero, L422
	lw $s5, sym11
	lw $s6, sym9
	blt $s5, $s6, L426
	li $s6, 0
	j L427
L426:
	li $s6, 1
L427:
	beq $s6, $zero, L425
	li $s6, 4
	sw $s6, 16($sp)
L425:
	j L421
L422:
	lw $s6, 16($sp)
	li $s5, 3
	beq $s6, $s5, L430
	li $s5, 0
	j L431
L430:
	li $s5, 1
L431:
	beq $s5, $zero, L429
	lw $s5, sym11
	lw $s6, sym10
	blt $s5, $s6, L433
	li $s6, 0
	j L434
L433:
	li $s6, 1
L434:
	beq $s6, $zero, L432
	li $s6, 4
	sw $s6, 16($sp)
L432:
	j L428
L429:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L437
	li $s5, 0
	j L438
L437:
	li $s5, 1
L438:
	beq $s5, $zero, L436
	lw $s5, sym11
	lw $s6, sym11
	blt $s5, $s6, L440
	li $s6, 0
	j L441
L440:
	li $s6, 1
L441:
	beq $s6, $zero, L439
	li $s6, 4
	sw $s6, 16($sp)
L439:
	j L435
L436:
	lw $s6, 16($sp)
	li $s5, 5
	beq $s6, $s5, L444
	li $s5, 0
	j L445
L444:
	li $s5, 1
L445:
	beq $s5, $zero, L443
	lw $s5, sym11
	lw $s6, sym12
	blt $s5, $s6, L447
	li $s6, 0
	j L448
L447:
	li $s6, 1
L448:
	beq $s6, $zero, L446
	li $s6, 4
	sw $s6, 16($sp)
L446:
	j L442
L443:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L451
	li $s5, 0
	j L452
L451:
	li $s5, 1
L452:
	beq $s5, $zero, L450
	lw $s5, sym11
	lw $s6, sym13
	blt $s5, $s6, L454
	li $s6, 0
	j L455
L454:
	li $s6, 1
L455:
	beq $s6, $zero, L453
	li $s6, 4
	sw $s6, 16($sp)
L453:
	j L449
L450:
	lw $s6, 16($sp)
	li $s5, 7
	beq $s6, $s5, L458
	li $s5, 0
	j L459
L458:
	li $s5, 1
L459:
	beq $s5, $zero, L457
	lw $s5, sym11
	lw $s6, sym14
	blt $s5, $s6, L461
	li $s6, 0
	j L462
L461:
	li $s6, 1
L462:
	beq $s6, $zero, L460
	li $s6, 4
	sw $s6, 16($sp)
L460:
	j L456
L457:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L465
	li $s5, 0
	j L466
L465:
	li $s5, 1
L466:
	beq $s5, $zero, L464
	lw $s5, sym11
	lw $s6, sym15
	blt $s5, $s6, L468
	li $s6, 0
	j L469
L468:
	li $s6, 1
L469:
	beq $s6, $zero, L467
	li $s6, 4
	sw $s6, 16($sp)
L467:
	j L463
L464:
	lw $s6, 16($sp)
	li $s5, 9
	beq $s6, $s5, L472
	li $s5, 0
	j L473
L472:
	li $s5, 1
L473:
	beq $s5, $zero, L471
	lw $s5, sym11
	lw $s6, sym16
	blt $s5, $s6, L475
	li $s6, 0
	j L476
L475:
	li $s6, 1
L476:
	beq $s6, $zero, L474
	li $s6, 4
	sw $s6, 16($sp)
L474:
	j L470
L471:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L479
	li $s5, 0
	j L480
L479:
	li $s5, 1
L480:
	beq $s5, $zero, L478
	lw $s5, sym11
	lw $s6, sym17
	blt $s5, $s6, L482
	li $s6, 0
	j L483
L482:
	li $s6, 1
L483:
	beq $s6, $zero, L481
	li $s6, 4
	sw $s6, 16($sp)
L481:
	j L477
L478:
	lw $s6, 16($sp)
	li $s5, 11
	beq $s6, $s5, L486
	li $s5, 0
	j L487
L486:
	li $s5, 1
L487:
	beq $s5, $zero, L485
	lw $s5, sym11
	lw $s6, sym18
	blt $s5, $s6, L489
	li $s6, 0
	j L490
L489:
	li $s6, 1
L490:
	beq $s6, $zero, L488
	li $s6, 4
	sw $s6, 16($sp)
L488:
	j L484
L485:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L493
	li $s5, 0
	j L494
L493:
	li $s5, 1
L494:
	beq $s5, $zero, L492
	lw $s5, sym11
	lw $s6, sym19
	blt $s5, $s6, L496
	li $s6, 0
	j L497
L496:
	li $s6, 1
L497:
	beq $s6, $zero, L495
	li $s6, 4
	sw $s6, 16($sp)
L495:
	j L491
L492:
	lw $s6, 16($sp)
	li $s5, 13
	beq $s6, $s5, L500
	li $s5, 0
	j L501
L500:
	li $s5, 1
L501:
	beq $s5, $zero, L499
	lw $s5, sym11
	lw $s6, sym20
	blt $s5, $s6, L503
	li $s6, 0
	j L504
L503:
	li $s6, 1
L504:
	beq $s6, $zero, L502
	li $s6, 4
	sw $s6, 16($sp)
L502:
	j L498
L499:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L506
	li $s5, 0
	j L507
L506:
	li $s5, 1
L507:
	beq $s5, $zero, L505
	lw $s5, sym11
	lw $s6, sym21
	blt $s5, $s6, L509
	li $s6, 0
	j L510
L509:
	li $s6, 1
L510:
	beq $s6, $zero, L508
	li $s6, 4
	sw $s6, 16($sp)
L508:
L505:
L498:
L491:
L484:
L477:
L470:
L463:
L456:
L449:
L442:
L435:
L428:
L421:
L414:
L407:
	j L402
L403:
	lw $s6, 8($sp)
	li $s5, 5
	beq $s6, $s5, L513
	li $s5, 0
	j L514
L513:
	li $s5, 1
L514:
	beq $s5, $zero, L512
.data
L515:
.byte 4, 106, 61, 53, 10
.text
	la $s5, L515
	move $a0, $s5
	jal sym1
	move $s5, $v0
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L518
	li $s6, 0
	j L519
L518:
	li $s6, 1
L519:
	beq $s6, $zero, L517
	lw $s6, sym12
	lw $s5, sym7
	blt $s6, $s5, L521
	li $s5, 0
	j L522
L521:
	li $s5, 1
L522:
	beq $s5, $zero, L520
	li $s5, 5
	sw $s5, 16($sp)
L520:
	j L516
L517:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L525
	li $s6, 0
	j L526
L525:
	li $s6, 1
L526:
	beq $s6, $zero, L524
	lw $s6, sym12
	lw $s5, sym8
	blt $s6, $s5, L528
	li $s5, 0
	j L529
L528:
	li $s5, 1
L529:
	beq $s5, $zero, L527
	li $s5, 5
	sw $s5, 16($sp)
L527:
	j L523
L524:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L532
	li $s6, 0
	j L533
L532:
	li $s6, 1
L533:
	beq $s6, $zero, L531
	lw $s6, sym12
	lw $s5, sym9
	blt $s6, $s5, L535
	li $s5, 0
	j L536
L535:
	li $s5, 1
L536:
	beq $s5, $zero, L534
	li $s5, 5
	sw $s5, 16($sp)
L534:
	j L530
L531:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L539
	li $s6, 0
	j L540
L539:
	li $s6, 1
L540:
	beq $s6, $zero, L538
	lw $s6, sym12
	lw $s5, sym10
	blt $s6, $s5, L542
	li $s5, 0
	j L543
L542:
	li $s5, 1
L543:
	beq $s5, $zero, L541
	li $s5, 5
	sw $s5, 16($sp)
L541:
	j L537
L538:
	lw $s5, 16($sp)
	li $s6, 4
	beq $s5, $s6, L546
	li $s6, 0
	j L547
L546:
	li $s6, 1
L547:
	beq $s6, $zero, L545
	lw $s6, sym12
	lw $s5, sym11
	blt $s6, $s5, L549
	li $s5, 0
	j L550
L549:
	li $s5, 1
L550:
	beq $s5, $zero, L548
	li $s5, 5
	sw $s5, 16($sp)
L548:
	j L544
L545:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L553
	li $s6, 0
	j L554
L553:
	li $s6, 1
L554:
	beq $s6, $zero, L552
	lw $s6, sym12
	lw $s5, sym12
	blt $s6, $s5, L556
	li $s5, 0
	j L557
L556:
	li $s5, 1
L557:
	beq $s5, $zero, L555
	li $s5, 5
	sw $s5, 16($sp)
L555:
	j L551
L552:
	lw $s5, 16($sp)
	li $s6, 6
	beq $s5, $s6, L560
	li $s6, 0
	j L561
L560:
	li $s6, 1
L561:
	beq $s6, $zero, L559
	lw $s6, sym12
	lw $s5, sym13
	blt $s6, $s5, L563
	li $s5, 0
	j L564
L563:
	li $s5, 1
L564:
	beq $s5, $zero, L562
	li $s5, 5
	sw $s5, 16($sp)
L562:
	j L558
L559:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L567
	li $s6, 0
	j L568
L567:
	li $s6, 1
L568:
	beq $s6, $zero, L566
	lw $s6, sym12
	lw $s5, sym14
	blt $s6, $s5, L570
	li $s5, 0
	j L571
L570:
	li $s5, 1
L571:
	beq $s5, $zero, L569
	li $s5, 5
	sw $s5, 16($sp)
L569:
	j L565
L566:
	lw $s5, 16($sp)
	li $s6, 8
	beq $s5, $s6, L574
	li $s6, 0
	j L575
L574:
	li $s6, 1
L575:
	beq $s6, $zero, L573
	lw $s6, sym12
	lw $s5, sym15
	blt $s6, $s5, L577
	li $s5, 0
	j L578
L577:
	li $s5, 1
L578:
	beq $s5, $zero, L576
	li $s5, 5
	sw $s5, 16($sp)
L576:
	j L572
L573:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L581
	li $s6, 0
	j L582
L581:
	li $s6, 1
L582:
	beq $s6, $zero, L580
	lw $s6, sym12
	lw $s5, sym16
	blt $s6, $s5, L584
	li $s5, 0
	j L585
L584:
	li $s5, 1
L585:
	beq $s5, $zero, L583
	li $s5, 5
	sw $s5, 16($sp)
L583:
	j L579
L580:
	lw $s5, 16($sp)
	li $s6, 10
	beq $s5, $s6, L588
	li $s6, 0
	j L589
L588:
	li $s6, 1
L589:
	beq $s6, $zero, L587
	lw $s6, sym12
	lw $s5, sym17
	blt $s6, $s5, L591
	li $s5, 0
	j L592
L591:
	li $s5, 1
L592:
	beq $s5, $zero, L590
	li $s5, 5
	sw $s5, 16($sp)
L590:
	j L586
L587:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L595
	li $s6, 0
	j L596
L595:
	li $s6, 1
L596:
	beq $s6, $zero, L594
	lw $s6, sym12
	lw $s5, sym18
	blt $s6, $s5, L598
	li $s5, 0
	j L599
L598:
	li $s5, 1
L599:
	beq $s5, $zero, L597
	li $s5, 5
	sw $s5, 16($sp)
L597:
	j L593
L594:
	lw $s5, 16($sp)
	li $s6, 12
	beq $s5, $s6, L602
	li $s6, 0
	j L603
L602:
	li $s6, 1
L603:
	beq $s6, $zero, L601
	lw $s6, sym12
	lw $s5, sym19
	blt $s6, $s5, L605
	li $s5, 0
	j L606
L605:
	li $s5, 1
L606:
	beq $s5, $zero, L604
	li $s5, 5
	sw $s5, 16($sp)
L604:
	j L600
L601:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L609
	li $s6, 0
	j L610
L609:
	li $s6, 1
L610:
	beq $s6, $zero, L608
	lw $s6, sym12
	lw $s5, sym20
	blt $s6, $s5, L612
	li $s5, 0
	j L613
L612:
	li $s5, 1
L613:
	beq $s5, $zero, L611
	li $s5, 5
	sw $s5, 16($sp)
L611:
	j L607
L608:
	lw $s5, 16($sp)
	li $s6, 14
	beq $s5, $s6, L615
	li $s6, 0
	j L616
L615:
	li $s6, 1
L616:
	beq $s6, $zero, L614
	lw $s6, sym12
	lw $s5, sym21
	blt $s6, $s5, L618
	li $s5, 0
	j L619
L618:
	li $s5, 1
L619:
	beq $s5, $zero, L617
	li $s5, 5
	sw $s5, 16($sp)
L617:
L614:
L607:
L600:
L593:
L586:
L579:
L572:
L565:
L558:
L551:
L544:
L537:
L530:
L523:
L516:
	j L511
L512:
	lw $s5, 8($sp)
	li $s6, 6
	beq $s5, $s6, L622
	li $s6, 0
	j L623
L622:
	li $s6, 1
L623:
	beq $s6, $zero, L621
.data
L624:
.byte 4, 106, 61, 54, 10
.text
	la $s6, L624
	move $a0, $s6
	jal sym1
	move $s6, $v0
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L627
	li $s5, 0
	j L628
L627:
	li $s5, 1
L628:
	beq $s5, $zero, L626
	lw $s5, sym13
	lw $s6, sym7
	blt $s5, $s6, L630
	li $s6, 0
	j L631
L630:
	li $s6, 1
L631:
	beq $s6, $zero, L629
	li $s6, 6
	sw $s6, 16($sp)
L629:
	j L625
L626:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L634
	li $s5, 0
	j L635
L634:
	li $s5, 1
L635:
	beq $s5, $zero, L633
	lw $s5, sym13
	lw $s6, sym8
	blt $s5, $s6, L637
	li $s6, 0
	j L638
L637:
	li $s6, 1
L638:
	beq $s6, $zero, L636
	li $s6, 6
	sw $s6, 16($sp)
L636:
	j L632
L633:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L641
	li $s5, 0
	j L642
L641:
	li $s5, 1
L642:
	beq $s5, $zero, L640
	lw $s5, sym13
	lw $s6, sym9
	blt $s5, $s6, L644
	li $s6, 0
	j L645
L644:
	li $s6, 1
L645:
	beq $s6, $zero, L643
	li $s6, 6
	sw $s6, 16($sp)
L643:
	j L639
L640:
	lw $s6, 16($sp)
	li $s5, 3
	beq $s6, $s5, L648
	li $s5, 0
	j L649
L648:
	li $s5, 1
L649:
	beq $s5, $zero, L647
	lw $s5, sym13
	lw $s6, sym10
	blt $s5, $s6, L651
	li $s6, 0
	j L652
L651:
	li $s6, 1
L652:
	beq $s6, $zero, L650
	li $s6, 6
	sw $s6, 16($sp)
L650:
	j L646
L647:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L655
	li $s5, 0
	j L656
L655:
	li $s5, 1
L656:
	beq $s5, $zero, L654
	lw $s5, sym13
	lw $s6, sym11
	blt $s5, $s6, L658
	li $s6, 0
	j L659
L658:
	li $s6, 1
L659:
	beq $s6, $zero, L657
	li $s6, 6
	sw $s6, 16($sp)
L657:
	j L653
L654:
	lw $s6, 16($sp)
	li $s5, 5
	beq $s6, $s5, L662
	li $s5, 0
	j L663
L662:
	li $s5, 1
L663:
	beq $s5, $zero, L661
	lw $s5, sym13
	lw $s6, sym12
	blt $s5, $s6, L665
	li $s6, 0
	j L666
L665:
	li $s6, 1
L666:
	beq $s6, $zero, L664
	li $s6, 6
	sw $s6, 16($sp)
L664:
	j L660
L661:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L669
	li $s5, 0
	j L670
L669:
	li $s5, 1
L670:
	beq $s5, $zero, L668
	lw $s5, sym13
	lw $s6, sym13
	blt $s5, $s6, L672
	li $s6, 0
	j L673
L672:
	li $s6, 1
L673:
	beq $s6, $zero, L671
	li $s6, 6
	sw $s6, 16($sp)
L671:
	j L667
L668:
	lw $s6, 16($sp)
	li $s5, 7
	beq $s6, $s5, L676
	li $s5, 0
	j L677
L676:
	li $s5, 1
L677:
	beq $s5, $zero, L675
	lw $s5, sym13
	lw $s6, sym14
	blt $s5, $s6, L679
	li $s6, 0
	j L680
L679:
	li $s6, 1
L680:
	beq $s6, $zero, L678
	li $s6, 6
	sw $s6, 16($sp)
L678:
	j L674
L675:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L683
	li $s5, 0
	j L684
L683:
	li $s5, 1
L684:
	beq $s5, $zero, L682
	lw $s5, sym13
	lw $s6, sym15
	blt $s5, $s6, L686
	li $s6, 0
	j L687
L686:
	li $s6, 1
L687:
	beq $s6, $zero, L685
	li $s6, 6
	sw $s6, 16($sp)
L685:
	j L681
L682:
	lw $s6, 16($sp)
	li $s5, 9
	beq $s6, $s5, L690
	li $s5, 0
	j L691
L690:
	li $s5, 1
L691:
	beq $s5, $zero, L689
	lw $s5, sym13
	lw $s6, sym16
	blt $s5, $s6, L693
	li $s6, 0
	j L694
L693:
	li $s6, 1
L694:
	beq $s6, $zero, L692
	li $s6, 6
	sw $s6, 16($sp)
L692:
	j L688
L689:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L697
	li $s5, 0
	j L698
L697:
	li $s5, 1
L698:
	beq $s5, $zero, L696
	lw $s5, sym13
	lw $s6, sym17
	blt $s5, $s6, L700
	li $s6, 0
	j L701
L700:
	li $s6, 1
L701:
	beq $s6, $zero, L699
	li $s6, 6
	sw $s6, 16($sp)
L699:
	j L695
L696:
	lw $s6, 16($sp)
	li $s5, 11
	beq $s6, $s5, L704
	li $s5, 0
	j L705
L704:
	li $s5, 1
L705:
	beq $s5, $zero, L703
	lw $s5, sym13
	lw $s6, sym18
	blt $s5, $s6, L707
	li $s6, 0
	j L708
L707:
	li $s6, 1
L708:
	beq $s6, $zero, L706
	li $s6, 6
	sw $s6, 16($sp)
L706:
	j L702
L703:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L711
	li $s5, 0
	j L712
L711:
	li $s5, 1
L712:
	beq $s5, $zero, L710
	lw $s5, sym13
	lw $s6, sym19
	blt $s5, $s6, L714
	li $s6, 0
	j L715
L714:
	li $s6, 1
L715:
	beq $s6, $zero, L713
	li $s6, 6
	sw $s6, 16($sp)
L713:
	j L709
L710:
	lw $s6, 16($sp)
	li $s5, 13
	beq $s6, $s5, L718
	li $s5, 0
	j L719
L718:
	li $s5, 1
L719:
	beq $s5, $zero, L717
	lw $s5, sym13
	lw $s6, sym20
	blt $s5, $s6, L721
	li $s6, 0
	j L722
L721:
	li $s6, 1
L722:
	beq $s6, $zero, L720
	li $s6, 6
	sw $s6, 16($sp)
L720:
	j L716
L717:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L724
	li $s5, 0
	j L725
L724:
	li $s5, 1
L725:
	beq $s5, $zero, L723
	lw $s5, sym13
	lw $s6, sym21
	blt $s5, $s6, L727
	li $s6, 0
	j L728
L727:
	li $s6, 1
L728:
	beq $s6, $zero, L726
	li $s6, 6
	sw $s6, 16($sp)
L726:
L723:
L716:
L709:
L702:
L695:
L688:
L681:
L674:
L667:
L660:
L653:
L646:
L639:
L632:
L625:
	j L620
L621:
	lw $s6, 8($sp)
	li $s5, 7
	beq $s6, $s5, L731
	li $s5, 0
	j L732
L731:
	li $s5, 1
L732:
	beq $s5, $zero, L730
.data
L733:
.byte 4, 106, 61, 55, 10
.text
	la $s5, L733
	move $a0, $s5
	jal sym1
	move $s5, $v0
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L736
	li $s6, 0
	j L737
L736:
	li $s6, 1
L737:
	beq $s6, $zero, L735
	lw $s6, sym14
	lw $s5, sym7
	blt $s6, $s5, L739
	li $s5, 0
	j L740
L739:
	li $s5, 1
L740:
	beq $s5, $zero, L738
	li $s5, 7
	sw $s5, 16($sp)
L738:
	j L734
L735:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L743
	li $s6, 0
	j L744
L743:
	li $s6, 1
L744:
	beq $s6, $zero, L742
	lw $s6, sym14
	lw $s5, sym8
	blt $s6, $s5, L746
	li $s5, 0
	j L747
L746:
	li $s5, 1
L747:
	beq $s5, $zero, L745
	li $s5, 7
	sw $s5, 16($sp)
L745:
	j L741
L742:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L750
	li $s6, 0
	j L751
L750:
	li $s6, 1
L751:
	beq $s6, $zero, L749
	lw $s6, sym14
	lw $s5, sym9
	blt $s6, $s5, L753
	li $s5, 0
	j L754
L753:
	li $s5, 1
L754:
	beq $s5, $zero, L752
	li $s5, 7
	sw $s5, 16($sp)
L752:
	j L748
L749:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L757
	li $s6, 0
	j L758
L757:
	li $s6, 1
L758:
	beq $s6, $zero, L756
	lw $s6, sym14
	lw $s5, sym10
	blt $s6, $s5, L760
	li $s5, 0
	j L761
L760:
	li $s5, 1
L761:
	beq $s5, $zero, L759
	li $s5, 7
	sw $s5, 16($sp)
L759:
	j L755
L756:
	lw $s5, 16($sp)
	li $s6, 4
	beq $s5, $s6, L764
	li $s6, 0
	j L765
L764:
	li $s6, 1
L765:
	beq $s6, $zero, L763
	lw $s6, sym14
	lw $s5, sym11
	blt $s6, $s5, L767
	li $s5, 0
	j L768
L767:
	li $s5, 1
L768:
	beq $s5, $zero, L766
	li $s5, 7
	sw $s5, 16($sp)
L766:
	j L762
L763:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L771
	li $s6, 0
	j L772
L771:
	li $s6, 1
L772:
	beq $s6, $zero, L770
	lw $s6, sym14
	lw $s5, sym12
	blt $s6, $s5, L774
	li $s5, 0
	j L775
L774:
	li $s5, 1
L775:
	beq $s5, $zero, L773
	li $s5, 7
	sw $s5, 16($sp)
L773:
	j L769
L770:
	lw $s5, 16($sp)
	li $s6, 6
	beq $s5, $s6, L778
	li $s6, 0
	j L779
L778:
	li $s6, 1
L779:
	beq $s6, $zero, L777
	lw $s6, sym14
	lw $s5, sym13
	blt $s6, $s5, L781
	li $s5, 0
	j L782
L781:
	li $s5, 1
L782:
	beq $s5, $zero, L780
	li $s5, 7
	sw $s5, 16($sp)
L780:
	j L776
L777:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L785
	li $s6, 0
	j L786
L785:
	li $s6, 1
L786:
	beq $s6, $zero, L784
	lw $s6, sym14
	lw $s5, sym14
	blt $s6, $s5, L788
	li $s5, 0
	j L789
L788:
	li $s5, 1
L789:
	beq $s5, $zero, L787
	li $s5, 7
	sw $s5, 16($sp)
L787:
	j L783
L784:
	lw $s5, 16($sp)
	li $s6, 8
	beq $s5, $s6, L792
	li $s6, 0
	j L793
L792:
	li $s6, 1
L793:
	beq $s6, $zero, L791
	lw $s6, sym14
	lw $s5, sym15
	blt $s6, $s5, L795
	li $s5, 0
	j L796
L795:
	li $s5, 1
L796:
	beq $s5, $zero, L794
	li $s5, 7
	sw $s5, 16($sp)
L794:
	j L790
L791:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L799
	li $s6, 0
	j L800
L799:
	li $s6, 1
L800:
	beq $s6, $zero, L798
	lw $s6, sym14
	lw $s5, sym16
	blt $s6, $s5, L802
	li $s5, 0
	j L803
L802:
	li $s5, 1
L803:
	beq $s5, $zero, L801
	li $s5, 7
	sw $s5, 16($sp)
L801:
	j L797
L798:
	lw $s5, 16($sp)
	li $s6, 10
	beq $s5, $s6, L806
	li $s6, 0
	j L807
L806:
	li $s6, 1
L807:
	beq $s6, $zero, L805
	lw $s6, sym14
	lw $s5, sym17
	blt $s6, $s5, L809
	li $s5, 0
	j L810
L809:
	li $s5, 1
L810:
	beq $s5, $zero, L808
	li $s5, 7
	sw $s5, 16($sp)
L808:
	j L804
L805:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L813
	li $s6, 0
	j L814
L813:
	li $s6, 1
L814:
	beq $s6, $zero, L812
	lw $s6, sym14
	lw $s5, sym18
	blt $s6, $s5, L816
	li $s5, 0
	j L817
L816:
	li $s5, 1
L817:
	beq $s5, $zero, L815
	li $s5, 7
	sw $s5, 16($sp)
L815:
	j L811
L812:
	lw $s5, 16($sp)
	li $s6, 12
	beq $s5, $s6, L820
	li $s6, 0
	j L821
L820:
	li $s6, 1
L821:
	beq $s6, $zero, L819
	lw $s6, sym14
	lw $s5, sym19
	blt $s6, $s5, L823
	li $s5, 0
	j L824
L823:
	li $s5, 1
L824:
	beq $s5, $zero, L822
	li $s5, 7
	sw $s5, 16($sp)
L822:
	j L818
L819:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L827
	li $s6, 0
	j L828
L827:
	li $s6, 1
L828:
	beq $s6, $zero, L826
	lw $s6, sym14
	lw $s5, sym20
	blt $s6, $s5, L830
	li $s5, 0
	j L831
L830:
	li $s5, 1
L831:
	beq $s5, $zero, L829
	li $s5, 7
	sw $s5, 16($sp)
L829:
	j L825
L826:
	lw $s5, 16($sp)
	li $s6, 14
	beq $s5, $s6, L833
	li $s6, 0
	j L834
L833:
	li $s6, 1
L834:
	beq $s6, $zero, L832
	lw $s6, sym14
	lw $s5, sym21
	blt $s6, $s5, L836
	li $s5, 0
	j L837
L836:
	li $s5, 1
L837:
	beq $s5, $zero, L835
	li $s5, 7
	sw $s5, 16($sp)
L835:
L832:
L825:
L818:
L811:
L804:
L797:
L790:
L783:
L776:
L769:
L762:
L755:
L748:
L741:
L734:
	j L729
L730:
	lw $s5, 8($sp)
	li $s6, 8
	beq $s5, $s6, L840
	li $s6, 0
	j L841
L840:
	li $s6, 1
L841:
	beq $s6, $zero, L839
.data
L842:
.byte 4, 106, 61, 56, 10
.text
	la $s6, L842
	move $a0, $s6
	jal sym1
	move $s6, $v0
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L845
	li $s5, 0
	j L846
L845:
	li $s5, 1
L846:
	beq $s5, $zero, L844
	lw $s5, sym15
	lw $s6, sym7
	blt $s5, $s6, L848
	li $s6, 0
	j L849
L848:
	li $s6, 1
L849:
	beq $s6, $zero, L847
	li $s6, 8
	sw $s6, 16($sp)
L847:
	j L843
L844:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L852
	li $s5, 0
	j L853
L852:
	li $s5, 1
L853:
	beq $s5, $zero, L851
	lw $s5, sym15
	lw $s6, sym8
	blt $s5, $s6, L855
	li $s6, 0
	j L856
L855:
	li $s6, 1
L856:
	beq $s6, $zero, L854
	li $s6, 8
	sw $s6, 16($sp)
L854:
	j L850
L851:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L859
	li $s5, 0
	j L860
L859:
	li $s5, 1
L860:
	beq $s5, $zero, L858
	lw $s5, sym15
	lw $s6, sym9
	blt $s5, $s6, L862
	li $s6, 0
	j L863
L862:
	li $s6, 1
L863:
	beq $s6, $zero, L861
	li $s6, 8
	sw $s6, 16($sp)
L861:
	j L857
L858:
	lw $s6, 16($sp)
	li $s5, 3
	beq $s6, $s5, L866
	li $s5, 0
	j L867
L866:
	li $s5, 1
L867:
	beq $s5, $zero, L865
	lw $s5, sym15
	lw $s6, sym10
	blt $s5, $s6, L869
	li $s6, 0
	j L870
L869:
	li $s6, 1
L870:
	beq $s6, $zero, L868
	li $s6, 8
	sw $s6, 16($sp)
L868:
	j L864
L865:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L873
	li $s5, 0
	j L874
L873:
	li $s5, 1
L874:
	beq $s5, $zero, L872
	lw $s5, sym15
	lw $s6, sym11
	blt $s5, $s6, L876
	li $s6, 0
	j L877
L876:
	li $s6, 1
L877:
	beq $s6, $zero, L875
	li $s6, 8
	sw $s6, 16($sp)
L875:
	j L871
L872:
	lw $s6, 16($sp)
	li $s5, 5
	beq $s6, $s5, L880
	li $s5, 0
	j L881
L880:
	li $s5, 1
L881:
	beq $s5, $zero, L879
	lw $s5, sym15
	lw $s6, sym12
	blt $s5, $s6, L883
	li $s6, 0
	j L884
L883:
	li $s6, 1
L884:
	beq $s6, $zero, L882
	li $s6, 8
	sw $s6, 16($sp)
L882:
	j L878
L879:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L887
	li $s5, 0
	j L888
L887:
	li $s5, 1
L888:
	beq $s5, $zero, L886
	lw $s5, sym15
	lw $s6, sym13
	blt $s5, $s6, L890
	li $s6, 0
	j L891
L890:
	li $s6, 1
L891:
	beq $s6, $zero, L889
	li $s6, 8
	sw $s6, 16($sp)
L889:
	j L885
L886:
	lw $s6, 16($sp)
	li $s5, 7
	beq $s6, $s5, L894
	li $s5, 0
	j L895
L894:
	li $s5, 1
L895:
	beq $s5, $zero, L893
	lw $s5, sym15
	lw $s6, sym14
	blt $s5, $s6, L897
	li $s6, 0
	j L898
L897:
	li $s6, 1
L898:
	beq $s6, $zero, L896
	li $s6, 8
	sw $s6, 16($sp)
L896:
	j L892
L893:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L901
	li $s5, 0
	j L902
L901:
	li $s5, 1
L902:
	beq $s5, $zero, L900
	lw $s5, sym15
	lw $s6, sym15
	blt $s5, $s6, L904
	li $s6, 0
	j L905
L904:
	li $s6, 1
L905:
	beq $s6, $zero, L903
	li $s6, 8
	sw $s6, 16($sp)
L903:
	j L899
L900:
	lw $s6, 16($sp)
	li $s5, 9
	beq $s6, $s5, L908
	li $s5, 0
	j L909
L908:
	li $s5, 1
L909:
	beq $s5, $zero, L907
	lw $s5, sym15
	lw $s6, sym16
	blt $s5, $s6, L911
	li $s6, 0
	j L912
L911:
	li $s6, 1
L912:
	beq $s6, $zero, L910
	li $s6, 8
	sw $s6, 16($sp)
L910:
	j L906
L907:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L915
	li $s5, 0
	j L916
L915:
	li $s5, 1
L916:
	beq $s5, $zero, L914
	lw $s5, sym15
	lw $s6, sym17
	blt $s5, $s6, L918
	li $s6, 0
	j L919
L918:
	li $s6, 1
L919:
	beq $s6, $zero, L917
	li $s6, 8
	sw $s6, 16($sp)
L917:
	j L913
L914:
	lw $s6, 16($sp)
	li $s5, 11
	beq $s6, $s5, L922
	li $s5, 0
	j L923
L922:
	li $s5, 1
L923:
	beq $s5, $zero, L921
	lw $s5, sym15
	lw $s6, sym18
	blt $s5, $s6, L925
	li $s6, 0
	j L926
L925:
	li $s6, 1
L926:
	beq $s6, $zero, L924
	li $s6, 8
	sw $s6, 16($sp)
L924:
	j L920
L921:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L929
	li $s5, 0
	j L930
L929:
	li $s5, 1
L930:
	beq $s5, $zero, L928
	lw $s5, sym15
	lw $s6, sym19
	blt $s5, $s6, L932
	li $s6, 0
	j L933
L932:
	li $s6, 1
L933:
	beq $s6, $zero, L931
	li $s6, 8
	sw $s6, 16($sp)
L931:
	j L927
L928:
	lw $s6, 16($sp)
	li $s5, 13
	beq $s6, $s5, L936
	li $s5, 0
	j L937
L936:
	li $s5, 1
L937:
	beq $s5, $zero, L935
	lw $s5, sym15
	lw $s6, sym20
	blt $s5, $s6, L939
	li $s6, 0
	j L940
L939:
	li $s6, 1
L940:
	beq $s6, $zero, L938
	li $s6, 8
	sw $s6, 16($sp)
L938:
	j L934
L935:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L942
	li $s5, 0
	j L943
L942:
	li $s5, 1
L943:
	beq $s5, $zero, L941
	lw $s5, sym15
	lw $s6, sym21
	blt $s5, $s6, L945
	li $s6, 0
	j L946
L945:
	li $s6, 1
L946:
	beq $s6, $zero, L944
	li $s6, 8
	sw $s6, 16($sp)
L944:
L941:
L934:
L927:
L920:
L913:
L906:
L899:
L892:
L885:
L878:
L871:
L864:
L857:
L850:
L843:
	j L838
L839:
	lw $s6, 8($sp)
	li $s5, 9
	beq $s6, $s5, L949
	li $s5, 0
	j L950
L949:
	li $s5, 1
L950:
	beq $s5, $zero, L948
.data
L951:
.byte 4, 106, 61, 57, 10
.text
	la $s5, L951
	move $a0, $s5
	jal sym1
	move $s5, $v0
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L954
	li $s6, 0
	j L955
L954:
	li $s6, 1
L955:
	beq $s6, $zero, L953
	lw $s6, sym16
	lw $s5, sym7
	blt $s6, $s5, L957
	li $s5, 0
	j L958
L957:
	li $s5, 1
L958:
	beq $s5, $zero, L956
	li $s5, 9
	sw $s5, 16($sp)
L956:
	j L952
L953:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L961
	li $s6, 0
	j L962
L961:
	li $s6, 1
L962:
	beq $s6, $zero, L960
	lw $s6, sym16
	lw $s5, sym8
	blt $s6, $s5, L964
	li $s5, 0
	j L965
L964:
	li $s5, 1
L965:
	beq $s5, $zero, L963
	li $s5, 9
	sw $s5, 16($sp)
L963:
	j L959
L960:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L968
	li $s6, 0
	j L969
L968:
	li $s6, 1
L969:
	beq $s6, $zero, L967
	lw $s6, sym16
	lw $s5, sym9
	blt $s6, $s5, L971
	li $s5, 0
	j L972
L971:
	li $s5, 1
L972:
	beq $s5, $zero, L970
	li $s5, 9
	sw $s5, 16($sp)
L970:
	j L966
L967:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L975
	li $s6, 0
	j L976
L975:
	li $s6, 1
L976:
	beq $s6, $zero, L974
	lw $s6, sym16
	lw $s5, sym10
	blt $s6, $s5, L978
	li $s5, 0
	j L979
L978:
	li $s5, 1
L979:
	beq $s5, $zero, L977
	li $s5, 9
	sw $s5, 16($sp)
L977:
	j L973
L974:
	lw $s5, 16($sp)
	li $s6, 4
	beq $s5, $s6, L982
	li $s6, 0
	j L983
L982:
	li $s6, 1
L983:
	beq $s6, $zero, L981
	lw $s6, sym16
	lw $s5, sym11
	blt $s6, $s5, L985
	li $s5, 0
	j L986
L985:
	li $s5, 1
L986:
	beq $s5, $zero, L984
	li $s5, 9
	sw $s5, 16($sp)
L984:
	j L980
L981:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L989
	li $s6, 0
	j L990
L989:
	li $s6, 1
L990:
	beq $s6, $zero, L988
	lw $s6, sym16
	lw $s5, sym12
	blt $s6, $s5, L992
	li $s5, 0
	j L993
L992:
	li $s5, 1
L993:
	beq $s5, $zero, L991
	li $s5, 9
	sw $s5, 16($sp)
L991:
	j L987
L988:
	lw $s5, 16($sp)
	li $s6, 6
	beq $s5, $s6, L996
	li $s6, 0
	j L997
L996:
	li $s6, 1
L997:
	beq $s6, $zero, L995
	lw $s6, sym16
	lw $s5, sym13
	blt $s6, $s5, L999
	li $s5, 0
	j L1000
L999:
	li $s5, 1
L1000:
	beq $s5, $zero, L998
	li $s5, 9
	sw $s5, 16($sp)
L998:
	j L994
L995:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1003
	li $s6, 0
	j L1004
L1003:
	li $s6, 1
L1004:
	beq $s6, $zero, L1002
	lw $s6, sym16
	lw $s5, sym14
	blt $s6, $s5, L1006
	li $s5, 0
	j L1007
L1006:
	li $s5, 1
L1007:
	beq $s5, $zero, L1005
	li $s5, 9
	sw $s5, 16($sp)
L1005:
	j L1001
L1002:
	lw $s5, 16($sp)
	li $s6, 8
	beq $s5, $s6, L1010
	li $s6, 0
	j L1011
L1010:
	li $s6, 1
L1011:
	beq $s6, $zero, L1009
	lw $s6, sym16
	lw $s5, sym15
	blt $s6, $s5, L1013
	li $s5, 0
	j L1014
L1013:
	li $s5, 1
L1014:
	beq $s5, $zero, L1012
	li $s5, 9
	sw $s5, 16($sp)
L1012:
	j L1008
L1009:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1017
	li $s6, 0
	j L1018
L1017:
	li $s6, 1
L1018:
	beq $s6, $zero, L1016
	lw $s6, sym16
	lw $s5, sym16
	blt $s6, $s5, L1020
	li $s5, 0
	j L1021
L1020:
	li $s5, 1
L1021:
	beq $s5, $zero, L1019
	li $s5, 9
	sw $s5, 16($sp)
L1019:
	j L1015
L1016:
	lw $s5, 16($sp)
	li $s6, 10
	beq $s5, $s6, L1024
	li $s6, 0
	j L1025
L1024:
	li $s6, 1
L1025:
	beq $s6, $zero, L1023
	lw $s6, sym16
	lw $s5, sym17
	blt $s6, $s5, L1027
	li $s5, 0
	j L1028
L1027:
	li $s5, 1
L1028:
	beq $s5, $zero, L1026
	li $s5, 9
	sw $s5, 16($sp)
L1026:
	j L1022
L1023:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1031
	li $s6, 0
	j L1032
L1031:
	li $s6, 1
L1032:
	beq $s6, $zero, L1030
	lw $s6, sym16
	lw $s5, sym18
	blt $s6, $s5, L1034
	li $s5, 0
	j L1035
L1034:
	li $s5, 1
L1035:
	beq $s5, $zero, L1033
	li $s5, 9
	sw $s5, 16($sp)
L1033:
	j L1029
L1030:
	lw $s5, 16($sp)
	li $s6, 12
	beq $s5, $s6, L1038
	li $s6, 0
	j L1039
L1038:
	li $s6, 1
L1039:
	beq $s6, $zero, L1037
	lw $s6, sym16
	lw $s5, sym19
	blt $s6, $s5, L1041
	li $s5, 0
	j L1042
L1041:
	li $s5, 1
L1042:
	beq $s5, $zero, L1040
	li $s5, 9
	sw $s5, 16($sp)
L1040:
	j L1036
L1037:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1045
	li $s6, 0
	j L1046
L1045:
	li $s6, 1
L1046:
	beq $s6, $zero, L1044
	lw $s6, sym16
	lw $s5, sym20
	blt $s6, $s5, L1048
	li $s5, 0
	j L1049
L1048:
	li $s5, 1
L1049:
	beq $s5, $zero, L1047
	li $s5, 9
	sw $s5, 16($sp)
L1047:
	j L1043
L1044:
	lw $s5, 16($sp)
	li $s6, 14
	beq $s5, $s6, L1051
	li $s6, 0
	j L1052
L1051:
	li $s6, 1
L1052:
	beq $s6, $zero, L1050
	lw $s6, sym16
	lw $s5, sym21
	blt $s6, $s5, L1054
	li $s5, 0
	j L1055
L1054:
	li $s5, 1
L1055:
	beq $s5, $zero, L1053
	li $s5, 9
	sw $s5, 16($sp)
L1053:
L1050:
L1043:
L1036:
L1029:
L1022:
L1015:
L1008:
L1001:
L994:
L987:
L980:
L973:
L966:
L959:
L952:
	j L947
L948:
	lw $s5, 8($sp)
	li $s6, 10
	beq $s5, $s6, L1058
	li $s6, 0
	j L1059
L1058:
	li $s6, 1
L1059:
	beq $s6, $zero, L1057
.data
L1060:
.byte 5, 106, 61, 49, 48, 10
.text
	la $s6, L1060
	move $a0, $s6
	jal sym1
	move $s6, $v0
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1063
	li $s5, 0
	j L1064
L1063:
	li $s5, 1
L1064:
	beq $s5, $zero, L1062
	lw $s5, sym17
	lw $s6, sym7
	blt $s5, $s6, L1066
	li $s6, 0
	j L1067
L1066:
	li $s6, 1
L1067:
	beq $s6, $zero, L1065
	li $s6, 10
	sw $s6, 16($sp)
L1065:
	j L1061
L1062:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L1070
	li $s5, 0
	j L1071
L1070:
	li $s5, 1
L1071:
	beq $s5, $zero, L1069
	lw $s5, sym17
	lw $s6, sym8
	blt $s5, $s6, L1073
	li $s6, 0
	j L1074
L1073:
	li $s6, 1
L1074:
	beq $s6, $zero, L1072
	li $s6, 10
	sw $s6, 16($sp)
L1072:
	j L1068
L1069:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1077
	li $s5, 0
	j L1078
L1077:
	li $s5, 1
L1078:
	beq $s5, $zero, L1076
	lw $s5, sym17
	lw $s6, sym9
	blt $s5, $s6, L1080
	li $s6, 0
	j L1081
L1080:
	li $s6, 1
L1081:
	beq $s6, $zero, L1079
	li $s6, 10
	sw $s6, 16($sp)
L1079:
	j L1075
L1076:
	lw $s6, 16($sp)
	li $s5, 3
	beq $s6, $s5, L1084
	li $s5, 0
	j L1085
L1084:
	li $s5, 1
L1085:
	beq $s5, $zero, L1083
	lw $s5, sym17
	lw $s6, sym10
	blt $s5, $s6, L1087
	li $s6, 0
	j L1088
L1087:
	li $s6, 1
L1088:
	beq $s6, $zero, L1086
	li $s6, 10
	sw $s6, 16($sp)
L1086:
	j L1082
L1083:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1091
	li $s5, 0
	j L1092
L1091:
	li $s5, 1
L1092:
	beq $s5, $zero, L1090
	lw $s5, sym17
	lw $s6, sym11
	blt $s5, $s6, L1094
	li $s6, 0
	j L1095
L1094:
	li $s6, 1
L1095:
	beq $s6, $zero, L1093
	li $s6, 10
	sw $s6, 16($sp)
L1093:
	j L1089
L1090:
	lw $s6, 16($sp)
	li $s5, 5
	beq $s6, $s5, L1098
	li $s5, 0
	j L1099
L1098:
	li $s5, 1
L1099:
	beq $s5, $zero, L1097
	lw $s5, sym17
	lw $s6, sym12
	blt $s5, $s6, L1101
	li $s6, 0
	j L1102
L1101:
	li $s6, 1
L1102:
	beq $s6, $zero, L1100
	li $s6, 10
	sw $s6, 16($sp)
L1100:
	j L1096
L1097:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1105
	li $s5, 0
	j L1106
L1105:
	li $s5, 1
L1106:
	beq $s5, $zero, L1104
	lw $s5, sym17
	lw $s6, sym13
	blt $s5, $s6, L1108
	li $s6, 0
	j L1109
L1108:
	li $s6, 1
L1109:
	beq $s6, $zero, L1107
	li $s6, 10
	sw $s6, 16($sp)
L1107:
	j L1103
L1104:
	lw $s6, 16($sp)
	li $s5, 7
	beq $s6, $s5, L1112
	li $s5, 0
	j L1113
L1112:
	li $s5, 1
L1113:
	beq $s5, $zero, L1111
	lw $s5, sym17
	lw $s6, sym14
	blt $s5, $s6, L1115
	li $s6, 0
	j L1116
L1115:
	li $s6, 1
L1116:
	beq $s6, $zero, L1114
	li $s6, 10
	sw $s6, 16($sp)
L1114:
	j L1110
L1111:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1119
	li $s5, 0
	j L1120
L1119:
	li $s5, 1
L1120:
	beq $s5, $zero, L1118
	lw $s5, sym17
	lw $s6, sym15
	blt $s5, $s6, L1122
	li $s6, 0
	j L1123
L1122:
	li $s6, 1
L1123:
	beq $s6, $zero, L1121
	li $s6, 10
	sw $s6, 16($sp)
L1121:
	j L1117
L1118:
	lw $s6, 16($sp)
	li $s5, 9
	beq $s6, $s5, L1126
	li $s5, 0
	j L1127
L1126:
	li $s5, 1
L1127:
	beq $s5, $zero, L1125
	lw $s5, sym17
	lw $s6, sym16
	blt $s5, $s6, L1129
	li $s6, 0
	j L1130
L1129:
	li $s6, 1
L1130:
	beq $s6, $zero, L1128
	li $s6, 10
	sw $s6, 16($sp)
L1128:
	j L1124
L1125:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1133
	li $s5, 0
	j L1134
L1133:
	li $s5, 1
L1134:
	beq $s5, $zero, L1132
	lw $s5, sym17
	lw $s6, sym17
	blt $s5, $s6, L1136
	li $s6, 0
	j L1137
L1136:
	li $s6, 1
L1137:
	beq $s6, $zero, L1135
	li $s6, 10
	sw $s6, 16($sp)
L1135:
	j L1131
L1132:
	lw $s6, 16($sp)
	li $s5, 11
	beq $s6, $s5, L1140
	li $s5, 0
	j L1141
L1140:
	li $s5, 1
L1141:
	beq $s5, $zero, L1139
	lw $s5, sym17
	lw $s6, sym18
	blt $s5, $s6, L1143
	li $s6, 0
	j L1144
L1143:
	li $s6, 1
L1144:
	beq $s6, $zero, L1142
	li $s6, 10
	sw $s6, 16($sp)
L1142:
	j L1138
L1139:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1147
	li $s5, 0
	j L1148
L1147:
	li $s5, 1
L1148:
	beq $s5, $zero, L1146
	lw $s5, sym17
	lw $s6, sym19
	blt $s5, $s6, L1150
	li $s6, 0
	j L1151
L1150:
	li $s6, 1
L1151:
	beq $s6, $zero, L1149
	li $s6, 10
	sw $s6, 16($sp)
L1149:
	j L1145
L1146:
	lw $s6, 16($sp)
	li $s5, 13
	beq $s6, $s5, L1154
	li $s5, 0
	j L1155
L1154:
	li $s5, 1
L1155:
	beq $s5, $zero, L1153
	lw $s5, sym17
	lw $s6, sym20
	blt $s5, $s6, L1157
	li $s6, 0
	j L1158
L1157:
	li $s6, 1
L1158:
	beq $s6, $zero, L1156
	li $s6, 10
	sw $s6, 16($sp)
L1156:
	j L1152
L1153:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1160
	li $s5, 0
	j L1161
L1160:
	li $s5, 1
L1161:
	beq $s5, $zero, L1159
	lw $s5, sym17
	lw $s6, sym21
	blt $s5, $s6, L1163
	li $s6, 0
	j L1164
L1163:
	li $s6, 1
L1164:
	beq $s6, $zero, L1162
	li $s6, 10
	sw $s6, 16($sp)
L1162:
L1159:
L1152:
L1145:
L1138:
L1131:
L1124:
L1117:
L1110:
L1103:
L1096:
L1089:
L1082:
L1075:
L1068:
L1061:
	j L1056
L1057:
	lw $s6, 8($sp)
	li $s5, 11
	beq $s6, $s5, L1167
	li $s5, 0
	j L1168
L1167:
	li $s5, 1
L1168:
	beq $s5, $zero, L1166
.data
L1169:
.byte 5, 106, 61, 49, 49, 10
.text
	la $s5, L1169
	move $a0, $s5
	jal sym1
	move $s5, $v0
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L1172
	li $s6, 0
	j L1173
L1172:
	li $s6, 1
L1173:
	beq $s6, $zero, L1171
	lw $s6, sym18
	lw $s5, sym7
	blt $s6, $s5, L1175
	li $s5, 0
	j L1176
L1175:
	li $s5, 1
L1176:
	beq $s5, $zero, L1174
	li $s5, 11
	sw $s5, 16($sp)
L1174:
	j L1170
L1171:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1179
	li $s6, 0
	j L1180
L1179:
	li $s6, 1
L1180:
	beq $s6, $zero, L1178
	lw $s6, sym18
	lw $s5, sym8
	blt $s6, $s5, L1182
	li $s5, 0
	j L1183
L1182:
	li $s5, 1
L1183:
	beq $s5, $zero, L1181
	li $s5, 11
	sw $s5, 16($sp)
L1181:
	j L1177
L1178:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L1186
	li $s6, 0
	j L1187
L1186:
	li $s6, 1
L1187:
	beq $s6, $zero, L1185
	lw $s6, sym18
	lw $s5, sym9
	blt $s6, $s5, L1189
	li $s5, 0
	j L1190
L1189:
	li $s5, 1
L1190:
	beq $s5, $zero, L1188
	li $s5, 11
	sw $s5, 16($sp)
L1188:
	j L1184
L1185:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1193
	li $s6, 0
	j L1194
L1193:
	li $s6, 1
L1194:
	beq $s6, $zero, L1192
	lw $s6, sym18
	lw $s5, sym10
	blt $s6, $s5, L1196
	li $s5, 0
	j L1197
L1196:
	li $s5, 1
L1197:
	beq $s5, $zero, L1195
	li $s5, 11
	sw $s5, 16($sp)
L1195:
	j L1191
L1192:
	lw $s5, 16($sp)
	li $s6, 4
	beq $s5, $s6, L1200
	li $s6, 0
	j L1201
L1200:
	li $s6, 1
L1201:
	beq $s6, $zero, L1199
	lw $s6, sym18
	lw $s5, sym11
	blt $s6, $s5, L1203
	li $s5, 0
	j L1204
L1203:
	li $s5, 1
L1204:
	beq $s5, $zero, L1202
	li $s5, 11
	sw $s5, 16($sp)
L1202:
	j L1198
L1199:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1207
	li $s6, 0
	j L1208
L1207:
	li $s6, 1
L1208:
	beq $s6, $zero, L1206
	lw $s6, sym18
	lw $s5, sym12
	blt $s6, $s5, L1210
	li $s5, 0
	j L1211
L1210:
	li $s5, 1
L1211:
	beq $s5, $zero, L1209
	li $s5, 11
	sw $s5, 16($sp)
L1209:
	j L1205
L1206:
	lw $s5, 16($sp)
	li $s6, 6
	beq $s5, $s6, L1214
	li $s6, 0
	j L1215
L1214:
	li $s6, 1
L1215:
	beq $s6, $zero, L1213
	lw $s6, sym18
	lw $s5, sym13
	blt $s6, $s5, L1217
	li $s5, 0
	j L1218
L1217:
	li $s5, 1
L1218:
	beq $s5, $zero, L1216
	li $s5, 11
	sw $s5, 16($sp)
L1216:
	j L1212
L1213:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1221
	li $s6, 0
	j L1222
L1221:
	li $s6, 1
L1222:
	beq $s6, $zero, L1220
	lw $s6, sym18
	lw $s5, sym14
	blt $s6, $s5, L1224
	li $s5, 0
	j L1225
L1224:
	li $s5, 1
L1225:
	beq $s5, $zero, L1223
	li $s5, 11
	sw $s5, 16($sp)
L1223:
	j L1219
L1220:
	lw $s5, 16($sp)
	li $s6, 8
	beq $s5, $s6, L1228
	li $s6, 0
	j L1229
L1228:
	li $s6, 1
L1229:
	beq $s6, $zero, L1227
	lw $s6, sym18
	lw $s5, sym15
	blt $s6, $s5, L1231
	li $s5, 0
	j L1232
L1231:
	li $s5, 1
L1232:
	beq $s5, $zero, L1230
	li $s5, 11
	sw $s5, 16($sp)
L1230:
	j L1226
L1227:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1235
	li $s6, 0
	j L1236
L1235:
	li $s6, 1
L1236:
	beq $s6, $zero, L1234
	lw $s6, sym18
	lw $s5, sym16
	blt $s6, $s5, L1238
	li $s5, 0
	j L1239
L1238:
	li $s5, 1
L1239:
	beq $s5, $zero, L1237
	li $s5, 11
	sw $s5, 16($sp)
L1237:
	j L1233
L1234:
	lw $s5, 16($sp)
	li $s6, 10
	beq $s5, $s6, L1242
	li $s6, 0
	j L1243
L1242:
	li $s6, 1
L1243:
	beq $s6, $zero, L1241
	lw $s6, sym18
	lw $s5, sym17
	blt $s6, $s5, L1245
	li $s5, 0
	j L1246
L1245:
	li $s5, 1
L1246:
	beq $s5, $zero, L1244
	li $s5, 11
	sw $s5, 16($sp)
L1244:
	j L1240
L1241:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1249
	li $s6, 0
	j L1250
L1249:
	li $s6, 1
L1250:
	beq $s6, $zero, L1248
	lw $s6, sym18
	lw $s5, sym18
	blt $s6, $s5, L1252
	li $s5, 0
	j L1253
L1252:
	li $s5, 1
L1253:
	beq $s5, $zero, L1251
	li $s5, 11
	sw $s5, 16($sp)
L1251:
	j L1247
L1248:
	lw $s5, 16($sp)
	li $s6, 12
	beq $s5, $s6, L1256
	li $s6, 0
	j L1257
L1256:
	li $s6, 1
L1257:
	beq $s6, $zero, L1255
	lw $s6, sym18
	lw $s5, sym19
	blt $s6, $s5, L1259
	li $s5, 0
	j L1260
L1259:
	li $s5, 1
L1260:
	beq $s5, $zero, L1258
	li $s5, 11
	sw $s5, 16($sp)
L1258:
	j L1254
L1255:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1263
	li $s6, 0
	j L1264
L1263:
	li $s6, 1
L1264:
	beq $s6, $zero, L1262
	lw $s6, sym18
	lw $s5, sym20
	blt $s6, $s5, L1266
	li $s5, 0
	j L1267
L1266:
	li $s5, 1
L1267:
	beq $s5, $zero, L1265
	li $s5, 11
	sw $s5, 16($sp)
L1265:
	j L1261
L1262:
	lw $s5, 16($sp)
	li $s6, 14
	beq $s5, $s6, L1269
	li $s6, 0
	j L1270
L1269:
	li $s6, 1
L1270:
	beq $s6, $zero, L1268
	lw $s6, sym18
	lw $s5, sym21
	blt $s6, $s5, L1272
	li $s5, 0
	j L1273
L1272:
	li $s5, 1
L1273:
	beq $s5, $zero, L1271
	li $s5, 11
	sw $s5, 16($sp)
L1271:
L1268:
L1261:
L1254:
L1247:
L1240:
L1233:
L1226:
L1219:
L1212:
L1205:
L1198:
L1191:
L1184:
L1177:
L1170:
	j L1165
L1166:
	lw $s5, 8($sp)
	li $s6, 12
	beq $s5, $s6, L1276
	li $s6, 0
	j L1277
L1276:
	li $s6, 1
L1277:
	beq $s6, $zero, L1275
.data
L1278:
.byte 5, 106, 61, 49, 50, 10
.text
	la $s6, L1278
	move $a0, $s6
	jal sym1
	move $s6, $v0
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1281
	li $s5, 0
	j L1282
L1281:
	li $s5, 1
L1282:
	beq $s5, $zero, L1280
	lw $s5, sym19
	lw $s6, sym7
	blt $s5, $s6, L1284
	li $s6, 0
	j L1285
L1284:
	li $s6, 1
L1285:
	beq $s6, $zero, L1283
	li $s6, 12
	sw $s6, 16($sp)
L1283:
	j L1279
L1280:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L1288
	li $s5, 0
	j L1289
L1288:
	li $s5, 1
L1289:
	beq $s5, $zero, L1287
	lw $s5, sym19
	lw $s6, sym8
	blt $s5, $s6, L1291
	li $s6, 0
	j L1292
L1291:
	li $s6, 1
L1292:
	beq $s6, $zero, L1290
	li $s6, 12
	sw $s6, 16($sp)
L1290:
	j L1286
L1287:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1295
	li $s5, 0
	j L1296
L1295:
	li $s5, 1
L1296:
	beq $s5, $zero, L1294
	lw $s5, sym19
	lw $s6, sym9
	blt $s5, $s6, L1298
	li $s6, 0
	j L1299
L1298:
	li $s6, 1
L1299:
	beq $s6, $zero, L1297
	li $s6, 12
	sw $s6, 16($sp)
L1297:
	j L1293
L1294:
	lw $s6, 16($sp)
	li $s5, 3
	beq $s6, $s5, L1302
	li $s5, 0
	j L1303
L1302:
	li $s5, 1
L1303:
	beq $s5, $zero, L1301
	lw $s5, sym19
	lw $s6, sym10
	blt $s5, $s6, L1305
	li $s6, 0
	j L1306
L1305:
	li $s6, 1
L1306:
	beq $s6, $zero, L1304
	li $s6, 12
	sw $s6, 16($sp)
L1304:
	j L1300
L1301:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1309
	li $s5, 0
	j L1310
L1309:
	li $s5, 1
L1310:
	beq $s5, $zero, L1308
	lw $s5, sym19
	lw $s6, sym11
	blt $s5, $s6, L1312
	li $s6, 0
	j L1313
L1312:
	li $s6, 1
L1313:
	beq $s6, $zero, L1311
	li $s6, 12
	sw $s6, 16($sp)
L1311:
	j L1307
L1308:
	lw $s6, 16($sp)
	li $s5, 5
	beq $s6, $s5, L1316
	li $s5, 0
	j L1317
L1316:
	li $s5, 1
L1317:
	beq $s5, $zero, L1315
	lw $s5, sym19
	lw $s6, sym12
	blt $s5, $s6, L1319
	li $s6, 0
	j L1320
L1319:
	li $s6, 1
L1320:
	beq $s6, $zero, L1318
	li $s6, 12
	sw $s6, 16($sp)
L1318:
	j L1314
L1315:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1323
	li $s5, 0
	j L1324
L1323:
	li $s5, 1
L1324:
	beq $s5, $zero, L1322
	lw $s5, sym19
	lw $s6, sym13
	blt $s5, $s6, L1326
	li $s6, 0
	j L1327
L1326:
	li $s6, 1
L1327:
	beq $s6, $zero, L1325
	li $s6, 12
	sw $s6, 16($sp)
L1325:
	j L1321
L1322:
	lw $s6, 16($sp)
	li $s5, 7
	beq $s6, $s5, L1330
	li $s5, 0
	j L1331
L1330:
	li $s5, 1
L1331:
	beq $s5, $zero, L1329
	lw $s5, sym19
	lw $s6, sym14
	blt $s5, $s6, L1333
	li $s6, 0
	j L1334
L1333:
	li $s6, 1
L1334:
	beq $s6, $zero, L1332
	li $s6, 12
	sw $s6, 16($sp)
L1332:
	j L1328
L1329:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1337
	li $s5, 0
	j L1338
L1337:
	li $s5, 1
L1338:
	beq $s5, $zero, L1336
	lw $s5, sym19
	lw $s6, sym15
	blt $s5, $s6, L1340
	li $s6, 0
	j L1341
L1340:
	li $s6, 1
L1341:
	beq $s6, $zero, L1339
	li $s6, 12
	sw $s6, 16($sp)
L1339:
	j L1335
L1336:
	lw $s6, 16($sp)
	li $s5, 9
	beq $s6, $s5, L1344
	li $s5, 0
	j L1345
L1344:
	li $s5, 1
L1345:
	beq $s5, $zero, L1343
	lw $s5, sym19
	lw $s6, sym16
	blt $s5, $s6, L1347
	li $s6, 0
	j L1348
L1347:
	li $s6, 1
L1348:
	beq $s6, $zero, L1346
	li $s6, 12
	sw $s6, 16($sp)
L1346:
	j L1342
L1343:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1351
	li $s5, 0
	j L1352
L1351:
	li $s5, 1
L1352:
	beq $s5, $zero, L1350
	lw $s5, sym19
	lw $s6, sym17
	blt $s5, $s6, L1354
	li $s6, 0
	j L1355
L1354:
	li $s6, 1
L1355:
	beq $s6, $zero, L1353
	li $s6, 12
	sw $s6, 16($sp)
L1353:
	j L1349
L1350:
	lw $s6, 16($sp)
	li $s5, 11
	beq $s6, $s5, L1358
	li $s5, 0
	j L1359
L1358:
	li $s5, 1
L1359:
	beq $s5, $zero, L1357
	lw $s5, sym19
	lw $s6, sym18
	blt $s5, $s6, L1361
	li $s6, 0
	j L1362
L1361:
	li $s6, 1
L1362:
	beq $s6, $zero, L1360
	li $s6, 12
	sw $s6, 16($sp)
L1360:
	j L1356
L1357:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1365
	li $s5, 0
	j L1366
L1365:
	li $s5, 1
L1366:
	beq $s5, $zero, L1364
	lw $s5, sym19
	lw $s6, sym19
	blt $s5, $s6, L1368
	li $s6, 0
	j L1369
L1368:
	li $s6, 1
L1369:
	beq $s6, $zero, L1367
	li $s6, 12
	sw $s6, 16($sp)
L1367:
	j L1363
L1364:
	lw $s6, 16($sp)
	li $s5, 13
	beq $s6, $s5, L1372
	li $s5, 0
	j L1373
L1372:
	li $s5, 1
L1373:
	beq $s5, $zero, L1371
	lw $s5, sym19
	lw $s6, sym20
	blt $s5, $s6, L1375
	li $s6, 0
	j L1376
L1375:
	li $s6, 1
L1376:
	beq $s6, $zero, L1374
	li $s6, 12
	sw $s6, 16($sp)
L1374:
	j L1370
L1371:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1378
	li $s5, 0
	j L1379
L1378:
	li $s5, 1
L1379:
	beq $s5, $zero, L1377
	lw $s5, sym19
	lw $s6, sym21
	blt $s5, $s6, L1381
	li $s6, 0
	j L1382
L1381:
	li $s6, 1
L1382:
	beq $s6, $zero, L1380
	li $s6, 12
	sw $s6, 16($sp)
L1380:
L1377:
L1370:
L1363:
L1356:
L1349:
L1342:
L1335:
L1328:
L1321:
L1314:
L1307:
L1300:
L1293:
L1286:
L1279:
	j L1274
L1275:
	lw $s6, 8($sp)
	li $s5, 13
	beq $s6, $s5, L1385
	li $s5, 0
	j L1386
L1385:
	li $s5, 1
L1386:
	beq $s5, $zero, L1384
.data
L1387:
.byte 5, 106, 61, 49, 51, 10
.text
	la $s5, L1387
	move $a0, $s5
	jal sym1
	move $s5, $v0
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L1390
	li $s6, 0
	j L1391
L1390:
	li $s6, 1
L1391:
	beq $s6, $zero, L1389
	lw $s6, sym20
	lw $s5, sym7
	blt $s6, $s5, L1393
	li $s5, 0
	j L1394
L1393:
	li $s5, 1
L1394:
	beq $s5, $zero, L1392
	li $s5, 13
	sw $s5, 16($sp)
L1392:
	j L1388
L1389:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1397
	li $s6, 0
	j L1398
L1397:
	li $s6, 1
L1398:
	beq $s6, $zero, L1396
	lw $s6, sym20
	lw $s5, sym8
	blt $s6, $s5, L1400
	li $s5, 0
	j L1401
L1400:
	li $s5, 1
L1401:
	beq $s5, $zero, L1399
	li $s5, 13
	sw $s5, 16($sp)
L1399:
	j L1395
L1396:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L1404
	li $s6, 0
	j L1405
L1404:
	li $s6, 1
L1405:
	beq $s6, $zero, L1403
	lw $s6, sym20
	lw $s5, sym9
	blt $s6, $s5, L1407
	li $s5, 0
	j L1408
L1407:
	li $s5, 1
L1408:
	beq $s5, $zero, L1406
	li $s5, 13
	sw $s5, 16($sp)
L1406:
	j L1402
L1403:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1411
	li $s6, 0
	j L1412
L1411:
	li $s6, 1
L1412:
	beq $s6, $zero, L1410
	lw $s6, sym20
	lw $s5, sym10
	blt $s6, $s5, L1414
	li $s5, 0
	j L1415
L1414:
	li $s5, 1
L1415:
	beq $s5, $zero, L1413
	li $s5, 13
	sw $s5, 16($sp)
L1413:
	j L1409
L1410:
	lw $s5, 16($sp)
	li $s6, 4
	beq $s5, $s6, L1418
	li $s6, 0
	j L1419
L1418:
	li $s6, 1
L1419:
	beq $s6, $zero, L1417
	lw $s6, sym20
	lw $s5, sym11
	blt $s6, $s5, L1421
	li $s5, 0
	j L1422
L1421:
	li $s5, 1
L1422:
	beq $s5, $zero, L1420
	li $s5, 13
	sw $s5, 16($sp)
L1420:
	j L1416
L1417:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1425
	li $s6, 0
	j L1426
L1425:
	li $s6, 1
L1426:
	beq $s6, $zero, L1424
	lw $s6, sym20
	lw $s5, sym12
	blt $s6, $s5, L1428
	li $s5, 0
	j L1429
L1428:
	li $s5, 1
L1429:
	beq $s5, $zero, L1427
	li $s5, 13
	sw $s5, 16($sp)
L1427:
	j L1423
L1424:
	lw $s5, 16($sp)
	li $s6, 6
	beq $s5, $s6, L1432
	li $s6, 0
	j L1433
L1432:
	li $s6, 1
L1433:
	beq $s6, $zero, L1431
	lw $s6, sym20
	lw $s5, sym13
	blt $s6, $s5, L1435
	li $s5, 0
	j L1436
L1435:
	li $s5, 1
L1436:
	beq $s5, $zero, L1434
	li $s5, 13
	sw $s5, 16($sp)
L1434:
	j L1430
L1431:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1439
	li $s6, 0
	j L1440
L1439:
	li $s6, 1
L1440:
	beq $s6, $zero, L1438
	lw $s6, sym20
	lw $s5, sym14
	blt $s6, $s5, L1442
	li $s5, 0
	j L1443
L1442:
	li $s5, 1
L1443:
	beq $s5, $zero, L1441
	li $s5, 13
	sw $s5, 16($sp)
L1441:
	j L1437
L1438:
	lw $s5, 16($sp)
	li $s6, 8
	beq $s5, $s6, L1446
	li $s6, 0
	j L1447
L1446:
	li $s6, 1
L1447:
	beq $s6, $zero, L1445
	lw $s6, sym20
	lw $s5, sym15
	blt $s6, $s5, L1449
	li $s5, 0
	j L1450
L1449:
	li $s5, 1
L1450:
	beq $s5, $zero, L1448
	li $s5, 13
	sw $s5, 16($sp)
L1448:
	j L1444
L1445:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1453
	li $s6, 0
	j L1454
L1453:
	li $s6, 1
L1454:
	beq $s6, $zero, L1452
	lw $s6, sym20
	lw $s5, sym16
	blt $s6, $s5, L1456
	li $s5, 0
	j L1457
L1456:
	li $s5, 1
L1457:
	beq $s5, $zero, L1455
	li $s5, 13
	sw $s5, 16($sp)
L1455:
	j L1451
L1452:
	lw $s5, 16($sp)
	li $s6, 10
	beq $s5, $s6, L1460
	li $s6, 0
	j L1461
L1460:
	li $s6, 1
L1461:
	beq $s6, $zero, L1459
	lw $s6, sym20
	lw $s5, sym17
	blt $s6, $s5, L1463
	li $s5, 0
	j L1464
L1463:
	li $s5, 1
L1464:
	beq $s5, $zero, L1462
	li $s5, 13
	sw $s5, 16($sp)
L1462:
	j L1458
L1459:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1467
	li $s6, 0
	j L1468
L1467:
	li $s6, 1
L1468:
	beq $s6, $zero, L1466
	lw $s6, sym20
	lw $s5, sym18
	blt $s6, $s5, L1470
	li $s5, 0
	j L1471
L1470:
	li $s5, 1
L1471:
	beq $s5, $zero, L1469
	li $s5, 13
	sw $s5, 16($sp)
L1469:
	j L1465
L1466:
	lw $s5, 16($sp)
	li $s6, 12
	beq $s5, $s6, L1474
	li $s6, 0
	j L1475
L1474:
	li $s6, 1
L1475:
	beq $s6, $zero, L1473
	lw $s6, sym20
	lw $s5, sym19
	blt $s6, $s5, L1477
	li $s5, 0
	j L1478
L1477:
	li $s5, 1
L1478:
	beq $s5, $zero, L1476
	li $s5, 13
	sw $s5, 16($sp)
L1476:
	j L1472
L1473:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1481
	li $s6, 0
	j L1482
L1481:
	li $s6, 1
L1482:
	beq $s6, $zero, L1480
	lw $s6, sym20
	lw $s5, sym20
	blt $s6, $s5, L1484
	li $s5, 0
	j L1485
L1484:
	li $s5, 1
L1485:
	beq $s5, $zero, L1483
	li $s5, 13
	sw $s5, 16($sp)
L1483:
	j L1479
L1480:
	lw $s5, 16($sp)
	li $s6, 14
	beq $s5, $s6, L1487
	li $s6, 0
	j L1488
L1487:
	li $s6, 1
L1488:
	beq $s6, $zero, L1486
	lw $s6, sym20
	lw $s5, sym21
	blt $s6, $s5, L1490
	li $s5, 0
	j L1491
L1490:
	li $s5, 1
L1491:
	beq $s5, $zero, L1489
	li $s5, 13
	sw $s5, 16($sp)
L1489:
L1486:
L1479:
L1472:
L1465:
L1458:
L1451:
L1444:
L1437:
L1430:
L1423:
L1416:
L1409:
L1402:
L1395:
L1388:
	j L1383
L1384:
	lw $s5, 8($sp)
	li $s6, 14
	beq $s5, $s6, L1493
	li $s6, 0
	j L1494
L1493:
	li $s6, 1
L1494:
	beq $s6, $zero, L1492
.data
L1495:
.byte 5, 106, 61, 49, 52, 10
.text
	la $s6, L1495
	move $a0, $s6
	jal sym1
	move $s6, $v0
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1498
	li $s5, 0
	j L1499
L1498:
	li $s5, 1
L1499:
	beq $s5, $zero, L1497
	lw $s5, sym21
	lw $s6, sym7
	blt $s5, $s6, L1501
	li $s6, 0
	j L1502
L1501:
	li $s6, 1
L1502:
	beq $s6, $zero, L1500
	li $s6, 14
	sw $s6, 16($sp)
L1500:
	j L1496
L1497:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L1505
	li $s5, 0
	j L1506
L1505:
	li $s5, 1
L1506:
	beq $s5, $zero, L1504
	lw $s5, sym21
	lw $s6, sym8
	blt $s5, $s6, L1508
	li $s6, 0
	j L1509
L1508:
	li $s6, 1
L1509:
	beq $s6, $zero, L1507
	li $s6, 14
	sw $s6, 16($sp)
L1507:
	j L1503
L1504:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1512
	li $s5, 0
	j L1513
L1512:
	li $s5, 1
L1513:
	beq $s5, $zero, L1511
	lw $s5, sym21
	lw $s6, sym9
	blt $s5, $s6, L1515
	li $s6, 0
	j L1516
L1515:
	li $s6, 1
L1516:
	beq $s6, $zero, L1514
	li $s6, 14
	sw $s6, 16($sp)
L1514:
	j L1510
L1511:
	lw $s6, 16($sp)
	li $s5, 3
	beq $s6, $s5, L1519
	li $s5, 0
	j L1520
L1519:
	li $s5, 1
L1520:
	beq $s5, $zero, L1518
	lw $s5, sym21
	lw $s6, sym10
	blt $s5, $s6, L1522
	li $s6, 0
	j L1523
L1522:
	li $s6, 1
L1523:
	beq $s6, $zero, L1521
	li $s6, 14
	sw $s6, 16($sp)
L1521:
	j L1517
L1518:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1526
	li $s5, 0
	j L1527
L1526:
	li $s5, 1
L1527:
	beq $s5, $zero, L1525
	lw $s5, sym21
	lw $s6, sym11
	blt $s5, $s6, L1529
	li $s6, 0
	j L1530
L1529:
	li $s6, 1
L1530:
	beq $s6, $zero, L1528
	li $s6, 14
	sw $s6, 16($sp)
L1528:
	j L1524
L1525:
	lw $s6, 16($sp)
	li $s5, 5
	beq $s6, $s5, L1533
	li $s5, 0
	j L1534
L1533:
	li $s5, 1
L1534:
	beq $s5, $zero, L1532
	lw $s5, sym21
	lw $s6, sym12
	blt $s5, $s6, L1536
	li $s6, 0
	j L1537
L1536:
	li $s6, 1
L1537:
	beq $s6, $zero, L1535
	li $s6, 14
	sw $s6, 16($sp)
L1535:
	j L1531
L1532:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1540
	li $s5, 0
	j L1541
L1540:
	li $s5, 1
L1541:
	beq $s5, $zero, L1539
	lw $s5, sym21
	lw $s6, sym13
	blt $s5, $s6, L1543
	li $s6, 0
	j L1544
L1543:
	li $s6, 1
L1544:
	beq $s6, $zero, L1542
	li $s6, 14
	sw $s6, 16($sp)
L1542:
	j L1538
L1539:
	lw $s6, 16($sp)
	li $s5, 7
	beq $s6, $s5, L1547
	li $s5, 0
	j L1548
L1547:
	li $s5, 1
L1548:
	beq $s5, $zero, L1546
	lw $s5, sym21
	lw $s6, sym14
	blt $s5, $s6, L1550
	li $s6, 0
	j L1551
L1550:
	li $s6, 1
L1551:
	beq $s6, $zero, L1549
	li $s6, 14
	sw $s6, 16($sp)
L1549:
	j L1545
L1546:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1554
	li $s5, 0
	j L1555
L1554:
	li $s5, 1
L1555:
	beq $s5, $zero, L1553
	lw $s5, sym21
	lw $s6, sym15
	blt $s5, $s6, L1557
	li $s6, 0
	j L1558
L1557:
	li $s6, 1
L1558:
	beq $s6, $zero, L1556
	li $s6, 14
	sw $s6, 16($sp)
L1556:
	j L1552
L1553:
	lw $s6, 16($sp)
	li $s5, 9
	beq $s6, $s5, L1561
	li $s5, 0
	j L1562
L1561:
	li $s5, 1
L1562:
	beq $s5, $zero, L1560
	lw $s5, sym21
	lw $s6, sym16
	blt $s5, $s6, L1564
	li $s6, 0
	j L1565
L1564:
	li $s6, 1
L1565:
	beq $s6, $zero, L1563
	li $s6, 14
	sw $s6, 16($sp)
L1563:
	j L1559
L1560:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1568
	li $s5, 0
	j L1569
L1568:
	li $s5, 1
L1569:
	beq $s5, $zero, L1567
	lw $s5, sym21
	lw $s6, sym17
	blt $s5, $s6, L1571
	li $s6, 0
	j L1572
L1571:
	li $s6, 1
L1572:
	beq $s6, $zero, L1570
	li $s6, 14
	sw $s6, 16($sp)
L1570:
	j L1566
L1567:
	lw $s6, 16($sp)
	li $s5, 11
	beq $s6, $s5, L1575
	li $s5, 0
	j L1576
L1575:
	li $s5, 1
L1576:
	beq $s5, $zero, L1574
	lw $s5, sym21
	lw $s6, sym18
	blt $s5, $s6, L1578
	li $s6, 0
	j L1579
L1578:
	li $s6, 1
L1579:
	beq $s6, $zero, L1577
	li $s6, 14
	sw $s6, 16($sp)
L1577:
	j L1573
L1574:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1582
	li $s5, 0
	j L1583
L1582:
	li $s5, 1
L1583:
	beq $s5, $zero, L1581
	lw $s5, sym21
	lw $s6, sym19
	blt $s5, $s6, L1585
	li $s6, 0
	j L1586
L1585:
	li $s6, 1
L1586:
	beq $s6, $zero, L1584
	li $s6, 14
	sw $s6, 16($sp)
L1584:
	j L1580
L1581:
	lw $s6, 16($sp)
	li $s5, 13
	beq $s6, $s5, L1589
	li $s5, 0
	j L1590
L1589:
	li $s5, 1
L1590:
	beq $s5, $zero, L1588
	lw $s5, sym21
	lw $s6, sym20
	blt $s5, $s6, L1592
	li $s6, 0
	j L1593
L1592:
	li $s6, 1
L1593:
	beq $s6, $zero, L1591
	li $s6, 14
	sw $s6, 16($sp)
L1591:
	j L1587
L1588:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1595
	li $s5, 0
	j L1596
L1595:
	li $s5, 1
L1596:
	beq $s5, $zero, L1594
	lw $s5, sym21
	lw $s6, sym21
	blt $s5, $s6, L1598
	li $s6, 0
	j L1599
L1598:
	li $s6, 1
L1599:
	beq $s6, $zero, L1597
	li $s6, 14
	sw $s6, 16($sp)
L1597:
L1594:
L1587:
L1580:
L1573:
L1566:
L1559:
L1552:
L1545:
L1538:
L1531:
L1524:
L1517:
L1510:
L1503:
L1496:
L1492:
L1383:
L1274:
L1165:
L1056:
L947:
L838:
L729:
L620:
L511:
L402:
L293:
L184:
L75:
	lw $s6, 8($sp)
	li $s5, 1
	addu $s6, $s6, $s5
	sw $s6, 8($sp)
L71:
	lw $s6, 8($sp)
	li $s5, 14
	ble $s6, $s5, L1600
	li $s5, 0
	j L1601
L1600:
	li $s5, 1
L1601:
	bne $s5, $zero, L72
L73:
.data
L1602:
.byte 9, 101, 110, 100, 32, 105, 116, 101, 114, 10
.text
	la $s5, L1602
	move $a0, $s5
	jal sym1
	move $s5, $v0
	lw $s5, 4($sp)
	li $s6, 0
	beq $s5, $s6, L1605
	li $s6, 0
	j L1606
L1605:
	li $s6, 1
L1606:
	beq $s6, $zero, L1604
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1609
	li $s5, 0
	j L1610
L1609:
	li $s5, 1
L1610:
	beq $s5, $zero, L1608
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1607
L1608:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1613
	li $s6, 0
	j L1614
L1613:
	li $s6, 1
L1614:
	beq $s6, $zero, L1612
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1611
L1612:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1617
	li $s5, 0
	j L1618
L1617:
	li $s5, 1
L1618:
	beq $s5, $zero, L1616
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1615
L1616:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1621
	li $s6, 0
	j L1622
L1621:
	li $s6, 1
L1622:
	beq $s6, $zero, L1620
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1619
L1620:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1625
	li $s5, 0
	j L1626
L1625:
	li $s5, 1
L1626:
	beq $s5, $zero, L1624
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1623
L1624:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1629
	li $s6, 0
	j L1630
L1629:
	li $s6, 1
L1630:
	beq $s6, $zero, L1628
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1627
L1628:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1633
	li $s5, 0
	j L1634
L1633:
	li $s5, 1
L1634:
	beq $s5, $zero, L1632
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1631
L1632:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1637
	li $s6, 0
	j L1638
L1637:
	li $s6, 1
L1638:
	beq $s6, $zero, L1636
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1635
L1636:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1641
	li $s5, 0
	j L1642
L1641:
	li $s5, 1
L1642:
	beq $s5, $zero, L1640
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1639
L1640:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1645
	li $s6, 0
	j L1646
L1645:
	li $s6, 1
L1646:
	beq $s6, $zero, L1644
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1643
L1644:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1649
	li $s5, 0
	j L1650
L1649:
	li $s5, 1
L1650:
	beq $s5, $zero, L1648
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1647
L1648:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1653
	li $s6, 0
	j L1654
L1653:
	li $s6, 1
L1654:
	beq $s6, $zero, L1652
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1651
L1652:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1657
	li $s5, 0
	j L1658
L1657:
	li $s5, 1
L1658:
	beq $s5, $zero, L1656
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1655
L1656:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1661
	li $s6, 0
	j L1662
L1661:
	li $s6, 1
L1662:
	beq $s6, $zero, L1660
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1659
L1660:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1664
	li $s5, 0
	j L1665
L1664:
	li $s5, 1
L1665:
	beq $s5, $zero, L1663
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym7
L1663:
L1659:
L1655:
L1651:
L1647:
L1643:
L1639:
L1635:
L1631:
L1627:
L1623:
L1619:
L1615:
L1611:
L1607:
	j L1603
L1604:
	lw $s5, 4($sp)
	li $s6, 1
	beq $s5, $s6, L1668
	li $s6, 0
	j L1669
L1668:
	li $s6, 1
L1669:
	beq $s6, $zero, L1667
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1672
	li $s5, 0
	j L1673
L1672:
	li $s5, 1
L1673:
	beq $s5, $zero, L1671
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1670
L1671:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1676
	li $s6, 0
	j L1677
L1676:
	li $s6, 1
L1677:
	beq $s6, $zero, L1675
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1674
L1675:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1680
	li $s5, 0
	j L1681
L1680:
	li $s5, 1
L1681:
	beq $s5, $zero, L1679
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1678
L1679:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1684
	li $s6, 0
	j L1685
L1684:
	li $s6, 1
L1685:
	beq $s6, $zero, L1683
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1682
L1683:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1688
	li $s5, 0
	j L1689
L1688:
	li $s5, 1
L1689:
	beq $s5, $zero, L1687
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1686
L1687:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1692
	li $s6, 0
	j L1693
L1692:
	li $s6, 1
L1693:
	beq $s6, $zero, L1691
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1690
L1691:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1696
	li $s5, 0
	j L1697
L1696:
	li $s5, 1
L1697:
	beq $s5, $zero, L1695
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1694
L1695:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1700
	li $s6, 0
	j L1701
L1700:
	li $s6, 1
L1701:
	beq $s6, $zero, L1699
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1698
L1699:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1704
	li $s5, 0
	j L1705
L1704:
	li $s5, 1
L1705:
	beq $s5, $zero, L1703
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1702
L1703:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1708
	li $s6, 0
	j L1709
L1708:
	li $s6, 1
L1709:
	beq $s6, $zero, L1707
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1706
L1707:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1712
	li $s5, 0
	j L1713
L1712:
	li $s5, 1
L1713:
	beq $s5, $zero, L1711
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1710
L1711:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1716
	li $s6, 0
	j L1717
L1716:
	li $s6, 1
L1717:
	beq $s6, $zero, L1715
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1714
L1715:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1720
	li $s5, 0
	j L1721
L1720:
	li $s5, 1
L1721:
	beq $s5, $zero, L1719
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1718
L1719:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1724
	li $s6, 0
	j L1725
L1724:
	li $s6, 1
L1725:
	beq $s6, $zero, L1723
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1722
L1723:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1727
	li $s5, 0
	j L1728
L1727:
	li $s5, 1
L1728:
	beq $s5, $zero, L1726
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym8
L1726:
L1722:
L1718:
L1714:
L1710:
L1706:
L1702:
L1698:
L1694:
L1690:
L1686:
L1682:
L1678:
L1674:
L1670:
	j L1666
L1667:
	lw $s5, 4($sp)
	li $s6, 2
	beq $s5, $s6, L1731
	li $s6, 0
	j L1732
L1731:
	li $s6, 1
L1732:
	beq $s6, $zero, L1730
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1735
	li $s5, 0
	j L1736
L1735:
	li $s5, 1
L1736:
	beq $s5, $zero, L1734
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1733
L1734:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1739
	li $s6, 0
	j L1740
L1739:
	li $s6, 1
L1740:
	beq $s6, $zero, L1738
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1737
L1738:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1743
	li $s5, 0
	j L1744
L1743:
	li $s5, 1
L1744:
	beq $s5, $zero, L1742
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1741
L1742:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1747
	li $s6, 0
	j L1748
L1747:
	li $s6, 1
L1748:
	beq $s6, $zero, L1746
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1745
L1746:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1751
	li $s5, 0
	j L1752
L1751:
	li $s5, 1
L1752:
	beq $s5, $zero, L1750
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1749
L1750:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1755
	li $s6, 0
	j L1756
L1755:
	li $s6, 1
L1756:
	beq $s6, $zero, L1754
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1753
L1754:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1759
	li $s5, 0
	j L1760
L1759:
	li $s5, 1
L1760:
	beq $s5, $zero, L1758
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1757
L1758:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1763
	li $s6, 0
	j L1764
L1763:
	li $s6, 1
L1764:
	beq $s6, $zero, L1762
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1761
L1762:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1767
	li $s5, 0
	j L1768
L1767:
	li $s5, 1
L1768:
	beq $s5, $zero, L1766
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1765
L1766:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1771
	li $s6, 0
	j L1772
L1771:
	li $s6, 1
L1772:
	beq $s6, $zero, L1770
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1769
L1770:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1775
	li $s5, 0
	j L1776
L1775:
	li $s5, 1
L1776:
	beq $s5, $zero, L1774
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1773
L1774:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1779
	li $s6, 0
	j L1780
L1779:
	li $s6, 1
L1780:
	beq $s6, $zero, L1778
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1777
L1778:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1783
	li $s5, 0
	j L1784
L1783:
	li $s5, 1
L1784:
	beq $s5, $zero, L1782
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1781
L1782:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1787
	li $s6, 0
	j L1788
L1787:
	li $s6, 1
L1788:
	beq $s6, $zero, L1786
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1785
L1786:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1790
	li $s5, 0
	j L1791
L1790:
	li $s5, 1
L1791:
	beq $s5, $zero, L1789
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym9
L1789:
L1785:
L1781:
L1777:
L1773:
L1769:
L1765:
L1761:
L1757:
L1753:
L1749:
L1745:
L1741:
L1737:
L1733:
	j L1729
L1730:
	lw $s5, 4($sp)
	li $s6, 3
	beq $s5, $s6, L1794
	li $s6, 0
	j L1795
L1794:
	li $s6, 1
L1795:
	beq $s6, $zero, L1793
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1798
	li $s5, 0
	j L1799
L1798:
	li $s5, 1
L1799:
	beq $s5, $zero, L1797
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1796
L1797:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1802
	li $s6, 0
	j L1803
L1802:
	li $s6, 1
L1803:
	beq $s6, $zero, L1801
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1800
L1801:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1806
	li $s5, 0
	j L1807
L1806:
	li $s5, 1
L1807:
	beq $s5, $zero, L1805
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1804
L1805:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1810
	li $s6, 0
	j L1811
L1810:
	li $s6, 1
L1811:
	beq $s6, $zero, L1809
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1808
L1809:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1814
	li $s5, 0
	j L1815
L1814:
	li $s5, 1
L1815:
	beq $s5, $zero, L1813
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1812
L1813:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1818
	li $s6, 0
	j L1819
L1818:
	li $s6, 1
L1819:
	beq $s6, $zero, L1817
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1816
L1817:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1822
	li $s5, 0
	j L1823
L1822:
	li $s5, 1
L1823:
	beq $s5, $zero, L1821
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1820
L1821:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1826
	li $s6, 0
	j L1827
L1826:
	li $s6, 1
L1827:
	beq $s6, $zero, L1825
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1824
L1825:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1830
	li $s5, 0
	j L1831
L1830:
	li $s5, 1
L1831:
	beq $s5, $zero, L1829
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1828
L1829:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1834
	li $s6, 0
	j L1835
L1834:
	li $s6, 1
L1835:
	beq $s6, $zero, L1833
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1832
L1833:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1838
	li $s5, 0
	j L1839
L1838:
	li $s5, 1
L1839:
	beq $s5, $zero, L1837
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1836
L1837:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1842
	li $s6, 0
	j L1843
L1842:
	li $s6, 1
L1843:
	beq $s6, $zero, L1841
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1840
L1841:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1846
	li $s5, 0
	j L1847
L1846:
	li $s5, 1
L1847:
	beq $s5, $zero, L1845
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1844
L1845:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1850
	li $s6, 0
	j L1851
L1850:
	li $s6, 1
L1851:
	beq $s6, $zero, L1849
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1848
L1849:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1853
	li $s5, 0
	j L1854
L1853:
	li $s5, 1
L1854:
	beq $s5, $zero, L1852
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym10
L1852:
L1848:
L1844:
L1840:
L1836:
L1832:
L1828:
L1824:
L1820:
L1816:
L1812:
L1808:
L1804:
L1800:
L1796:
	j L1792
L1793:
	lw $s5, 4($sp)
	li $s6, 4
	beq $s5, $s6, L1857
	li $s6, 0
	j L1858
L1857:
	li $s6, 1
L1858:
	beq $s6, $zero, L1856
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1861
	li $s5, 0
	j L1862
L1861:
	li $s5, 1
L1862:
	beq $s5, $zero, L1860
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1859
L1860:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1865
	li $s6, 0
	j L1866
L1865:
	li $s6, 1
L1866:
	beq $s6, $zero, L1864
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1863
L1864:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1869
	li $s5, 0
	j L1870
L1869:
	li $s5, 1
L1870:
	beq $s5, $zero, L1868
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1867
L1868:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1873
	li $s6, 0
	j L1874
L1873:
	li $s6, 1
L1874:
	beq $s6, $zero, L1872
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1871
L1872:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1877
	li $s5, 0
	j L1878
L1877:
	li $s5, 1
L1878:
	beq $s5, $zero, L1876
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1875
L1876:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1881
	li $s6, 0
	j L1882
L1881:
	li $s6, 1
L1882:
	beq $s6, $zero, L1880
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1879
L1880:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1885
	li $s5, 0
	j L1886
L1885:
	li $s5, 1
L1886:
	beq $s5, $zero, L1884
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1883
L1884:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1889
	li $s6, 0
	j L1890
L1889:
	li $s6, 1
L1890:
	beq $s6, $zero, L1888
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1887
L1888:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1893
	li $s5, 0
	j L1894
L1893:
	li $s5, 1
L1894:
	beq $s5, $zero, L1892
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1891
L1892:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1897
	li $s6, 0
	j L1898
L1897:
	li $s6, 1
L1898:
	beq $s6, $zero, L1896
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1895
L1896:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1901
	li $s5, 0
	j L1902
L1901:
	li $s5, 1
L1902:
	beq $s5, $zero, L1900
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1899
L1900:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1905
	li $s6, 0
	j L1906
L1905:
	li $s6, 1
L1906:
	beq $s6, $zero, L1904
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1903
L1904:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1909
	li $s5, 0
	j L1910
L1909:
	li $s5, 1
L1910:
	beq $s5, $zero, L1908
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1907
L1908:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1913
	li $s6, 0
	j L1914
L1913:
	li $s6, 1
L1914:
	beq $s6, $zero, L1912
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1911
L1912:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1916
	li $s5, 0
	j L1917
L1916:
	li $s5, 1
L1917:
	beq $s5, $zero, L1915
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym11
L1915:
L1911:
L1907:
L1903:
L1899:
L1895:
L1891:
L1887:
L1883:
L1879:
L1875:
L1871:
L1867:
L1863:
L1859:
	j L1855
L1856:
	lw $s5, 4($sp)
	li $s6, 5
	beq $s5, $s6, L1920
	li $s6, 0
	j L1921
L1920:
	li $s6, 1
L1921:
	beq $s6, $zero, L1919
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1924
	li $s5, 0
	j L1925
L1924:
	li $s5, 1
L1925:
	beq $s5, $zero, L1923
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1922
L1923:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1928
	li $s6, 0
	j L1929
L1928:
	li $s6, 1
L1929:
	beq $s6, $zero, L1927
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1926
L1927:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1932
	li $s5, 0
	j L1933
L1932:
	li $s5, 1
L1933:
	beq $s5, $zero, L1931
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1930
L1931:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1936
	li $s6, 0
	j L1937
L1936:
	li $s6, 1
L1937:
	beq $s6, $zero, L1935
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1934
L1935:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1940
	li $s5, 0
	j L1941
L1940:
	li $s5, 1
L1941:
	beq $s5, $zero, L1939
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1938
L1939:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1944
	li $s6, 0
	j L1945
L1944:
	li $s6, 1
L1945:
	beq $s6, $zero, L1943
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1942
L1943:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1948
	li $s5, 0
	j L1949
L1948:
	li $s5, 1
L1949:
	beq $s5, $zero, L1947
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1946
L1947:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1952
	li $s6, 0
	j L1953
L1952:
	li $s6, 1
L1953:
	beq $s6, $zero, L1951
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1950
L1951:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1956
	li $s5, 0
	j L1957
L1956:
	li $s5, 1
L1957:
	beq $s5, $zero, L1955
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1954
L1955:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1960
	li $s6, 0
	j L1961
L1960:
	li $s6, 1
L1961:
	beq $s6, $zero, L1959
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1958
L1959:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1964
	li $s5, 0
	j L1965
L1964:
	li $s5, 1
L1965:
	beq $s5, $zero, L1963
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1962
L1963:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1968
	li $s6, 0
	j L1969
L1968:
	li $s6, 1
L1969:
	beq $s6, $zero, L1967
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1966
L1967:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1972
	li $s5, 0
	j L1973
L1972:
	li $s5, 1
L1973:
	beq $s5, $zero, L1971
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1970
L1971:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1976
	li $s6, 0
	j L1977
L1976:
	li $s6, 1
L1977:
	beq $s6, $zero, L1975
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1974
L1975:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1979
	li $s5, 0
	j L1980
L1979:
	li $s5, 1
L1980:
	beq $s5, $zero, L1978
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym12
L1978:
L1974:
L1970:
L1966:
L1962:
L1958:
L1954:
L1950:
L1946:
L1942:
L1938:
L1934:
L1930:
L1926:
L1922:
	j L1918
L1919:
	lw $s5, 4($sp)
	li $s6, 6
	beq $s5, $s6, L1983
	li $s6, 0
	j L1984
L1983:
	li $s6, 1
L1984:
	beq $s6, $zero, L1982
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1987
	li $s5, 0
	j L1988
L1987:
	li $s5, 1
L1988:
	beq $s5, $zero, L1986
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym13
	j L1985
L1986:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1991
	li $s6, 0
	j L1992
L1991:
	li $s6, 1
L1992:
	beq $s6, $zero, L1990
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym13
	j L1989
L1990:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1995
	li $s5, 0
	j L1996
L1995:
	li $s5, 1
L1996:
	beq $s5, $zero, L1994
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym13
	j L1993
L1994:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1999
	li $s6, 0
	j L2000
L1999:
	li $s6, 1
L2000:
	beq $s6, $zero, L1998
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym13
	j L1997
L1998:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2003
	li $s5, 0
	j L2004
L2003:
	li $s5, 1
L2004:
	beq $s5, $zero, L2002
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym13
	j L2001
L2002:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2007
	li $s6, 0
	j L2008
L2007:
	li $s6, 1
L2008:
	beq $s6, $zero, L2006
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym13
	j L2005
L2006:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2011
	li $s5, 0
	j L2012
L2011:
	li $s5, 1
L2012:
	beq $s5, $zero, L2010
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym13
	j L2009
L2010:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2015
	li $s6, 0
	j L2016
L2015:
	li $s6, 1
L2016:
	beq $s6, $zero, L2014
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym13
	j L2013
L2014:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2019
	li $s5, 0
	j L2020
L2019:
	li $s5, 1
L2020:
	beq $s5, $zero, L2018
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym13
	j L2017
L2018:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2023
	li $s6, 0
	j L2024
L2023:
	li $s6, 1
L2024:
	beq $s6, $zero, L2022
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym13
	j L2021
L2022:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2027
	li $s5, 0
	j L2028
L2027:
	li $s5, 1
L2028:
	beq $s5, $zero, L2026
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym13
	j L2025
L2026:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2031
	li $s6, 0
	j L2032
L2031:
	li $s6, 1
L2032:
	beq $s6, $zero, L2030
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym13
	j L2029
L2030:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2035
	li $s5, 0
	j L2036
L2035:
	li $s5, 1
L2036:
	beq $s5, $zero, L2034
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym13
	j L2033
L2034:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2039
	li $s6, 0
	j L2040
L2039:
	li $s6, 1
L2040:
	beq $s6, $zero, L2038
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym13
	j L2037
L2038:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2042
	li $s5, 0
	j L2043
L2042:
	li $s5, 1
L2043:
	beq $s5, $zero, L2041
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym13
L2041:
L2037:
L2033:
L2029:
L2025:
L2021:
L2017:
L2013:
L2009:
L2005:
L2001:
L1997:
L1993:
L1989:
L1985:
	j L1981
L1982:
	lw $s5, 4($sp)
	li $s6, 7
	beq $s5, $s6, L2046
	li $s6, 0
	j L2047
L2046:
	li $s6, 1
L2047:
	beq $s6, $zero, L2045
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2050
	li $s5, 0
	j L2051
L2050:
	li $s5, 1
L2051:
	beq $s5, $zero, L2049
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2048
L2049:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2054
	li $s6, 0
	j L2055
L2054:
	li $s6, 1
L2055:
	beq $s6, $zero, L2053
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2052
L2053:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2058
	li $s5, 0
	j L2059
L2058:
	li $s5, 1
L2059:
	beq $s5, $zero, L2057
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2056
L2057:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2062
	li $s6, 0
	j L2063
L2062:
	li $s6, 1
L2063:
	beq $s6, $zero, L2061
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2060
L2061:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2066
	li $s5, 0
	j L2067
L2066:
	li $s5, 1
L2067:
	beq $s5, $zero, L2065
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2064
L2065:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2070
	li $s6, 0
	j L2071
L2070:
	li $s6, 1
L2071:
	beq $s6, $zero, L2069
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2068
L2069:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2074
	li $s5, 0
	j L2075
L2074:
	li $s5, 1
L2075:
	beq $s5, $zero, L2073
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2072
L2073:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2078
	li $s6, 0
	j L2079
L2078:
	li $s6, 1
L2079:
	beq $s6, $zero, L2077
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2076
L2077:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2082
	li $s5, 0
	j L2083
L2082:
	li $s5, 1
L2083:
	beq $s5, $zero, L2081
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2080
L2081:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2086
	li $s6, 0
	j L2087
L2086:
	li $s6, 1
L2087:
	beq $s6, $zero, L2085
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2084
L2085:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2090
	li $s5, 0
	j L2091
L2090:
	li $s5, 1
L2091:
	beq $s5, $zero, L2089
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2088
L2089:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2094
	li $s6, 0
	j L2095
L2094:
	li $s6, 1
L2095:
	beq $s6, $zero, L2093
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2092
L2093:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2098
	li $s5, 0
	j L2099
L2098:
	li $s5, 1
L2099:
	beq $s5, $zero, L2097
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2096
L2097:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2102
	li $s6, 0
	j L2103
L2102:
	li $s6, 1
L2103:
	beq $s6, $zero, L2101
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2100
L2101:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2105
	li $s5, 0
	j L2106
L2105:
	li $s5, 1
L2106:
	beq $s5, $zero, L2104
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym14
L2104:
L2100:
L2096:
L2092:
L2088:
L2084:
L2080:
L2076:
L2072:
L2068:
L2064:
L2060:
L2056:
L2052:
L2048:
	j L2044
L2045:
	lw $s5, 4($sp)
	li $s6, 8
	beq $s5, $s6, L2109
	li $s6, 0
	j L2110
L2109:
	li $s6, 1
L2110:
	beq $s6, $zero, L2108
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2113
	li $s5, 0
	j L2114
L2113:
	li $s5, 1
L2114:
	beq $s5, $zero, L2112
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2111
L2112:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2117
	li $s6, 0
	j L2118
L2117:
	li $s6, 1
L2118:
	beq $s6, $zero, L2116
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2115
L2116:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2121
	li $s5, 0
	j L2122
L2121:
	li $s5, 1
L2122:
	beq $s5, $zero, L2120
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2119
L2120:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2125
	li $s6, 0
	j L2126
L2125:
	li $s6, 1
L2126:
	beq $s6, $zero, L2124
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2123
L2124:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2129
	li $s5, 0
	j L2130
L2129:
	li $s5, 1
L2130:
	beq $s5, $zero, L2128
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2127
L2128:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2133
	li $s6, 0
	j L2134
L2133:
	li $s6, 1
L2134:
	beq $s6, $zero, L2132
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2131
L2132:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2137
	li $s5, 0
	j L2138
L2137:
	li $s5, 1
L2138:
	beq $s5, $zero, L2136
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2135
L2136:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2141
	li $s6, 0
	j L2142
L2141:
	li $s6, 1
L2142:
	beq $s6, $zero, L2140
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2139
L2140:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2145
	li $s5, 0
	j L2146
L2145:
	li $s5, 1
L2146:
	beq $s5, $zero, L2144
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2143
L2144:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2149
	li $s6, 0
	j L2150
L2149:
	li $s6, 1
L2150:
	beq $s6, $zero, L2148
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2147
L2148:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2153
	li $s5, 0
	j L2154
L2153:
	li $s5, 1
L2154:
	beq $s5, $zero, L2152
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2151
L2152:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2157
	li $s6, 0
	j L2158
L2157:
	li $s6, 1
L2158:
	beq $s6, $zero, L2156
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2155
L2156:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2161
	li $s5, 0
	j L2162
L2161:
	li $s5, 1
L2162:
	beq $s5, $zero, L2160
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2159
L2160:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2165
	li $s6, 0
	j L2166
L2165:
	li $s6, 1
L2166:
	beq $s6, $zero, L2164
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2163
L2164:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2168
	li $s5, 0
	j L2169
L2168:
	li $s5, 1
L2169:
	beq $s5, $zero, L2167
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym15
L2167:
L2163:
L2159:
L2155:
L2151:
L2147:
L2143:
L2139:
L2135:
L2131:
L2127:
L2123:
L2119:
L2115:
L2111:
	j L2107
L2108:
	lw $s5, 4($sp)
	li $s6, 9
	beq $s5, $s6, L2172
	li $s6, 0
	j L2173
L2172:
	li $s6, 1
L2173:
	beq $s6, $zero, L2171
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2176
	li $s5, 0
	j L2177
L2176:
	li $s5, 1
L2177:
	beq $s5, $zero, L2175
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2174
L2175:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2180
	li $s6, 0
	j L2181
L2180:
	li $s6, 1
L2181:
	beq $s6, $zero, L2179
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2178
L2179:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2184
	li $s5, 0
	j L2185
L2184:
	li $s5, 1
L2185:
	beq $s5, $zero, L2183
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2182
L2183:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2188
	li $s6, 0
	j L2189
L2188:
	li $s6, 1
L2189:
	beq $s6, $zero, L2187
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2186
L2187:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2192
	li $s5, 0
	j L2193
L2192:
	li $s5, 1
L2193:
	beq $s5, $zero, L2191
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2190
L2191:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2196
	li $s6, 0
	j L2197
L2196:
	li $s6, 1
L2197:
	beq $s6, $zero, L2195
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2194
L2195:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2200
	li $s5, 0
	j L2201
L2200:
	li $s5, 1
L2201:
	beq $s5, $zero, L2199
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2198
L2199:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2204
	li $s6, 0
	j L2205
L2204:
	li $s6, 1
L2205:
	beq $s6, $zero, L2203
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2202
L2203:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2208
	li $s5, 0
	j L2209
L2208:
	li $s5, 1
L2209:
	beq $s5, $zero, L2207
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2206
L2207:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2212
	li $s6, 0
	j L2213
L2212:
	li $s6, 1
L2213:
	beq $s6, $zero, L2211
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2210
L2211:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2216
	li $s5, 0
	j L2217
L2216:
	li $s5, 1
L2217:
	beq $s5, $zero, L2215
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2214
L2215:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2220
	li $s6, 0
	j L2221
L2220:
	li $s6, 1
L2221:
	beq $s6, $zero, L2219
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2218
L2219:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2224
	li $s5, 0
	j L2225
L2224:
	li $s5, 1
L2225:
	beq $s5, $zero, L2223
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2222
L2223:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2228
	li $s6, 0
	j L2229
L2228:
	li $s6, 1
L2229:
	beq $s6, $zero, L2227
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2226
L2227:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2231
	li $s5, 0
	j L2232
L2231:
	li $s5, 1
L2232:
	beq $s5, $zero, L2230
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym16
L2230:
L2226:
L2222:
L2218:
L2214:
L2210:
L2206:
L2202:
L2198:
L2194:
L2190:
L2186:
L2182:
L2178:
L2174:
	j L2170
L2171:
	lw $s5, 4($sp)
	li $s6, 10
	beq $s5, $s6, L2235
	li $s6, 0
	j L2236
L2235:
	li $s6, 1
L2236:
	beq $s6, $zero, L2234
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2239
	li $s5, 0
	j L2240
L2239:
	li $s5, 1
L2240:
	beq $s5, $zero, L2238
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2237
L2238:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2243
	li $s6, 0
	j L2244
L2243:
	li $s6, 1
L2244:
	beq $s6, $zero, L2242
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2241
L2242:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2247
	li $s5, 0
	j L2248
L2247:
	li $s5, 1
L2248:
	beq $s5, $zero, L2246
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2245
L2246:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2251
	li $s6, 0
	j L2252
L2251:
	li $s6, 1
L2252:
	beq $s6, $zero, L2250
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2249
L2250:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2255
	li $s5, 0
	j L2256
L2255:
	li $s5, 1
L2256:
	beq $s5, $zero, L2254
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2253
L2254:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2259
	li $s6, 0
	j L2260
L2259:
	li $s6, 1
L2260:
	beq $s6, $zero, L2258
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2257
L2258:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2263
	li $s5, 0
	j L2264
L2263:
	li $s5, 1
L2264:
	beq $s5, $zero, L2262
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2261
L2262:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2267
	li $s6, 0
	j L2268
L2267:
	li $s6, 1
L2268:
	beq $s6, $zero, L2266
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2265
L2266:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2271
	li $s5, 0
	j L2272
L2271:
	li $s5, 1
L2272:
	beq $s5, $zero, L2270
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2269
L2270:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2275
	li $s6, 0
	j L2276
L2275:
	li $s6, 1
L2276:
	beq $s6, $zero, L2274
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2273
L2274:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2279
	li $s5, 0
	j L2280
L2279:
	li $s5, 1
L2280:
	beq $s5, $zero, L2278
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2277
L2278:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2283
	li $s6, 0
	j L2284
L2283:
	li $s6, 1
L2284:
	beq $s6, $zero, L2282
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2281
L2282:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2287
	li $s5, 0
	j L2288
L2287:
	li $s5, 1
L2288:
	beq $s5, $zero, L2286
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2285
L2286:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2291
	li $s6, 0
	j L2292
L2291:
	li $s6, 1
L2292:
	beq $s6, $zero, L2290
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2289
L2290:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2294
	li $s5, 0
	j L2295
L2294:
	li $s5, 1
L2295:
	beq $s5, $zero, L2293
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym17
L2293:
L2289:
L2285:
L2281:
L2277:
L2273:
L2269:
L2265:
L2261:
L2257:
L2253:
L2249:
L2245:
L2241:
L2237:
	j L2233
L2234:
	lw $s5, 4($sp)
	li $s6, 11
	beq $s5, $s6, L2298
	li $s6, 0
	j L2299
L2298:
	li $s6, 1
L2299:
	beq $s6, $zero, L2297
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2302
	li $s5, 0
	j L2303
L2302:
	li $s5, 1
L2303:
	beq $s5, $zero, L2301
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2300
L2301:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2306
	li $s6, 0
	j L2307
L2306:
	li $s6, 1
L2307:
	beq $s6, $zero, L2305
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2304
L2305:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2310
	li $s5, 0
	j L2311
L2310:
	li $s5, 1
L2311:
	beq $s5, $zero, L2309
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2308
L2309:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2314
	li $s6, 0
	j L2315
L2314:
	li $s6, 1
L2315:
	beq $s6, $zero, L2313
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2312
L2313:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2318
	li $s5, 0
	j L2319
L2318:
	li $s5, 1
L2319:
	beq $s5, $zero, L2317
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2316
L2317:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2322
	li $s6, 0
	j L2323
L2322:
	li $s6, 1
L2323:
	beq $s6, $zero, L2321
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2320
L2321:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2326
	li $s5, 0
	j L2327
L2326:
	li $s5, 1
L2327:
	beq $s5, $zero, L2325
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2324
L2325:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2330
	li $s6, 0
	j L2331
L2330:
	li $s6, 1
L2331:
	beq $s6, $zero, L2329
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2328
L2329:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2334
	li $s5, 0
	j L2335
L2334:
	li $s5, 1
L2335:
	beq $s5, $zero, L2333
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2332
L2333:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2338
	li $s6, 0
	j L2339
L2338:
	li $s6, 1
L2339:
	beq $s6, $zero, L2337
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2336
L2337:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2342
	li $s5, 0
	j L2343
L2342:
	li $s5, 1
L2343:
	beq $s5, $zero, L2341
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2340
L2341:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2346
	li $s6, 0
	j L2347
L2346:
	li $s6, 1
L2347:
	beq $s6, $zero, L2345
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2344
L2345:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2350
	li $s5, 0
	j L2351
L2350:
	li $s5, 1
L2351:
	beq $s5, $zero, L2349
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2348
L2349:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2354
	li $s6, 0
	j L2355
L2354:
	li $s6, 1
L2355:
	beq $s6, $zero, L2353
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2352
L2353:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2357
	li $s5, 0
	j L2358
L2357:
	li $s5, 1
L2358:
	beq $s5, $zero, L2356
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym18
L2356:
L2352:
L2348:
L2344:
L2340:
L2336:
L2332:
L2328:
L2324:
L2320:
L2316:
L2312:
L2308:
L2304:
L2300:
	j L2296
L2297:
	lw $s5, 4($sp)
	li $s6, 12
	beq $s5, $s6, L2361
	li $s6, 0
	j L2362
L2361:
	li $s6, 1
L2362:
	beq $s6, $zero, L2360
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2365
	li $s5, 0
	j L2366
L2365:
	li $s5, 1
L2366:
	beq $s5, $zero, L2364
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2363
L2364:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2369
	li $s6, 0
	j L2370
L2369:
	li $s6, 1
L2370:
	beq $s6, $zero, L2368
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2367
L2368:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2373
	li $s5, 0
	j L2374
L2373:
	li $s5, 1
L2374:
	beq $s5, $zero, L2372
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2371
L2372:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2377
	li $s6, 0
	j L2378
L2377:
	li $s6, 1
L2378:
	beq $s6, $zero, L2376
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2375
L2376:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2381
	li $s5, 0
	j L2382
L2381:
	li $s5, 1
L2382:
	beq $s5, $zero, L2380
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2379
L2380:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2385
	li $s6, 0
	j L2386
L2385:
	li $s6, 1
L2386:
	beq $s6, $zero, L2384
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2383
L2384:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2389
	li $s5, 0
	j L2390
L2389:
	li $s5, 1
L2390:
	beq $s5, $zero, L2388
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2387
L2388:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2393
	li $s6, 0
	j L2394
L2393:
	li $s6, 1
L2394:
	beq $s6, $zero, L2392
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2391
L2392:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2397
	li $s5, 0
	j L2398
L2397:
	li $s5, 1
L2398:
	beq $s5, $zero, L2396
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2395
L2396:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2401
	li $s6, 0
	j L2402
L2401:
	li $s6, 1
L2402:
	beq $s6, $zero, L2400
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2399
L2400:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2405
	li $s5, 0
	j L2406
L2405:
	li $s5, 1
L2406:
	beq $s5, $zero, L2404
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2403
L2404:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2409
	li $s6, 0
	j L2410
L2409:
	li $s6, 1
L2410:
	beq $s6, $zero, L2408
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2407
L2408:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2413
	li $s5, 0
	j L2414
L2413:
	li $s5, 1
L2414:
	beq $s5, $zero, L2412
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2411
L2412:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2417
	li $s6, 0
	j L2418
L2417:
	li $s6, 1
L2418:
	beq $s6, $zero, L2416
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2415
L2416:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2420
	li $s5, 0
	j L2421
L2420:
	li $s5, 1
L2421:
	beq $s5, $zero, L2419
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym19
L2419:
L2415:
L2411:
L2407:
L2403:
L2399:
L2395:
L2391:
L2387:
L2383:
L2379:
L2375:
L2371:
L2367:
L2363:
	j L2359
L2360:
	lw $s5, 4($sp)
	li $s6, 13
	beq $s5, $s6, L2423
	li $s6, 0
	j L2424
L2423:
	li $s6, 1
L2424:
	beq $s6, $zero, L2422
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2427
	li $s5, 0
	j L2428
L2427:
	li $s5, 1
L2428:
	beq $s5, $zero, L2426
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2425
L2426:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2431
	li $s6, 0
	j L2432
L2431:
	li $s6, 1
L2432:
	beq $s6, $zero, L2430
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2429
L2430:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2435
	li $s5, 0
	j L2436
L2435:
	li $s5, 1
L2436:
	beq $s5, $zero, L2434
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2433
L2434:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2439
	li $s6, 0
	j L2440
L2439:
	li $s6, 1
L2440:
	beq $s6, $zero, L2438
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2437
L2438:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2443
	li $s5, 0
	j L2444
L2443:
	li $s5, 1
L2444:
	beq $s5, $zero, L2442
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2441
L2442:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2447
	li $s6, 0
	j L2448
L2447:
	li $s6, 1
L2448:
	beq $s6, $zero, L2446
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2445
L2446:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2451
	li $s5, 0
	j L2452
L2451:
	li $s5, 1
L2452:
	beq $s5, $zero, L2450
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2449
L2450:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2455
	li $s6, 0
	j L2456
L2455:
	li $s6, 1
L2456:
	beq $s6, $zero, L2454
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2453
L2454:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2459
	li $s5, 0
	j L2460
L2459:
	li $s5, 1
L2460:
	beq $s5, $zero, L2458
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2457
L2458:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2463
	li $s6, 0
	j L2464
L2463:
	li $s6, 1
L2464:
	beq $s6, $zero, L2462
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2461
L2462:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2467
	li $s5, 0
	j L2468
L2467:
	li $s5, 1
L2468:
	beq $s5, $zero, L2466
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2465
L2466:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2471
	li $s6, 0
	j L2472
L2471:
	li $s6, 1
L2472:
	beq $s6, $zero, L2470
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2469
L2470:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2475
	li $s5, 0
	j L2476
L2475:
	li $s5, 1
L2476:
	beq $s5, $zero, L2474
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2473
L2474:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2479
	li $s6, 0
	j L2480
L2479:
	li $s6, 1
L2480:
	beq $s6, $zero, L2478
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2477
L2478:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2482
	li $s5, 0
	j L2483
L2482:
	li $s5, 1
L2483:
	beq $s5, $zero, L2481
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym20
L2481:
L2477:
L2473:
L2469:
L2465:
L2461:
L2457:
L2453:
L2449:
L2445:
L2441:
L2437:
L2433:
L2429:
L2425:
L2422:
L2359:
L2296:
L2233:
L2170:
L2107:
L2044:
L1981:
L1918:
L1855:
L1792:
L1729:
L1666:
L1603:
	jal sym24
	move $s5, $v0
	lw $s5, 4($sp)
	li $s6, 1
	addu $s5, $s5, $s6
	sw $s5, 4($sp)
L67:
	lw $s5, 4($sp)
	li $s6, 13
	ble $s5, $s6, L2484
	li $s6, 0
	j L2485
L2484:
	li $s6, 1
L2485:
    li $v0, 1
    li $a0, 20001
    syscall
	bne $s6, $zero, L68
    li $v0, 1
    li $a0, 20002
    syscall
L69:
L1:
	lw $ra, 0($sp)
	addi $sp, $sp, 20
	jal sym6
sym24:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	li $s6, 0
	sw $s6, 4($sp)
	j L2487
L2488:
	lw $s6, 4($sp)
	li $s5, 0
	beq $s6, $s5, L2492
	li $s5, 0
	j L2493
L2492:
	li $s5, 1
L2493:
	beq $s5, $zero, L2491
	lw $s5, sym7
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2494:
.byte 1, 32
.text
	la $s5, L2494
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2490
L2491:
	lw $s5, 4($sp)
	li $s6, 1
	beq $s5, $s6, L2497
	li $s6, 0
	j L2498
L2497:
	li $s6, 1
L2498:
	beq $s6, $zero, L2496
	lw $s6, sym8
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2499:
.byte 1, 32
.text
	la $s6, L2499
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2495
L2496:
	lw $s6, 4($sp)
	li $s5, 2
	beq $s6, $s5, L2502
	li $s5, 0
	j L2503
L2502:
	li $s5, 1
L2503:
	beq $s5, $zero, L2501
	lw $s5, sym9
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2504:
.byte 1, 32
.text
	la $s5, L2504
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2500
L2501:
	lw $s5, 4($sp)
	li $s6, 3
	beq $s5, $s6, L2507
	li $s6, 0
	j L2508
L2507:
	li $s6, 1
L2508:
	beq $s6, $zero, L2506
	lw $s6, sym10
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2509:
.byte 1, 32
.text
	la $s6, L2509
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2505
L2506:
	lw $s6, 4($sp)
	li $s5, 4
	beq $s6, $s5, L2512
	li $s5, 0
	j L2513
L2512:
	li $s5, 1
L2513:
	beq $s5, $zero, L2511
	lw $s5, sym11
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2514:
.byte 1, 32
.text
	la $s5, L2514
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2510
L2511:
	lw $s5, 4($sp)
	li $s6, 5
	beq $s5, $s6, L2517
	li $s6, 0
	j L2518
L2517:
	li $s6, 1
L2518:
	beq $s6, $zero, L2516
	lw $s6, sym12
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2519:
.byte 1, 32
.text
	la $s6, L2519
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2515
L2516:
	lw $s6, 4($sp)
	li $s5, 6
	beq $s6, $s5, L2522
	li $s5, 0
	j L2523
L2522:
	li $s5, 1
L2523:
	beq $s5, $zero, L2521
	lw $s5, sym13
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2524:
.byte 1, 32
.text
	la $s5, L2524
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2520
L2521:
	lw $s5, 4($sp)
	li $s6, 7
	beq $s5, $s6, L2527
	li $s6, 0
	j L2528
L2527:
	li $s6, 1
L2528:
	beq $s6, $zero, L2526
	lw $s6, sym14
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2529:
.byte 1, 32
.text
	la $s6, L2529
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2525
L2526:
	lw $s6, 4($sp)
	li $s5, 8
	beq $s6, $s5, L2532
	li $s5, 0
	j L2533
L2532:
	li $s5, 1
L2533:
	beq $s5, $zero, L2531
	lw $s5, sym15
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2534:
.byte 1, 32
.text
	la $s5, L2534
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2530
L2531:
	lw $s5, 4($sp)
	li $s6, 9
	beq $s5, $s6, L2537
	li $s6, 0
	j L2538
L2537:
	li $s6, 1
L2538:
	beq $s6, $zero, L2536
	lw $s6, sym16
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2539:
.byte 1, 32
.text
	la $s6, L2539
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2535
L2536:
	lw $s6, 4($sp)
	li $s5, 10
	beq $s6, $s5, L2542
	li $s5, 0
	j L2543
L2542:
	li $s5, 1
L2543:
	beq $s5, $zero, L2541
	lw $s5, sym17
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2544:
.byte 1, 32
.text
	la $s5, L2544
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2540
L2541:
	lw $s5, 4($sp)
	li $s6, 11
	beq $s5, $s6, L2547
	li $s6, 0
	j L2548
L2547:
	li $s6, 1
L2548:
	beq $s6, $zero, L2546
	lw $s6, sym18
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2549:
.byte 1, 32
.text
	la $s6, L2549
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2545
L2546:
	lw $s6, 4($sp)
	li $s5, 12
	beq $s6, $s5, L2552
	li $s5, 0
	j L2553
L2552:
	li $s5, 1
L2553:
	beq $s5, $zero, L2551
	lw $s5, sym19
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2554:
.byte 1, 32
.text
	la $s5, L2554
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2550
L2551:
	lw $s5, 4($sp)
	li $s6, 13
	beq $s5, $s6, L2557
	li $s6, 0
	j L2558
L2557:
	li $s6, 1
L2558:
	beq $s6, $zero, L2556
	lw $s6, sym20
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2559:
.byte 1, 32
.text
	la $s6, L2559
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2555
L2556:
	lw $s6, 4($sp)
	li $s5, 14
	beq $s6, $s5, L2561
	li $s5, 0
	j L2562
L2561:
	li $s5, 1
L2562:
	beq $s5, $zero, L2560
	lw $s5, sym21
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2563:
.byte 1, 32
.text
	la $s5, L2563
	move $a0, $s5
	jal sym1
	move $s5, $v0
L2560:
L2555:
L2550:
L2545:
L2540:
L2535:
L2530:
L2525:
L2520:
L2515:
L2510:
L2505:
L2500:
L2495:
L2490:
	lw $s5, 4($sp)
	li $s6, 1
	addu $s5, $s5, $s6
	sw $s5, 4($sp)
L2487:
	lw $s5, 4($sp)
	li $s6, 14
	ble $s5, $s6, L2564
	li $s6, 0
	j L2565
L2564:
	li $s6, 1
L2565:
	bne $s6, $zero, L2488
L2489:
.data
L2566:
.byte 1, 10
.text
	la $s6, L2566
	move $a0, $s6
	jal sym1
	move $s6, $v0
L2486:
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra
.data
sym25: .word 0
.text
sym26:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	lw $s6, 4($sp)
	sw $s6, sym25
L2567:
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra
sym27:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $s6, 17
	lw $s5, sym25
	mult $s6, $s5
	mflo $s6
	li $s5, 13
	addu $s6, $s6, $s5
	li $s5, 32768
# save registers
	addi $sp, $sp, -4
	sw $s6, 0($sp)
# save registers
	move $a0, $s6
	move $a1, $s5
	jal divmodchk
# restore registers
	lw $s6, 0($sp)
	addi $sp, $sp, 4
# restore registers
	rem $s6, $s6, $v0
	sw $s6, sym25
	lw $s6, sym25
	move $v0, $s6
	j L2568
.data
L2569:
.byte 53, 101, 114, 114, 111, 114, 58, 32, 102, 117, 110, 99, 116, 105, 111, 110, 32, 39, 73, 78, 84, 69, 82, 78, 65, 76, 114, 97, 110, 100, 111, 109, 39, 32, 109, 117, 115, 116, 32, 114, 101, 116, 117, 114, 110, 32, 97, 32, 118, 97, 108, 117, 101, 10
.text
	la $a0, L2569
	jal sym1
	li $v0, 17
	li $a0, 1
	syscall
L2568:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
