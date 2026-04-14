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
	sw $zero, 4($sp)
	sw $zero, 8($sp)
	sw $zero, 12($sp)
	sw $zero, 16($sp)
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
	div $s5, $s6
	mfhi $s5
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
	div $s6, $s5
	mfhi $s6
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
	div $s5, $s6
	mfhi $s5
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
	div $s6, $s5
	mfhi $s6
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
	div $s5, $s6
	mfhi $s5
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
	div $s6, $s5
	mfhi $s6
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
	div $s5, $s6
	mfhi $s5
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
	div $s6, $s5
	mfhi $s6
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
	div $s5, $s6
	mfhi $s5
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
	div $s6, $s5
	mfhi $s6
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
	div $s5, $s6
	mfhi $s5
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
	div $s6, $s5
	mfhi $s6
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
	div $s5, $s6
	mfhi $s5
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
	div $s6, $s5
	mfhi $s6
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
	div $s5, $s6
	mfhi $s5
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
	li $s6, 0
	sw $s6, 4($sp)
	j L66
L67:
	lw $s6, 4($sp)
	sw $s6, 16($sp)
	lw $s6, 4($sp)
	li $s5, 1
	addu $s6, $s6, $s5
	sw $s6, 8($sp)
	j L69
L70:
	lw $s6, 8($sp)
	li $s5, 1
	beq $s6, $s5, L74
	li $s5, 0
	j L75
L74:
	li $s5, 1
L75:
	beq $s5, $zero, L73
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L78
	li $s6, 0
	j L79
L78:
	li $s6, 1
L79:
	beq $s6, $zero, L77
	lw $s6, sym8
	lw $s5, sym7
	blt $s6, $s5, L81
	li $s5, 0
	j L82
L81:
	li $s5, 1
L82:
	beq $s5, $zero, L80
	li $s5, 1
	sw $s5, 16($sp)
L80:
	j L76
L77:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L85
	li $s6, 0
	j L86
L85:
	li $s6, 1
L86:
	beq $s6, $zero, L84
	lw $s6, sym8
	lw $s5, sym8
	blt $s6, $s5, L88
	li $s5, 0
	j L89
L88:
	li $s5, 1
L89:
	beq $s5, $zero, L87
	li $s5, 1
	sw $s5, 16($sp)
L87:
	j L83
L84:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L92
	li $s6, 0
	j L93
L92:
	li $s6, 1
L93:
	beq $s6, $zero, L91
	lw $s6, sym8
	lw $s5, sym9
	blt $s6, $s5, L95
	li $s5, 0
	j L96
L95:
	li $s5, 1
L96:
	beq $s5, $zero, L94
	li $s5, 1
	sw $s5, 16($sp)
L94:
	j L90
L91:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L99
	li $s6, 0
	j L100
L99:
	li $s6, 1
L100:
	beq $s6, $zero, L98
	lw $s6, sym8
	lw $s5, sym10
	blt $s6, $s5, L102
	li $s5, 0
	j L103
L102:
	li $s5, 1
L103:
	beq $s5, $zero, L101
	li $s5, 1
	sw $s5, 16($sp)
L101:
	j L97
L98:
	lw $s5, 16($sp)
	li $s6, 4
	beq $s5, $s6, L106
	li $s6, 0
	j L107
L106:
	li $s6, 1
L107:
	beq $s6, $zero, L105
	lw $s6, sym8
	lw $s5, sym11
	blt $s6, $s5, L109
	li $s5, 0
	j L110
L109:
	li $s5, 1
L110:
	beq $s5, $zero, L108
	li $s5, 1
	sw $s5, 16($sp)
L108:
	j L104
L105:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L113
	li $s6, 0
	j L114
L113:
	li $s6, 1
L114:
	beq $s6, $zero, L112
	lw $s6, sym8
	lw $s5, sym12
	blt $s6, $s5, L116
	li $s5, 0
	j L117
L116:
	li $s5, 1
L117:
	beq $s5, $zero, L115
	li $s5, 1
	sw $s5, 16($sp)
L115:
	j L111
L112:
	lw $s5, 16($sp)
	li $s6, 6
	beq $s5, $s6, L120
	li $s6, 0
	j L121
L120:
	li $s6, 1
L121:
	beq $s6, $zero, L119
	lw $s6, sym8
	lw $s5, sym13
	blt $s6, $s5, L123
	li $s5, 0
	j L124
L123:
	li $s5, 1
L124:
	beq $s5, $zero, L122
	li $s5, 1
	sw $s5, 16($sp)
L122:
	j L118
L119:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L127
	li $s6, 0
	j L128
L127:
	li $s6, 1
L128:
	beq $s6, $zero, L126
	lw $s6, sym8
	lw $s5, sym14
	blt $s6, $s5, L130
	li $s5, 0
	j L131
L130:
	li $s5, 1
L131:
	beq $s5, $zero, L129
	li $s5, 1
	sw $s5, 16($sp)
L129:
	j L125
L126:
	lw $s5, 16($sp)
	li $s6, 8
	beq $s5, $s6, L134
	li $s6, 0
	j L135
L134:
	li $s6, 1
L135:
	beq $s6, $zero, L133
	lw $s6, sym8
	lw $s5, sym15
	blt $s6, $s5, L137
	li $s5, 0
	j L138
L137:
	li $s5, 1
L138:
	beq $s5, $zero, L136
	li $s5, 1
	sw $s5, 16($sp)
L136:
	j L132
L133:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L141
	li $s6, 0
	j L142
L141:
	li $s6, 1
L142:
	beq $s6, $zero, L140
	lw $s6, sym8
	lw $s5, sym16
	blt $s6, $s5, L144
	li $s5, 0
	j L145
L144:
	li $s5, 1
L145:
	beq $s5, $zero, L143
	li $s5, 1
	sw $s5, 16($sp)
L143:
	j L139
L140:
	lw $s5, 16($sp)
	li $s6, 10
	beq $s5, $s6, L148
	li $s6, 0
	j L149
L148:
	li $s6, 1
L149:
	beq $s6, $zero, L147
	lw $s6, sym8
	lw $s5, sym17
	blt $s6, $s5, L151
	li $s5, 0
	j L152
L151:
	li $s5, 1
L152:
	beq $s5, $zero, L150
	li $s5, 1
	sw $s5, 16($sp)
L150:
	j L146
L147:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L155
	li $s6, 0
	j L156
L155:
	li $s6, 1
L156:
	beq $s6, $zero, L154
	lw $s6, sym8
	lw $s5, sym18
	blt $s6, $s5, L158
	li $s5, 0
	j L159
L158:
	li $s5, 1
L159:
	beq $s5, $zero, L157
	li $s5, 1
	sw $s5, 16($sp)
L157:
	j L153
L154:
	lw $s5, 16($sp)
	li $s6, 12
	beq $s5, $s6, L162
	li $s6, 0
	j L163
L162:
	li $s6, 1
L163:
	beq $s6, $zero, L161
	lw $s6, sym8
	lw $s5, sym19
	blt $s6, $s5, L165
	li $s5, 0
	j L166
L165:
	li $s5, 1
L166:
	beq $s5, $zero, L164
	li $s5, 1
	sw $s5, 16($sp)
L164:
	j L160
L161:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L169
	li $s6, 0
	j L170
L169:
	li $s6, 1
L170:
	beq $s6, $zero, L168
	lw $s6, sym8
	lw $s5, sym20
	blt $s6, $s5, L172
	li $s5, 0
	j L173
L172:
	li $s5, 1
L173:
	beq $s5, $zero, L171
	li $s5, 1
	sw $s5, 16($sp)
L171:
	j L167
L168:
	lw $s5, 16($sp)
	li $s6, 14
	beq $s5, $s6, L175
	li $s6, 0
	j L176
L175:
	li $s6, 1
L176:
	beq $s6, $zero, L174
	lw $s6, sym8
	lw $s5, sym21
	blt $s6, $s5, L178
	li $s5, 0
	j L179
L178:
	li $s5, 1
L179:
	beq $s5, $zero, L177
	li $s5, 1
	sw $s5, 16($sp)
L177:
L174:
L167:
L160:
L153:
L146:
L139:
L132:
L125:
L118:
L111:
L104:
L97:
L90:
L83:
L76:
	j L72
L73:
	lw $s5, 8($sp)
	li $s6, 2
	beq $s5, $s6, L182
	li $s6, 0
	j L183
L182:
	li $s6, 1
L183:
	beq $s6, $zero, L181
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L186
	li $s5, 0
	j L187
L186:
	li $s5, 1
L187:
	beq $s5, $zero, L185
	lw $s5, sym9
	lw $s6, sym7
	blt $s5, $s6, L189
	li $s6, 0
	j L190
L189:
	li $s6, 1
L190:
	beq $s6, $zero, L188
	li $s6, 2
	sw $s6, 16($sp)
L188:
	j L184
L185:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L193
	li $s5, 0
	j L194
L193:
	li $s5, 1
L194:
	beq $s5, $zero, L192
	lw $s5, sym9
	lw $s6, sym8
	blt $s5, $s6, L196
	li $s6, 0
	j L197
L196:
	li $s6, 1
L197:
	beq $s6, $zero, L195
	li $s6, 2
	sw $s6, 16($sp)
L195:
	j L191
L192:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L200
	li $s5, 0
	j L201
L200:
	li $s5, 1
L201:
	beq $s5, $zero, L199
	lw $s5, sym9
	lw $s6, sym9
	blt $s5, $s6, L203
	li $s6, 0
	j L204
L203:
	li $s6, 1
L204:
	beq $s6, $zero, L202
	li $s6, 2
	sw $s6, 16($sp)
L202:
	j L198
L199:
	lw $s6, 16($sp)
	li $s5, 3
	beq $s6, $s5, L207
	li $s5, 0
	j L208
L207:
	li $s5, 1
L208:
	beq $s5, $zero, L206
	lw $s5, sym9
	lw $s6, sym10
	blt $s5, $s6, L210
	li $s6, 0
	j L211
L210:
	li $s6, 1
L211:
	beq $s6, $zero, L209
	li $s6, 2
	sw $s6, 16($sp)
L209:
	j L205
L206:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L214
	li $s5, 0
	j L215
L214:
	li $s5, 1
L215:
	beq $s5, $zero, L213
	lw $s5, sym9
	lw $s6, sym11
	blt $s5, $s6, L217
	li $s6, 0
	j L218
L217:
	li $s6, 1
L218:
	beq $s6, $zero, L216
	li $s6, 2
	sw $s6, 16($sp)
L216:
	j L212
L213:
	lw $s6, 16($sp)
	li $s5, 5
	beq $s6, $s5, L221
	li $s5, 0
	j L222
L221:
	li $s5, 1
L222:
	beq $s5, $zero, L220
	lw $s5, sym9
	lw $s6, sym12
	blt $s5, $s6, L224
	li $s6, 0
	j L225
L224:
	li $s6, 1
L225:
	beq $s6, $zero, L223
	li $s6, 2
	sw $s6, 16($sp)
L223:
	j L219
L220:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L228
	li $s5, 0
	j L229
L228:
	li $s5, 1
L229:
	beq $s5, $zero, L227
	lw $s5, sym9
	lw $s6, sym13
	blt $s5, $s6, L231
	li $s6, 0
	j L232
L231:
	li $s6, 1
L232:
	beq $s6, $zero, L230
	li $s6, 2
	sw $s6, 16($sp)
L230:
	j L226
L227:
	lw $s6, 16($sp)
	li $s5, 7
	beq $s6, $s5, L235
	li $s5, 0
	j L236
L235:
	li $s5, 1
L236:
	beq $s5, $zero, L234
	lw $s5, sym9
	lw $s6, sym14
	blt $s5, $s6, L238
	li $s6, 0
	j L239
L238:
	li $s6, 1
L239:
	beq $s6, $zero, L237
	li $s6, 2
	sw $s6, 16($sp)
L237:
	j L233
L234:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L242
	li $s5, 0
	j L243
L242:
	li $s5, 1
L243:
	beq $s5, $zero, L241
	lw $s5, sym9
	lw $s6, sym15
	blt $s5, $s6, L245
	li $s6, 0
	j L246
L245:
	li $s6, 1
L246:
	beq $s6, $zero, L244
	li $s6, 2
	sw $s6, 16($sp)
L244:
	j L240
L241:
	lw $s6, 16($sp)
	li $s5, 9
	beq $s6, $s5, L249
	li $s5, 0
	j L250
L249:
	li $s5, 1
L250:
	beq $s5, $zero, L248
	lw $s5, sym9
	lw $s6, sym16
	blt $s5, $s6, L252
	li $s6, 0
	j L253
L252:
	li $s6, 1
L253:
	beq $s6, $zero, L251
	li $s6, 2
	sw $s6, 16($sp)
L251:
	j L247
L248:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L256
	li $s5, 0
	j L257
L256:
	li $s5, 1
L257:
	beq $s5, $zero, L255
	lw $s5, sym9
	lw $s6, sym17
	blt $s5, $s6, L259
	li $s6, 0
	j L260
L259:
	li $s6, 1
L260:
	beq $s6, $zero, L258
	li $s6, 2
	sw $s6, 16($sp)
L258:
	j L254
L255:
	lw $s6, 16($sp)
	li $s5, 11
	beq $s6, $s5, L263
	li $s5, 0
	j L264
L263:
	li $s5, 1
L264:
	beq $s5, $zero, L262
	lw $s5, sym9
	lw $s6, sym18
	blt $s5, $s6, L266
	li $s6, 0
	j L267
L266:
	li $s6, 1
L267:
	beq $s6, $zero, L265
	li $s6, 2
	sw $s6, 16($sp)
L265:
	j L261
L262:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L270
	li $s5, 0
	j L271
L270:
	li $s5, 1
L271:
	beq $s5, $zero, L269
	lw $s5, sym9
	lw $s6, sym19
	blt $s5, $s6, L273
	li $s6, 0
	j L274
L273:
	li $s6, 1
L274:
	beq $s6, $zero, L272
	li $s6, 2
	sw $s6, 16($sp)
L272:
	j L268
L269:
	lw $s6, 16($sp)
	li $s5, 13
	beq $s6, $s5, L277
	li $s5, 0
	j L278
L277:
	li $s5, 1
L278:
	beq $s5, $zero, L276
	lw $s5, sym9
	lw $s6, sym20
	blt $s5, $s6, L280
	li $s6, 0
	j L281
L280:
	li $s6, 1
L281:
	beq $s6, $zero, L279
	li $s6, 2
	sw $s6, 16($sp)
L279:
	j L275
L276:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L283
	li $s5, 0
	j L284
L283:
	li $s5, 1
L284:
	beq $s5, $zero, L282
	lw $s5, sym9
	lw $s6, sym21
	blt $s5, $s6, L286
	li $s6, 0
	j L287
L286:
	li $s6, 1
L287:
	beq $s6, $zero, L285
	li $s6, 2
	sw $s6, 16($sp)
L285:
L282:
L275:
L268:
L261:
L254:
L247:
L240:
L233:
L226:
L219:
L212:
L205:
L198:
L191:
L184:
	j L180
L181:
	lw $s6, 8($sp)
	li $s5, 3
	beq $s6, $s5, L290
	li $s5, 0
	j L291
L290:
	li $s5, 1
L291:
	beq $s5, $zero, L289
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L294
	li $s6, 0
	j L295
L294:
	li $s6, 1
L295:
	beq $s6, $zero, L293
	lw $s6, sym10
	lw $s5, sym7
	blt $s6, $s5, L297
	li $s5, 0
	j L298
L297:
	li $s5, 1
L298:
	beq $s5, $zero, L296
	li $s5, 3
	sw $s5, 16($sp)
L296:
	j L292
L293:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L301
	li $s6, 0
	j L302
L301:
	li $s6, 1
L302:
	beq $s6, $zero, L300
	lw $s6, sym10
	lw $s5, sym8
	blt $s6, $s5, L304
	li $s5, 0
	j L305
L304:
	li $s5, 1
L305:
	beq $s5, $zero, L303
	li $s5, 3
	sw $s5, 16($sp)
L303:
	j L299
L300:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L308
	li $s6, 0
	j L309
L308:
	li $s6, 1
L309:
	beq $s6, $zero, L307
	lw $s6, sym10
	lw $s5, sym9
	blt $s6, $s5, L311
	li $s5, 0
	j L312
L311:
	li $s5, 1
L312:
	beq $s5, $zero, L310
	li $s5, 3
	sw $s5, 16($sp)
L310:
	j L306
L307:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L315
	li $s6, 0
	j L316
L315:
	li $s6, 1
L316:
	beq $s6, $zero, L314
	lw $s6, sym10
	lw $s5, sym10
	blt $s6, $s5, L318
	li $s5, 0
	j L319
L318:
	li $s5, 1
L319:
	beq $s5, $zero, L317
	li $s5, 3
	sw $s5, 16($sp)
L317:
	j L313
L314:
	lw $s5, 16($sp)
	li $s6, 4
	beq $s5, $s6, L322
	li $s6, 0
	j L323
L322:
	li $s6, 1
L323:
	beq $s6, $zero, L321
	lw $s6, sym10
	lw $s5, sym11
	blt $s6, $s5, L325
	li $s5, 0
	j L326
L325:
	li $s5, 1
L326:
	beq $s5, $zero, L324
	li $s5, 3
	sw $s5, 16($sp)
L324:
	j L320
L321:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L329
	li $s6, 0
	j L330
L329:
	li $s6, 1
L330:
	beq $s6, $zero, L328
	lw $s6, sym10
	lw $s5, sym12
	blt $s6, $s5, L332
	li $s5, 0
	j L333
L332:
	li $s5, 1
L333:
	beq $s5, $zero, L331
	li $s5, 3
	sw $s5, 16($sp)
L331:
	j L327
L328:
	lw $s5, 16($sp)
	li $s6, 6
	beq $s5, $s6, L336
	li $s6, 0
	j L337
L336:
	li $s6, 1
L337:
	beq $s6, $zero, L335
	lw $s6, sym10
	lw $s5, sym13
	blt $s6, $s5, L339
	li $s5, 0
	j L340
L339:
	li $s5, 1
L340:
	beq $s5, $zero, L338
	li $s5, 3
	sw $s5, 16($sp)
L338:
	j L334
L335:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L343
	li $s6, 0
	j L344
L343:
	li $s6, 1
L344:
	beq $s6, $zero, L342
	lw $s6, sym10
	lw $s5, sym14
	blt $s6, $s5, L346
	li $s5, 0
	j L347
L346:
	li $s5, 1
L347:
	beq $s5, $zero, L345
	li $s5, 3
	sw $s5, 16($sp)
L345:
	j L341
L342:
	lw $s5, 16($sp)
	li $s6, 8
	beq $s5, $s6, L350
	li $s6, 0
	j L351
L350:
	li $s6, 1
L351:
	beq $s6, $zero, L349
	lw $s6, sym10
	lw $s5, sym15
	blt $s6, $s5, L353
	li $s5, 0
	j L354
L353:
	li $s5, 1
L354:
	beq $s5, $zero, L352
	li $s5, 3
	sw $s5, 16($sp)
L352:
	j L348
L349:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L357
	li $s6, 0
	j L358
L357:
	li $s6, 1
L358:
	beq $s6, $zero, L356
	lw $s6, sym10
	lw $s5, sym16
	blt $s6, $s5, L360
	li $s5, 0
	j L361
L360:
	li $s5, 1
L361:
	beq $s5, $zero, L359
	li $s5, 3
	sw $s5, 16($sp)
L359:
	j L355
L356:
	lw $s5, 16($sp)
	li $s6, 10
	beq $s5, $s6, L364
	li $s6, 0
	j L365
L364:
	li $s6, 1
L365:
	beq $s6, $zero, L363
	lw $s6, sym10
	lw $s5, sym17
	blt $s6, $s5, L367
	li $s5, 0
	j L368
L367:
	li $s5, 1
L368:
	beq $s5, $zero, L366
	li $s5, 3
	sw $s5, 16($sp)
L366:
	j L362
L363:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L371
	li $s6, 0
	j L372
L371:
	li $s6, 1
L372:
	beq $s6, $zero, L370
	lw $s6, sym10
	lw $s5, sym18
	blt $s6, $s5, L374
	li $s5, 0
	j L375
L374:
	li $s5, 1
L375:
	beq $s5, $zero, L373
	li $s5, 3
	sw $s5, 16($sp)
L373:
	j L369
L370:
	lw $s5, 16($sp)
	li $s6, 12
	beq $s5, $s6, L378
	li $s6, 0
	j L379
L378:
	li $s6, 1
L379:
	beq $s6, $zero, L377
	lw $s6, sym10
	lw $s5, sym19
	blt $s6, $s5, L381
	li $s5, 0
	j L382
L381:
	li $s5, 1
L382:
	beq $s5, $zero, L380
	li $s5, 3
	sw $s5, 16($sp)
L380:
	j L376
L377:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L385
	li $s6, 0
	j L386
L385:
	li $s6, 1
L386:
	beq $s6, $zero, L384
	lw $s6, sym10
	lw $s5, sym20
	blt $s6, $s5, L388
	li $s5, 0
	j L389
L388:
	li $s5, 1
L389:
	beq $s5, $zero, L387
	li $s5, 3
	sw $s5, 16($sp)
L387:
	j L383
L384:
	lw $s5, 16($sp)
	li $s6, 14
	beq $s5, $s6, L391
	li $s6, 0
	j L392
L391:
	li $s6, 1
L392:
	beq $s6, $zero, L390
	lw $s6, sym10
	lw $s5, sym21
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
L390:
L383:
L376:
L369:
L362:
L355:
L348:
L341:
L334:
L327:
L320:
L313:
L306:
L299:
L292:
	j L288
L289:
	lw $s5, 8($sp)
	li $s6, 4
	beq $s5, $s6, L398
	li $s6, 0
	j L399
L398:
	li $s6, 1
L399:
	beq $s6, $zero, L397
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L402
	li $s5, 0
	j L403
L402:
	li $s5, 1
L403:
	beq $s5, $zero, L401
	lw $s5, sym11
	lw $s6, sym7
	blt $s5, $s6, L405
	li $s6, 0
	j L406
L405:
	li $s6, 1
L406:
	beq $s6, $zero, L404
	li $s6, 4
	sw $s6, 16($sp)
L404:
	j L400
L401:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L409
	li $s5, 0
	j L410
L409:
	li $s5, 1
L410:
	beq $s5, $zero, L408
	lw $s5, sym11
	lw $s6, sym8
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
	li $s5, 2
	beq $s6, $s5, L416
	li $s5, 0
	j L417
L416:
	li $s5, 1
L417:
	beq $s5, $zero, L415
	lw $s5, sym11
	lw $s6, sym9
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
	li $s5, 3
	beq $s6, $s5, L423
	li $s5, 0
	j L424
L423:
	li $s5, 1
L424:
	beq $s5, $zero, L422
	lw $s5, sym11
	lw $s6, sym10
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
	li $s5, 4
	beq $s6, $s5, L430
	li $s5, 0
	j L431
L430:
	li $s5, 1
L431:
	beq $s5, $zero, L429
	lw $s5, sym11
	lw $s6, sym11
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
	li $s5, 5
	beq $s6, $s5, L437
	li $s5, 0
	j L438
L437:
	li $s5, 1
L438:
	beq $s5, $zero, L436
	lw $s5, sym11
	lw $s6, sym12
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
	li $s5, 6
	beq $s6, $s5, L444
	li $s5, 0
	j L445
L444:
	li $s5, 1
L445:
	beq $s5, $zero, L443
	lw $s5, sym11
	lw $s6, sym13
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
	li $s5, 7
	beq $s6, $s5, L451
	li $s5, 0
	j L452
L451:
	li $s5, 1
L452:
	beq $s5, $zero, L450
	lw $s5, sym11
	lw $s6, sym14
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
	li $s5, 8
	beq $s6, $s5, L458
	li $s5, 0
	j L459
L458:
	li $s5, 1
L459:
	beq $s5, $zero, L457
	lw $s5, sym11
	lw $s6, sym15
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
	li $s5, 9
	beq $s6, $s5, L465
	li $s5, 0
	j L466
L465:
	li $s5, 1
L466:
	beq $s5, $zero, L464
	lw $s5, sym11
	lw $s6, sym16
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
	li $s5, 10
	beq $s6, $s5, L472
	li $s5, 0
	j L473
L472:
	li $s5, 1
L473:
	beq $s5, $zero, L471
	lw $s5, sym11
	lw $s6, sym17
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
	li $s5, 11
	beq $s6, $s5, L479
	li $s5, 0
	j L480
L479:
	li $s5, 1
L480:
	beq $s5, $zero, L478
	lw $s5, sym11
	lw $s6, sym18
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
	li $s5, 12
	beq $s6, $s5, L486
	li $s5, 0
	j L487
L486:
	li $s5, 1
L487:
	beq $s5, $zero, L485
	lw $s5, sym11
	lw $s6, sym19
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
	li $s5, 13
	beq $s6, $s5, L493
	li $s5, 0
	j L494
L493:
	li $s5, 1
L494:
	beq $s5, $zero, L492
	lw $s5, sym11
	lw $s6, sym20
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
	li $s5, 14
	beq $s6, $s5, L499
	li $s5, 0
	j L500
L499:
	li $s5, 1
L500:
	beq $s5, $zero, L498
	lw $s5, sym11
	lw $s6, sym21
	blt $s5, $s6, L502
	li $s6, 0
	j L503
L502:
	li $s6, 1
L503:
	beq $s6, $zero, L501
	li $s6, 4
	sw $s6, 16($sp)
L501:
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
L400:
	j L396
L397:
	lw $s6, 8($sp)
	li $s5, 5
	beq $s6, $s5, L506
	li $s5, 0
	j L507
L506:
	li $s5, 1
L507:
	beq $s5, $zero, L505
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L510
	li $s6, 0
	j L511
L510:
	li $s6, 1
L511:
	beq $s6, $zero, L509
	lw $s6, sym12
	lw $s5, sym7
	blt $s6, $s5, L513
	li $s5, 0
	j L514
L513:
	li $s5, 1
L514:
	beq $s5, $zero, L512
	li $s5, 5
	sw $s5, 16($sp)
L512:
	j L508
L509:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L517
	li $s6, 0
	j L518
L517:
	li $s6, 1
L518:
	beq $s6, $zero, L516
	lw $s6, sym12
	lw $s5, sym8
	blt $s6, $s5, L520
	li $s5, 0
	j L521
L520:
	li $s5, 1
L521:
	beq $s5, $zero, L519
	li $s5, 5
	sw $s5, 16($sp)
L519:
	j L515
L516:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L524
	li $s6, 0
	j L525
L524:
	li $s6, 1
L525:
	beq $s6, $zero, L523
	lw $s6, sym12
	lw $s5, sym9
	blt $s6, $s5, L527
	li $s5, 0
	j L528
L527:
	li $s5, 1
L528:
	beq $s5, $zero, L526
	li $s5, 5
	sw $s5, 16($sp)
L526:
	j L522
L523:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L531
	li $s6, 0
	j L532
L531:
	li $s6, 1
L532:
	beq $s6, $zero, L530
	lw $s6, sym12
	lw $s5, sym10
	blt $s6, $s5, L534
	li $s5, 0
	j L535
L534:
	li $s5, 1
L535:
	beq $s5, $zero, L533
	li $s5, 5
	sw $s5, 16($sp)
L533:
	j L529
L530:
	lw $s5, 16($sp)
	li $s6, 4
	beq $s5, $s6, L538
	li $s6, 0
	j L539
L538:
	li $s6, 1
L539:
	beq $s6, $zero, L537
	lw $s6, sym12
	lw $s5, sym11
	blt $s6, $s5, L541
	li $s5, 0
	j L542
L541:
	li $s5, 1
L542:
	beq $s5, $zero, L540
	li $s5, 5
	sw $s5, 16($sp)
L540:
	j L536
L537:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L545
	li $s6, 0
	j L546
L545:
	li $s6, 1
L546:
	beq $s6, $zero, L544
	lw $s6, sym12
	lw $s5, sym12
	blt $s6, $s5, L548
	li $s5, 0
	j L549
L548:
	li $s5, 1
L549:
	beq $s5, $zero, L547
	li $s5, 5
	sw $s5, 16($sp)
L547:
	j L543
L544:
	lw $s5, 16($sp)
	li $s6, 6
	beq $s5, $s6, L552
	li $s6, 0
	j L553
L552:
	li $s6, 1
L553:
	beq $s6, $zero, L551
	lw $s6, sym12
	lw $s5, sym13
	blt $s6, $s5, L555
	li $s5, 0
	j L556
L555:
	li $s5, 1
L556:
	beq $s5, $zero, L554
	li $s5, 5
	sw $s5, 16($sp)
L554:
	j L550
L551:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L559
	li $s6, 0
	j L560
L559:
	li $s6, 1
L560:
	beq $s6, $zero, L558
	lw $s6, sym12
	lw $s5, sym14
	blt $s6, $s5, L562
	li $s5, 0
	j L563
L562:
	li $s5, 1
L563:
	beq $s5, $zero, L561
	li $s5, 5
	sw $s5, 16($sp)
L561:
	j L557
L558:
	lw $s5, 16($sp)
	li $s6, 8
	beq $s5, $s6, L566
	li $s6, 0
	j L567
L566:
	li $s6, 1
L567:
	beq $s6, $zero, L565
	lw $s6, sym12
	lw $s5, sym15
	blt $s6, $s5, L569
	li $s5, 0
	j L570
L569:
	li $s5, 1
L570:
	beq $s5, $zero, L568
	li $s5, 5
	sw $s5, 16($sp)
L568:
	j L564
L565:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L573
	li $s6, 0
	j L574
L573:
	li $s6, 1
L574:
	beq $s6, $zero, L572
	lw $s6, sym12
	lw $s5, sym16
	blt $s6, $s5, L576
	li $s5, 0
	j L577
L576:
	li $s5, 1
L577:
	beq $s5, $zero, L575
	li $s5, 5
	sw $s5, 16($sp)
L575:
	j L571
L572:
	lw $s5, 16($sp)
	li $s6, 10
	beq $s5, $s6, L580
	li $s6, 0
	j L581
L580:
	li $s6, 1
L581:
	beq $s6, $zero, L579
	lw $s6, sym12
	lw $s5, sym17
	blt $s6, $s5, L583
	li $s5, 0
	j L584
L583:
	li $s5, 1
L584:
	beq $s5, $zero, L582
	li $s5, 5
	sw $s5, 16($sp)
L582:
	j L578
L579:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L587
	li $s6, 0
	j L588
L587:
	li $s6, 1
L588:
	beq $s6, $zero, L586
	lw $s6, sym12
	lw $s5, sym18
	blt $s6, $s5, L590
	li $s5, 0
	j L591
L590:
	li $s5, 1
L591:
	beq $s5, $zero, L589
	li $s5, 5
	sw $s5, 16($sp)
L589:
	j L585
L586:
	lw $s5, 16($sp)
	li $s6, 12
	beq $s5, $s6, L594
	li $s6, 0
	j L595
L594:
	li $s6, 1
L595:
	beq $s6, $zero, L593
	lw $s6, sym12
	lw $s5, sym19
	blt $s6, $s5, L597
	li $s5, 0
	j L598
L597:
	li $s5, 1
L598:
	beq $s5, $zero, L596
	li $s5, 5
	sw $s5, 16($sp)
L596:
	j L592
L593:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L601
	li $s6, 0
	j L602
L601:
	li $s6, 1
L602:
	beq $s6, $zero, L600
	lw $s6, sym12
	lw $s5, sym20
	blt $s6, $s5, L604
	li $s5, 0
	j L605
L604:
	li $s5, 1
L605:
	beq $s5, $zero, L603
	li $s5, 5
	sw $s5, 16($sp)
L603:
	j L599
L600:
	lw $s5, 16($sp)
	li $s6, 14
	beq $s5, $s6, L607
	li $s6, 0
	j L608
L607:
	li $s6, 1
L608:
	beq $s6, $zero, L606
	lw $s6, sym12
	lw $s5, sym21
	blt $s6, $s5, L610
	li $s5, 0
	j L611
L610:
	li $s5, 1
L611:
	beq $s5, $zero, L609
	li $s5, 5
	sw $s5, 16($sp)
L609:
L606:
L599:
L592:
L585:
L578:
L571:
L564:
L557:
L550:
L543:
L536:
L529:
L522:
L515:
L508:
	j L504
L505:
	lw $s5, 8($sp)
	li $s6, 6
	beq $s5, $s6, L614
	li $s6, 0
	j L615
L614:
	li $s6, 1
L615:
	beq $s6, $zero, L613
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L618
	li $s5, 0
	j L619
L618:
	li $s5, 1
L619:
	beq $s5, $zero, L617
	lw $s5, sym13
	lw $s6, sym7
	blt $s5, $s6, L621
	li $s6, 0
	j L622
L621:
	li $s6, 1
L622:
	beq $s6, $zero, L620
	li $s6, 6
	sw $s6, 16($sp)
L620:
	j L616
L617:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L625
	li $s5, 0
	j L626
L625:
	li $s5, 1
L626:
	beq $s5, $zero, L624
	lw $s5, sym13
	lw $s6, sym8
	blt $s5, $s6, L628
	li $s6, 0
	j L629
L628:
	li $s6, 1
L629:
	beq $s6, $zero, L627
	li $s6, 6
	sw $s6, 16($sp)
L627:
	j L623
L624:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L632
	li $s5, 0
	j L633
L632:
	li $s5, 1
L633:
	beq $s5, $zero, L631
	lw $s5, sym13
	lw $s6, sym9
	blt $s5, $s6, L635
	li $s6, 0
	j L636
L635:
	li $s6, 1
L636:
	beq $s6, $zero, L634
	li $s6, 6
	sw $s6, 16($sp)
L634:
	j L630
L631:
	lw $s6, 16($sp)
	li $s5, 3
	beq $s6, $s5, L639
	li $s5, 0
	j L640
L639:
	li $s5, 1
L640:
	beq $s5, $zero, L638
	lw $s5, sym13
	lw $s6, sym10
	blt $s5, $s6, L642
	li $s6, 0
	j L643
L642:
	li $s6, 1
L643:
	beq $s6, $zero, L641
	li $s6, 6
	sw $s6, 16($sp)
L641:
	j L637
L638:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L646
	li $s5, 0
	j L647
L646:
	li $s5, 1
L647:
	beq $s5, $zero, L645
	lw $s5, sym13
	lw $s6, sym11
	blt $s5, $s6, L649
	li $s6, 0
	j L650
L649:
	li $s6, 1
L650:
	beq $s6, $zero, L648
	li $s6, 6
	sw $s6, 16($sp)
L648:
	j L644
L645:
	lw $s6, 16($sp)
	li $s5, 5
	beq $s6, $s5, L653
	li $s5, 0
	j L654
L653:
	li $s5, 1
L654:
	beq $s5, $zero, L652
	lw $s5, sym13
	lw $s6, sym12
	blt $s5, $s6, L656
	li $s6, 0
	j L657
L656:
	li $s6, 1
L657:
	beq $s6, $zero, L655
	li $s6, 6
	sw $s6, 16($sp)
L655:
	j L651
L652:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L660
	li $s5, 0
	j L661
L660:
	li $s5, 1
L661:
	beq $s5, $zero, L659
	lw $s5, sym13
	lw $s6, sym13
	blt $s5, $s6, L663
	li $s6, 0
	j L664
L663:
	li $s6, 1
L664:
	beq $s6, $zero, L662
	li $s6, 6
	sw $s6, 16($sp)
L662:
	j L658
L659:
	lw $s6, 16($sp)
	li $s5, 7
	beq $s6, $s5, L667
	li $s5, 0
	j L668
L667:
	li $s5, 1
L668:
	beq $s5, $zero, L666
	lw $s5, sym13
	lw $s6, sym14
	blt $s5, $s6, L670
	li $s6, 0
	j L671
L670:
	li $s6, 1
L671:
	beq $s6, $zero, L669
	li $s6, 6
	sw $s6, 16($sp)
L669:
	j L665
L666:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L674
	li $s5, 0
	j L675
L674:
	li $s5, 1
L675:
	beq $s5, $zero, L673
	lw $s5, sym13
	lw $s6, sym15
	blt $s5, $s6, L677
	li $s6, 0
	j L678
L677:
	li $s6, 1
L678:
	beq $s6, $zero, L676
	li $s6, 6
	sw $s6, 16($sp)
L676:
	j L672
L673:
	lw $s6, 16($sp)
	li $s5, 9
	beq $s6, $s5, L681
	li $s5, 0
	j L682
L681:
	li $s5, 1
L682:
	beq $s5, $zero, L680
	lw $s5, sym13
	lw $s6, sym16
	blt $s5, $s6, L684
	li $s6, 0
	j L685
L684:
	li $s6, 1
L685:
	beq $s6, $zero, L683
	li $s6, 6
	sw $s6, 16($sp)
L683:
	j L679
L680:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L688
	li $s5, 0
	j L689
L688:
	li $s5, 1
L689:
	beq $s5, $zero, L687
	lw $s5, sym13
	lw $s6, sym17
	blt $s5, $s6, L691
	li $s6, 0
	j L692
L691:
	li $s6, 1
L692:
	beq $s6, $zero, L690
	li $s6, 6
	sw $s6, 16($sp)
L690:
	j L686
L687:
	lw $s6, 16($sp)
	li $s5, 11
	beq $s6, $s5, L695
	li $s5, 0
	j L696
L695:
	li $s5, 1
L696:
	beq $s5, $zero, L694
	lw $s5, sym13
	lw $s6, sym18
	blt $s5, $s6, L698
	li $s6, 0
	j L699
L698:
	li $s6, 1
L699:
	beq $s6, $zero, L697
	li $s6, 6
	sw $s6, 16($sp)
L697:
	j L693
L694:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L702
	li $s5, 0
	j L703
L702:
	li $s5, 1
L703:
	beq $s5, $zero, L701
	lw $s5, sym13
	lw $s6, sym19
	blt $s5, $s6, L705
	li $s6, 0
	j L706
L705:
	li $s6, 1
L706:
	beq $s6, $zero, L704
	li $s6, 6
	sw $s6, 16($sp)
L704:
	j L700
L701:
	lw $s6, 16($sp)
	li $s5, 13
	beq $s6, $s5, L709
	li $s5, 0
	j L710
L709:
	li $s5, 1
L710:
	beq $s5, $zero, L708
	lw $s5, sym13
	lw $s6, sym20
	blt $s5, $s6, L712
	li $s6, 0
	j L713
L712:
	li $s6, 1
L713:
	beq $s6, $zero, L711
	li $s6, 6
	sw $s6, 16($sp)
L711:
	j L707
L708:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L715
	li $s5, 0
	j L716
L715:
	li $s5, 1
L716:
	beq $s5, $zero, L714
	lw $s5, sym13
	lw $s6, sym21
	blt $s5, $s6, L718
	li $s6, 0
	j L719
L718:
	li $s6, 1
L719:
	beq $s6, $zero, L717
	li $s6, 6
	sw $s6, 16($sp)
L717:
L714:
L707:
L700:
L693:
L686:
L679:
L672:
L665:
L658:
L651:
L644:
L637:
L630:
L623:
L616:
	j L612
L613:
	lw $s6, 8($sp)
	li $s5, 7
	beq $s6, $s5, L722
	li $s5, 0
	j L723
L722:
	li $s5, 1
L723:
	beq $s5, $zero, L721
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L726
	li $s6, 0
	j L727
L726:
	li $s6, 1
L727:
	beq $s6, $zero, L725
	lw $s6, sym14
	lw $s5, sym7
	blt $s6, $s5, L729
	li $s5, 0
	j L730
L729:
	li $s5, 1
L730:
	beq $s5, $zero, L728
	li $s5, 7
	sw $s5, 16($sp)
L728:
	j L724
L725:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L733
	li $s6, 0
	j L734
L733:
	li $s6, 1
L734:
	beq $s6, $zero, L732
	lw $s6, sym14
	lw $s5, sym8
	blt $s6, $s5, L736
	li $s5, 0
	j L737
L736:
	li $s5, 1
L737:
	beq $s5, $zero, L735
	li $s5, 7
	sw $s5, 16($sp)
L735:
	j L731
L732:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L740
	li $s6, 0
	j L741
L740:
	li $s6, 1
L741:
	beq $s6, $zero, L739
	lw $s6, sym14
	lw $s5, sym9
	blt $s6, $s5, L743
	li $s5, 0
	j L744
L743:
	li $s5, 1
L744:
	beq $s5, $zero, L742
	li $s5, 7
	sw $s5, 16($sp)
L742:
	j L738
L739:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L747
	li $s6, 0
	j L748
L747:
	li $s6, 1
L748:
	beq $s6, $zero, L746
	lw $s6, sym14
	lw $s5, sym10
	blt $s6, $s5, L750
	li $s5, 0
	j L751
L750:
	li $s5, 1
L751:
	beq $s5, $zero, L749
	li $s5, 7
	sw $s5, 16($sp)
L749:
	j L745
L746:
	lw $s5, 16($sp)
	li $s6, 4
	beq $s5, $s6, L754
	li $s6, 0
	j L755
L754:
	li $s6, 1
L755:
	beq $s6, $zero, L753
	lw $s6, sym14
	lw $s5, sym11
	blt $s6, $s5, L757
	li $s5, 0
	j L758
L757:
	li $s5, 1
L758:
	beq $s5, $zero, L756
	li $s5, 7
	sw $s5, 16($sp)
L756:
	j L752
L753:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L761
	li $s6, 0
	j L762
L761:
	li $s6, 1
L762:
	beq $s6, $zero, L760
	lw $s6, sym14
	lw $s5, sym12
	blt $s6, $s5, L764
	li $s5, 0
	j L765
L764:
	li $s5, 1
L765:
	beq $s5, $zero, L763
	li $s5, 7
	sw $s5, 16($sp)
L763:
	j L759
L760:
	lw $s5, 16($sp)
	li $s6, 6
	beq $s5, $s6, L768
	li $s6, 0
	j L769
L768:
	li $s6, 1
L769:
	beq $s6, $zero, L767
	lw $s6, sym14
	lw $s5, sym13
	blt $s6, $s5, L771
	li $s5, 0
	j L772
L771:
	li $s5, 1
L772:
	beq $s5, $zero, L770
	li $s5, 7
	sw $s5, 16($sp)
L770:
	j L766
L767:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L775
	li $s6, 0
	j L776
L775:
	li $s6, 1
L776:
	beq $s6, $zero, L774
	lw $s6, sym14
	lw $s5, sym14
	blt $s6, $s5, L778
	li $s5, 0
	j L779
L778:
	li $s5, 1
L779:
	beq $s5, $zero, L777
	li $s5, 7
	sw $s5, 16($sp)
L777:
	j L773
L774:
	lw $s5, 16($sp)
	li $s6, 8
	beq $s5, $s6, L782
	li $s6, 0
	j L783
L782:
	li $s6, 1
L783:
	beq $s6, $zero, L781
	lw $s6, sym14
	lw $s5, sym15
	blt $s6, $s5, L785
	li $s5, 0
	j L786
L785:
	li $s5, 1
L786:
	beq $s5, $zero, L784
	li $s5, 7
	sw $s5, 16($sp)
L784:
	j L780
L781:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L789
	li $s6, 0
	j L790
L789:
	li $s6, 1
L790:
	beq $s6, $zero, L788
	lw $s6, sym14
	lw $s5, sym16
	blt $s6, $s5, L792
	li $s5, 0
	j L793
L792:
	li $s5, 1
L793:
	beq $s5, $zero, L791
	li $s5, 7
	sw $s5, 16($sp)
L791:
	j L787
L788:
	lw $s5, 16($sp)
	li $s6, 10
	beq $s5, $s6, L796
	li $s6, 0
	j L797
L796:
	li $s6, 1
L797:
	beq $s6, $zero, L795
	lw $s6, sym14
	lw $s5, sym17
	blt $s6, $s5, L799
	li $s5, 0
	j L800
L799:
	li $s5, 1
L800:
	beq $s5, $zero, L798
	li $s5, 7
	sw $s5, 16($sp)
L798:
	j L794
L795:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L803
	li $s6, 0
	j L804
L803:
	li $s6, 1
L804:
	beq $s6, $zero, L802
	lw $s6, sym14
	lw $s5, sym18
	blt $s6, $s5, L806
	li $s5, 0
	j L807
L806:
	li $s5, 1
L807:
	beq $s5, $zero, L805
	li $s5, 7
	sw $s5, 16($sp)
L805:
	j L801
L802:
	lw $s5, 16($sp)
	li $s6, 12
	beq $s5, $s6, L810
	li $s6, 0
	j L811
L810:
	li $s6, 1
L811:
	beq $s6, $zero, L809
	lw $s6, sym14
	lw $s5, sym19
	blt $s6, $s5, L813
	li $s5, 0
	j L814
L813:
	li $s5, 1
L814:
	beq $s5, $zero, L812
	li $s5, 7
	sw $s5, 16($sp)
L812:
	j L808
L809:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L817
	li $s6, 0
	j L818
L817:
	li $s6, 1
L818:
	beq $s6, $zero, L816
	lw $s6, sym14
	lw $s5, sym20
	blt $s6, $s5, L820
	li $s5, 0
	j L821
L820:
	li $s5, 1
L821:
	beq $s5, $zero, L819
	li $s5, 7
	sw $s5, 16($sp)
L819:
	j L815
L816:
	lw $s5, 16($sp)
	li $s6, 14
	beq $s5, $s6, L823
	li $s6, 0
	j L824
L823:
	li $s6, 1
L824:
	beq $s6, $zero, L822
	lw $s6, sym14
	lw $s5, sym21
	blt $s6, $s5, L826
	li $s5, 0
	j L827
L826:
	li $s5, 1
L827:
	beq $s5, $zero, L825
	li $s5, 7
	sw $s5, 16($sp)
L825:
L822:
L815:
L808:
L801:
L794:
L787:
L780:
L773:
L766:
L759:
L752:
L745:
L738:
L731:
L724:
	j L720
L721:
	lw $s5, 8($sp)
	li $s6, 8
	beq $s5, $s6, L830
	li $s6, 0
	j L831
L830:
	li $s6, 1
L831:
	beq $s6, $zero, L829
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L834
	li $s5, 0
	j L835
L834:
	li $s5, 1
L835:
	beq $s5, $zero, L833
	lw $s5, sym15
	lw $s6, sym7
	blt $s5, $s6, L837
	li $s6, 0
	j L838
L837:
	li $s6, 1
L838:
	beq $s6, $zero, L836
	li $s6, 8
	sw $s6, 16($sp)
L836:
	j L832
L833:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L841
	li $s5, 0
	j L842
L841:
	li $s5, 1
L842:
	beq $s5, $zero, L840
	lw $s5, sym15
	lw $s6, sym8
	blt $s5, $s6, L844
	li $s6, 0
	j L845
L844:
	li $s6, 1
L845:
	beq $s6, $zero, L843
	li $s6, 8
	sw $s6, 16($sp)
L843:
	j L839
L840:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L848
	li $s5, 0
	j L849
L848:
	li $s5, 1
L849:
	beq $s5, $zero, L847
	lw $s5, sym15
	lw $s6, sym9
	blt $s5, $s6, L851
	li $s6, 0
	j L852
L851:
	li $s6, 1
L852:
	beq $s6, $zero, L850
	li $s6, 8
	sw $s6, 16($sp)
L850:
	j L846
L847:
	lw $s6, 16($sp)
	li $s5, 3
	beq $s6, $s5, L855
	li $s5, 0
	j L856
L855:
	li $s5, 1
L856:
	beq $s5, $zero, L854
	lw $s5, sym15
	lw $s6, sym10
	blt $s5, $s6, L858
	li $s6, 0
	j L859
L858:
	li $s6, 1
L859:
	beq $s6, $zero, L857
	li $s6, 8
	sw $s6, 16($sp)
L857:
	j L853
L854:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L862
	li $s5, 0
	j L863
L862:
	li $s5, 1
L863:
	beq $s5, $zero, L861
	lw $s5, sym15
	lw $s6, sym11
	blt $s5, $s6, L865
	li $s6, 0
	j L866
L865:
	li $s6, 1
L866:
	beq $s6, $zero, L864
	li $s6, 8
	sw $s6, 16($sp)
L864:
	j L860
L861:
	lw $s6, 16($sp)
	li $s5, 5
	beq $s6, $s5, L869
	li $s5, 0
	j L870
L869:
	li $s5, 1
L870:
	beq $s5, $zero, L868
	lw $s5, sym15
	lw $s6, sym12
	blt $s5, $s6, L872
	li $s6, 0
	j L873
L872:
	li $s6, 1
L873:
	beq $s6, $zero, L871
	li $s6, 8
	sw $s6, 16($sp)
L871:
	j L867
L868:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L876
	li $s5, 0
	j L877
L876:
	li $s5, 1
L877:
	beq $s5, $zero, L875
	lw $s5, sym15
	lw $s6, sym13
	blt $s5, $s6, L879
	li $s6, 0
	j L880
L879:
	li $s6, 1
L880:
	beq $s6, $zero, L878
	li $s6, 8
	sw $s6, 16($sp)
L878:
	j L874
L875:
	lw $s6, 16($sp)
	li $s5, 7
	beq $s6, $s5, L883
	li $s5, 0
	j L884
L883:
	li $s5, 1
L884:
	beq $s5, $zero, L882
	lw $s5, sym15
	lw $s6, sym14
	blt $s5, $s6, L886
	li $s6, 0
	j L887
L886:
	li $s6, 1
L887:
	beq $s6, $zero, L885
	li $s6, 8
	sw $s6, 16($sp)
L885:
	j L881
L882:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L890
	li $s5, 0
	j L891
L890:
	li $s5, 1
L891:
	beq $s5, $zero, L889
	lw $s5, sym15
	lw $s6, sym15
	blt $s5, $s6, L893
	li $s6, 0
	j L894
L893:
	li $s6, 1
L894:
	beq $s6, $zero, L892
	li $s6, 8
	sw $s6, 16($sp)
L892:
	j L888
L889:
	lw $s6, 16($sp)
	li $s5, 9
	beq $s6, $s5, L897
	li $s5, 0
	j L898
L897:
	li $s5, 1
L898:
	beq $s5, $zero, L896
	lw $s5, sym15
	lw $s6, sym16
	blt $s5, $s6, L900
	li $s6, 0
	j L901
L900:
	li $s6, 1
L901:
	beq $s6, $zero, L899
	li $s6, 8
	sw $s6, 16($sp)
L899:
	j L895
L896:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L904
	li $s5, 0
	j L905
L904:
	li $s5, 1
L905:
	beq $s5, $zero, L903
	lw $s5, sym15
	lw $s6, sym17
	blt $s5, $s6, L907
	li $s6, 0
	j L908
L907:
	li $s6, 1
L908:
	beq $s6, $zero, L906
	li $s6, 8
	sw $s6, 16($sp)
L906:
	j L902
L903:
	lw $s6, 16($sp)
	li $s5, 11
	beq $s6, $s5, L911
	li $s5, 0
	j L912
L911:
	li $s5, 1
L912:
	beq $s5, $zero, L910
	lw $s5, sym15
	lw $s6, sym18
	blt $s5, $s6, L914
	li $s6, 0
	j L915
L914:
	li $s6, 1
L915:
	beq $s6, $zero, L913
	li $s6, 8
	sw $s6, 16($sp)
L913:
	j L909
L910:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L918
	li $s5, 0
	j L919
L918:
	li $s5, 1
L919:
	beq $s5, $zero, L917
	lw $s5, sym15
	lw $s6, sym19
	blt $s5, $s6, L921
	li $s6, 0
	j L922
L921:
	li $s6, 1
L922:
	beq $s6, $zero, L920
	li $s6, 8
	sw $s6, 16($sp)
L920:
	j L916
L917:
	lw $s6, 16($sp)
	li $s5, 13
	beq $s6, $s5, L925
	li $s5, 0
	j L926
L925:
	li $s5, 1
L926:
	beq $s5, $zero, L924
	lw $s5, sym15
	lw $s6, sym20
	blt $s5, $s6, L928
	li $s6, 0
	j L929
L928:
	li $s6, 1
L929:
	beq $s6, $zero, L927
	li $s6, 8
	sw $s6, 16($sp)
L927:
	j L923
L924:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L931
	li $s5, 0
	j L932
L931:
	li $s5, 1
L932:
	beq $s5, $zero, L930
	lw $s5, sym15
	lw $s6, sym21
	blt $s5, $s6, L934
	li $s6, 0
	j L935
L934:
	li $s6, 1
L935:
	beq $s6, $zero, L933
	li $s6, 8
	sw $s6, 16($sp)
L933:
L930:
L923:
L916:
L909:
L902:
L895:
L888:
L881:
L874:
L867:
L860:
L853:
L846:
L839:
L832:
	j L828
L829:
	lw $s6, 8($sp)
	li $s5, 9
	beq $s6, $s5, L938
	li $s5, 0
	j L939
L938:
	li $s5, 1
L939:
	beq $s5, $zero, L937
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L942
	li $s6, 0
	j L943
L942:
	li $s6, 1
L943:
	beq $s6, $zero, L941
	lw $s6, sym16
	lw $s5, sym7
	blt $s6, $s5, L945
	li $s5, 0
	j L946
L945:
	li $s5, 1
L946:
	beq $s5, $zero, L944
	li $s5, 9
	sw $s5, 16($sp)
L944:
	j L940
L941:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L949
	li $s6, 0
	j L950
L949:
	li $s6, 1
L950:
	beq $s6, $zero, L948
	lw $s6, sym16
	lw $s5, sym8
	blt $s6, $s5, L952
	li $s5, 0
	j L953
L952:
	li $s5, 1
L953:
	beq $s5, $zero, L951
	li $s5, 9
	sw $s5, 16($sp)
L951:
	j L947
L948:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L956
	li $s6, 0
	j L957
L956:
	li $s6, 1
L957:
	beq $s6, $zero, L955
	lw $s6, sym16
	lw $s5, sym9
	blt $s6, $s5, L959
	li $s5, 0
	j L960
L959:
	li $s5, 1
L960:
	beq $s5, $zero, L958
	li $s5, 9
	sw $s5, 16($sp)
L958:
	j L954
L955:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L963
	li $s6, 0
	j L964
L963:
	li $s6, 1
L964:
	beq $s6, $zero, L962
	lw $s6, sym16
	lw $s5, sym10
	blt $s6, $s5, L966
	li $s5, 0
	j L967
L966:
	li $s5, 1
L967:
	beq $s5, $zero, L965
	li $s5, 9
	sw $s5, 16($sp)
L965:
	j L961
L962:
	lw $s5, 16($sp)
	li $s6, 4
	beq $s5, $s6, L970
	li $s6, 0
	j L971
L970:
	li $s6, 1
L971:
	beq $s6, $zero, L969
	lw $s6, sym16
	lw $s5, sym11
	blt $s6, $s5, L973
	li $s5, 0
	j L974
L973:
	li $s5, 1
L974:
	beq $s5, $zero, L972
	li $s5, 9
	sw $s5, 16($sp)
L972:
	j L968
L969:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L977
	li $s6, 0
	j L978
L977:
	li $s6, 1
L978:
	beq $s6, $zero, L976
	lw $s6, sym16
	lw $s5, sym12
	blt $s6, $s5, L980
	li $s5, 0
	j L981
L980:
	li $s5, 1
L981:
	beq $s5, $zero, L979
	li $s5, 9
	sw $s5, 16($sp)
L979:
	j L975
L976:
	lw $s5, 16($sp)
	li $s6, 6
	beq $s5, $s6, L984
	li $s6, 0
	j L985
L984:
	li $s6, 1
L985:
	beq $s6, $zero, L983
	lw $s6, sym16
	lw $s5, sym13
	blt $s6, $s5, L987
	li $s5, 0
	j L988
L987:
	li $s5, 1
L988:
	beq $s5, $zero, L986
	li $s5, 9
	sw $s5, 16($sp)
L986:
	j L982
L983:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L991
	li $s6, 0
	j L992
L991:
	li $s6, 1
L992:
	beq $s6, $zero, L990
	lw $s6, sym16
	lw $s5, sym14
	blt $s6, $s5, L994
	li $s5, 0
	j L995
L994:
	li $s5, 1
L995:
	beq $s5, $zero, L993
	li $s5, 9
	sw $s5, 16($sp)
L993:
	j L989
L990:
	lw $s5, 16($sp)
	li $s6, 8
	beq $s5, $s6, L998
	li $s6, 0
	j L999
L998:
	li $s6, 1
L999:
	beq $s6, $zero, L997
	lw $s6, sym16
	lw $s5, sym15
	blt $s6, $s5, L1001
	li $s5, 0
	j L1002
L1001:
	li $s5, 1
L1002:
	beq $s5, $zero, L1000
	li $s5, 9
	sw $s5, 16($sp)
L1000:
	j L996
L997:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1005
	li $s6, 0
	j L1006
L1005:
	li $s6, 1
L1006:
	beq $s6, $zero, L1004
	lw $s6, sym16
	lw $s5, sym16
	blt $s6, $s5, L1008
	li $s5, 0
	j L1009
L1008:
	li $s5, 1
L1009:
	beq $s5, $zero, L1007
	li $s5, 9
	sw $s5, 16($sp)
L1007:
	j L1003
L1004:
	lw $s5, 16($sp)
	li $s6, 10
	beq $s5, $s6, L1012
	li $s6, 0
	j L1013
L1012:
	li $s6, 1
L1013:
	beq $s6, $zero, L1011
	lw $s6, sym16
	lw $s5, sym17
	blt $s6, $s5, L1015
	li $s5, 0
	j L1016
L1015:
	li $s5, 1
L1016:
	beq $s5, $zero, L1014
	li $s5, 9
	sw $s5, 16($sp)
L1014:
	j L1010
L1011:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1019
	li $s6, 0
	j L1020
L1019:
	li $s6, 1
L1020:
	beq $s6, $zero, L1018
	lw $s6, sym16
	lw $s5, sym18
	blt $s6, $s5, L1022
	li $s5, 0
	j L1023
L1022:
	li $s5, 1
L1023:
	beq $s5, $zero, L1021
	li $s5, 9
	sw $s5, 16($sp)
L1021:
	j L1017
L1018:
	lw $s5, 16($sp)
	li $s6, 12
	beq $s5, $s6, L1026
	li $s6, 0
	j L1027
L1026:
	li $s6, 1
L1027:
	beq $s6, $zero, L1025
	lw $s6, sym16
	lw $s5, sym19
	blt $s6, $s5, L1029
	li $s5, 0
	j L1030
L1029:
	li $s5, 1
L1030:
	beq $s5, $zero, L1028
	li $s5, 9
	sw $s5, 16($sp)
L1028:
	j L1024
L1025:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1033
	li $s6, 0
	j L1034
L1033:
	li $s6, 1
L1034:
	beq $s6, $zero, L1032
	lw $s6, sym16
	lw $s5, sym20
	blt $s6, $s5, L1036
	li $s5, 0
	j L1037
L1036:
	li $s5, 1
L1037:
	beq $s5, $zero, L1035
	li $s5, 9
	sw $s5, 16($sp)
L1035:
	j L1031
L1032:
	lw $s5, 16($sp)
	li $s6, 14
	beq $s5, $s6, L1039
	li $s6, 0
	j L1040
L1039:
	li $s6, 1
L1040:
	beq $s6, $zero, L1038
	lw $s6, sym16
	lw $s5, sym21
	blt $s6, $s5, L1042
	li $s5, 0
	j L1043
L1042:
	li $s5, 1
L1043:
	beq $s5, $zero, L1041
	li $s5, 9
	sw $s5, 16($sp)
L1041:
L1038:
L1031:
L1024:
L1017:
L1010:
L1003:
L996:
L989:
L982:
L975:
L968:
L961:
L954:
L947:
L940:
	j L936
L937:
	lw $s5, 8($sp)
	li $s6, 10
	beq $s5, $s6, L1046
	li $s6, 0
	j L1047
L1046:
	li $s6, 1
L1047:
	beq $s6, $zero, L1045
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1050
	li $s5, 0
	j L1051
L1050:
	li $s5, 1
L1051:
	beq $s5, $zero, L1049
	lw $s5, sym17
	lw $s6, sym7
	blt $s5, $s6, L1053
	li $s6, 0
	j L1054
L1053:
	li $s6, 1
L1054:
	beq $s6, $zero, L1052
	li $s6, 10
	sw $s6, 16($sp)
L1052:
	j L1048
L1049:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L1057
	li $s5, 0
	j L1058
L1057:
	li $s5, 1
L1058:
	beq $s5, $zero, L1056
	lw $s5, sym17
	lw $s6, sym8
	blt $s5, $s6, L1060
	li $s6, 0
	j L1061
L1060:
	li $s6, 1
L1061:
	beq $s6, $zero, L1059
	li $s6, 10
	sw $s6, 16($sp)
L1059:
	j L1055
L1056:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1064
	li $s5, 0
	j L1065
L1064:
	li $s5, 1
L1065:
	beq $s5, $zero, L1063
	lw $s5, sym17
	lw $s6, sym9
	blt $s5, $s6, L1067
	li $s6, 0
	j L1068
L1067:
	li $s6, 1
L1068:
	beq $s6, $zero, L1066
	li $s6, 10
	sw $s6, 16($sp)
L1066:
	j L1062
L1063:
	lw $s6, 16($sp)
	li $s5, 3
	beq $s6, $s5, L1071
	li $s5, 0
	j L1072
L1071:
	li $s5, 1
L1072:
	beq $s5, $zero, L1070
	lw $s5, sym17
	lw $s6, sym10
	blt $s5, $s6, L1074
	li $s6, 0
	j L1075
L1074:
	li $s6, 1
L1075:
	beq $s6, $zero, L1073
	li $s6, 10
	sw $s6, 16($sp)
L1073:
	j L1069
L1070:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1078
	li $s5, 0
	j L1079
L1078:
	li $s5, 1
L1079:
	beq $s5, $zero, L1077
	lw $s5, sym17
	lw $s6, sym11
	blt $s5, $s6, L1081
	li $s6, 0
	j L1082
L1081:
	li $s6, 1
L1082:
	beq $s6, $zero, L1080
	li $s6, 10
	sw $s6, 16($sp)
L1080:
	j L1076
L1077:
	lw $s6, 16($sp)
	li $s5, 5
	beq $s6, $s5, L1085
	li $s5, 0
	j L1086
L1085:
	li $s5, 1
L1086:
	beq $s5, $zero, L1084
	lw $s5, sym17
	lw $s6, sym12
	blt $s5, $s6, L1088
	li $s6, 0
	j L1089
L1088:
	li $s6, 1
L1089:
	beq $s6, $zero, L1087
	li $s6, 10
	sw $s6, 16($sp)
L1087:
	j L1083
L1084:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1092
	li $s5, 0
	j L1093
L1092:
	li $s5, 1
L1093:
	beq $s5, $zero, L1091
	lw $s5, sym17
	lw $s6, sym13
	blt $s5, $s6, L1095
	li $s6, 0
	j L1096
L1095:
	li $s6, 1
L1096:
	beq $s6, $zero, L1094
	li $s6, 10
	sw $s6, 16($sp)
L1094:
	j L1090
L1091:
	lw $s6, 16($sp)
	li $s5, 7
	beq $s6, $s5, L1099
	li $s5, 0
	j L1100
L1099:
	li $s5, 1
L1100:
	beq $s5, $zero, L1098
	lw $s5, sym17
	lw $s6, sym14
	blt $s5, $s6, L1102
	li $s6, 0
	j L1103
L1102:
	li $s6, 1
L1103:
	beq $s6, $zero, L1101
	li $s6, 10
	sw $s6, 16($sp)
L1101:
	j L1097
L1098:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1106
	li $s5, 0
	j L1107
L1106:
	li $s5, 1
L1107:
	beq $s5, $zero, L1105
	lw $s5, sym17
	lw $s6, sym15
	blt $s5, $s6, L1109
	li $s6, 0
	j L1110
L1109:
	li $s6, 1
L1110:
	beq $s6, $zero, L1108
	li $s6, 10
	sw $s6, 16($sp)
L1108:
	j L1104
L1105:
	lw $s6, 16($sp)
	li $s5, 9
	beq $s6, $s5, L1113
	li $s5, 0
	j L1114
L1113:
	li $s5, 1
L1114:
	beq $s5, $zero, L1112
	lw $s5, sym17
	lw $s6, sym16
	blt $s5, $s6, L1116
	li $s6, 0
	j L1117
L1116:
	li $s6, 1
L1117:
	beq $s6, $zero, L1115
	li $s6, 10
	sw $s6, 16($sp)
L1115:
	j L1111
L1112:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1120
	li $s5, 0
	j L1121
L1120:
	li $s5, 1
L1121:
	beq $s5, $zero, L1119
	lw $s5, sym17
	lw $s6, sym17
	blt $s5, $s6, L1123
	li $s6, 0
	j L1124
L1123:
	li $s6, 1
L1124:
	beq $s6, $zero, L1122
	li $s6, 10
	sw $s6, 16($sp)
L1122:
	j L1118
L1119:
	lw $s6, 16($sp)
	li $s5, 11
	beq $s6, $s5, L1127
	li $s5, 0
	j L1128
L1127:
	li $s5, 1
L1128:
	beq $s5, $zero, L1126
	lw $s5, sym17
	lw $s6, sym18
	blt $s5, $s6, L1130
	li $s6, 0
	j L1131
L1130:
	li $s6, 1
L1131:
	beq $s6, $zero, L1129
	li $s6, 10
	sw $s6, 16($sp)
L1129:
	j L1125
L1126:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1134
	li $s5, 0
	j L1135
L1134:
	li $s5, 1
L1135:
	beq $s5, $zero, L1133
	lw $s5, sym17
	lw $s6, sym19
	blt $s5, $s6, L1137
	li $s6, 0
	j L1138
L1137:
	li $s6, 1
L1138:
	beq $s6, $zero, L1136
	li $s6, 10
	sw $s6, 16($sp)
L1136:
	j L1132
L1133:
	lw $s6, 16($sp)
	li $s5, 13
	beq $s6, $s5, L1141
	li $s5, 0
	j L1142
L1141:
	li $s5, 1
L1142:
	beq $s5, $zero, L1140
	lw $s5, sym17
	lw $s6, sym20
	blt $s5, $s6, L1144
	li $s6, 0
	j L1145
L1144:
	li $s6, 1
L1145:
	beq $s6, $zero, L1143
	li $s6, 10
	sw $s6, 16($sp)
L1143:
	j L1139
L1140:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1147
	li $s5, 0
	j L1148
L1147:
	li $s5, 1
L1148:
	beq $s5, $zero, L1146
	lw $s5, sym17
	lw $s6, sym21
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
L1146:
L1139:
L1132:
L1125:
L1118:
L1111:
L1104:
L1097:
L1090:
L1083:
L1076:
L1069:
L1062:
L1055:
L1048:
	j L1044
L1045:
	lw $s6, 8($sp)
	li $s5, 11
	beq $s6, $s5, L1154
	li $s5, 0
	j L1155
L1154:
	li $s5, 1
L1155:
	beq $s5, $zero, L1153
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L1158
	li $s6, 0
	j L1159
L1158:
	li $s6, 1
L1159:
	beq $s6, $zero, L1157
	lw $s6, sym18
	lw $s5, sym7
	blt $s6, $s5, L1161
	li $s5, 0
	j L1162
L1161:
	li $s5, 1
L1162:
	beq $s5, $zero, L1160
	li $s5, 11
	sw $s5, 16($sp)
L1160:
	j L1156
L1157:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1165
	li $s6, 0
	j L1166
L1165:
	li $s6, 1
L1166:
	beq $s6, $zero, L1164
	lw $s6, sym18
	lw $s5, sym8
	blt $s6, $s5, L1168
	li $s5, 0
	j L1169
L1168:
	li $s5, 1
L1169:
	beq $s5, $zero, L1167
	li $s5, 11
	sw $s5, 16($sp)
L1167:
	j L1163
L1164:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L1172
	li $s6, 0
	j L1173
L1172:
	li $s6, 1
L1173:
	beq $s6, $zero, L1171
	lw $s6, sym18
	lw $s5, sym9
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
	li $s6, 3
	beq $s5, $s6, L1179
	li $s6, 0
	j L1180
L1179:
	li $s6, 1
L1180:
	beq $s6, $zero, L1178
	lw $s6, sym18
	lw $s5, sym10
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
	li $s6, 4
	beq $s5, $s6, L1186
	li $s6, 0
	j L1187
L1186:
	li $s6, 1
L1187:
	beq $s6, $zero, L1185
	lw $s6, sym18
	lw $s5, sym11
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
	li $s6, 5
	beq $s5, $s6, L1193
	li $s6, 0
	j L1194
L1193:
	li $s6, 1
L1194:
	beq $s6, $zero, L1192
	lw $s6, sym18
	lw $s5, sym12
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
	li $s6, 6
	beq $s5, $s6, L1200
	li $s6, 0
	j L1201
L1200:
	li $s6, 1
L1201:
	beq $s6, $zero, L1199
	lw $s6, sym18
	lw $s5, sym13
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
	li $s6, 7
	beq $s5, $s6, L1207
	li $s6, 0
	j L1208
L1207:
	li $s6, 1
L1208:
	beq $s6, $zero, L1206
	lw $s6, sym18
	lw $s5, sym14
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
	li $s6, 8
	beq $s5, $s6, L1214
	li $s6, 0
	j L1215
L1214:
	li $s6, 1
L1215:
	beq $s6, $zero, L1213
	lw $s6, sym18
	lw $s5, sym15
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
	li $s6, 9
	beq $s5, $s6, L1221
	li $s6, 0
	j L1222
L1221:
	li $s6, 1
L1222:
	beq $s6, $zero, L1220
	lw $s6, sym18
	lw $s5, sym16
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
	li $s6, 10
	beq $s5, $s6, L1228
	li $s6, 0
	j L1229
L1228:
	li $s6, 1
L1229:
	beq $s6, $zero, L1227
	lw $s6, sym18
	lw $s5, sym17
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
	li $s6, 11
	beq $s5, $s6, L1235
	li $s6, 0
	j L1236
L1235:
	li $s6, 1
L1236:
	beq $s6, $zero, L1234
	lw $s6, sym18
	lw $s5, sym18
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
	li $s6, 12
	beq $s5, $s6, L1242
	li $s6, 0
	j L1243
L1242:
	li $s6, 1
L1243:
	beq $s6, $zero, L1241
	lw $s6, sym18
	lw $s5, sym19
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
	li $s6, 13
	beq $s5, $s6, L1249
	li $s6, 0
	j L1250
L1249:
	li $s6, 1
L1250:
	beq $s6, $zero, L1248
	lw $s6, sym18
	lw $s5, sym20
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
	li $s6, 14
	beq $s5, $s6, L1255
	li $s6, 0
	j L1256
L1255:
	li $s6, 1
L1256:
	beq $s6, $zero, L1254
	lw $s6, sym18
	lw $s5, sym21
	blt $s6, $s5, L1258
	li $s5, 0
	j L1259
L1258:
	li $s5, 1
L1259:
	beq $s5, $zero, L1257
	li $s5, 11
	sw $s5, 16($sp)
L1257:
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
L1163:
L1156:
	j L1152
L1153:
	lw $s5, 8($sp)
	li $s6, 12
	beq $s5, $s6, L1262
	li $s6, 0
	j L1263
L1262:
	li $s6, 1
L1263:
	beq $s6, $zero, L1261
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1266
	li $s5, 0
	j L1267
L1266:
	li $s5, 1
L1267:
	beq $s5, $zero, L1265
	lw $s5, sym19
	lw $s6, sym7
	blt $s5, $s6, L1269
	li $s6, 0
	j L1270
L1269:
	li $s6, 1
L1270:
	beq $s6, $zero, L1268
	li $s6, 12
	sw $s6, 16($sp)
L1268:
	j L1264
L1265:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L1273
	li $s5, 0
	j L1274
L1273:
	li $s5, 1
L1274:
	beq $s5, $zero, L1272
	lw $s5, sym19
	lw $s6, sym8
	blt $s5, $s6, L1276
	li $s6, 0
	j L1277
L1276:
	li $s6, 1
L1277:
	beq $s6, $zero, L1275
	li $s6, 12
	sw $s6, 16($sp)
L1275:
	j L1271
L1272:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1280
	li $s5, 0
	j L1281
L1280:
	li $s5, 1
L1281:
	beq $s5, $zero, L1279
	lw $s5, sym19
	lw $s6, sym9
	blt $s5, $s6, L1283
	li $s6, 0
	j L1284
L1283:
	li $s6, 1
L1284:
	beq $s6, $zero, L1282
	li $s6, 12
	sw $s6, 16($sp)
L1282:
	j L1278
L1279:
	lw $s6, 16($sp)
	li $s5, 3
	beq $s6, $s5, L1287
	li $s5, 0
	j L1288
L1287:
	li $s5, 1
L1288:
	beq $s5, $zero, L1286
	lw $s5, sym19
	lw $s6, sym10
	blt $s5, $s6, L1290
	li $s6, 0
	j L1291
L1290:
	li $s6, 1
L1291:
	beq $s6, $zero, L1289
	li $s6, 12
	sw $s6, 16($sp)
L1289:
	j L1285
L1286:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1294
	li $s5, 0
	j L1295
L1294:
	li $s5, 1
L1295:
	beq $s5, $zero, L1293
	lw $s5, sym19
	lw $s6, sym11
	blt $s5, $s6, L1297
	li $s6, 0
	j L1298
L1297:
	li $s6, 1
L1298:
	beq $s6, $zero, L1296
	li $s6, 12
	sw $s6, 16($sp)
L1296:
	j L1292
L1293:
	lw $s6, 16($sp)
	li $s5, 5
	beq $s6, $s5, L1301
	li $s5, 0
	j L1302
L1301:
	li $s5, 1
L1302:
	beq $s5, $zero, L1300
	lw $s5, sym19
	lw $s6, sym12
	blt $s5, $s6, L1304
	li $s6, 0
	j L1305
L1304:
	li $s6, 1
L1305:
	beq $s6, $zero, L1303
	li $s6, 12
	sw $s6, 16($sp)
L1303:
	j L1299
L1300:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1308
	li $s5, 0
	j L1309
L1308:
	li $s5, 1
L1309:
	beq $s5, $zero, L1307
	lw $s5, sym19
	lw $s6, sym13
	blt $s5, $s6, L1311
	li $s6, 0
	j L1312
L1311:
	li $s6, 1
L1312:
	beq $s6, $zero, L1310
	li $s6, 12
	sw $s6, 16($sp)
L1310:
	j L1306
L1307:
	lw $s6, 16($sp)
	li $s5, 7
	beq $s6, $s5, L1315
	li $s5, 0
	j L1316
L1315:
	li $s5, 1
L1316:
	beq $s5, $zero, L1314
	lw $s5, sym19
	lw $s6, sym14
	blt $s5, $s6, L1318
	li $s6, 0
	j L1319
L1318:
	li $s6, 1
L1319:
	beq $s6, $zero, L1317
	li $s6, 12
	sw $s6, 16($sp)
L1317:
	j L1313
L1314:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1322
	li $s5, 0
	j L1323
L1322:
	li $s5, 1
L1323:
	beq $s5, $zero, L1321
	lw $s5, sym19
	lw $s6, sym15
	blt $s5, $s6, L1325
	li $s6, 0
	j L1326
L1325:
	li $s6, 1
L1326:
	beq $s6, $zero, L1324
	li $s6, 12
	sw $s6, 16($sp)
L1324:
	j L1320
L1321:
	lw $s6, 16($sp)
	li $s5, 9
	beq $s6, $s5, L1329
	li $s5, 0
	j L1330
L1329:
	li $s5, 1
L1330:
	beq $s5, $zero, L1328
	lw $s5, sym19
	lw $s6, sym16
	blt $s5, $s6, L1332
	li $s6, 0
	j L1333
L1332:
	li $s6, 1
L1333:
	beq $s6, $zero, L1331
	li $s6, 12
	sw $s6, 16($sp)
L1331:
	j L1327
L1328:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1336
	li $s5, 0
	j L1337
L1336:
	li $s5, 1
L1337:
	beq $s5, $zero, L1335
	lw $s5, sym19
	lw $s6, sym17
	blt $s5, $s6, L1339
	li $s6, 0
	j L1340
L1339:
	li $s6, 1
L1340:
	beq $s6, $zero, L1338
	li $s6, 12
	sw $s6, 16($sp)
L1338:
	j L1334
L1335:
	lw $s6, 16($sp)
	li $s5, 11
	beq $s6, $s5, L1343
	li $s5, 0
	j L1344
L1343:
	li $s5, 1
L1344:
	beq $s5, $zero, L1342
	lw $s5, sym19
	lw $s6, sym18
	blt $s5, $s6, L1346
	li $s6, 0
	j L1347
L1346:
	li $s6, 1
L1347:
	beq $s6, $zero, L1345
	li $s6, 12
	sw $s6, 16($sp)
L1345:
	j L1341
L1342:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1350
	li $s5, 0
	j L1351
L1350:
	li $s5, 1
L1351:
	beq $s5, $zero, L1349
	lw $s5, sym19
	lw $s6, sym19
	blt $s5, $s6, L1353
	li $s6, 0
	j L1354
L1353:
	li $s6, 1
L1354:
	beq $s6, $zero, L1352
	li $s6, 12
	sw $s6, 16($sp)
L1352:
	j L1348
L1349:
	lw $s6, 16($sp)
	li $s5, 13
	beq $s6, $s5, L1357
	li $s5, 0
	j L1358
L1357:
	li $s5, 1
L1358:
	beq $s5, $zero, L1356
	lw $s5, sym19
	lw $s6, sym20
	blt $s5, $s6, L1360
	li $s6, 0
	j L1361
L1360:
	li $s6, 1
L1361:
	beq $s6, $zero, L1359
	li $s6, 12
	sw $s6, 16($sp)
L1359:
	j L1355
L1356:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1363
	li $s5, 0
	j L1364
L1363:
	li $s5, 1
L1364:
	beq $s5, $zero, L1362
	lw $s5, sym19
	lw $s6, sym21
	blt $s5, $s6, L1366
	li $s6, 0
	j L1367
L1366:
	li $s6, 1
L1367:
	beq $s6, $zero, L1365
	li $s6, 12
	sw $s6, 16($sp)
L1365:
L1362:
L1355:
L1348:
L1341:
L1334:
L1327:
L1320:
L1313:
L1306:
L1299:
L1292:
L1285:
L1278:
L1271:
L1264:
	j L1260
L1261:
	lw $s6, 8($sp)
	li $s5, 13
	beq $s6, $s5, L1370
	li $s5, 0
	j L1371
L1370:
	li $s5, 1
L1371:
	beq $s5, $zero, L1369
	lw $s5, 16($sp)
	li $s6, 0
	beq $s5, $s6, L1374
	li $s6, 0
	j L1375
L1374:
	li $s6, 1
L1375:
	beq $s6, $zero, L1373
	lw $s6, sym20
	lw $s5, sym7
	blt $s6, $s5, L1377
	li $s5, 0
	j L1378
L1377:
	li $s5, 1
L1378:
	beq $s5, $zero, L1376
	li $s5, 13
	sw $s5, 16($sp)
L1376:
	j L1372
L1373:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1381
	li $s6, 0
	j L1382
L1381:
	li $s6, 1
L1382:
	beq $s6, $zero, L1380
	lw $s6, sym20
	lw $s5, sym8
	blt $s6, $s5, L1384
	li $s5, 0
	j L1385
L1384:
	li $s5, 1
L1385:
	beq $s5, $zero, L1383
	li $s5, 13
	sw $s5, 16($sp)
L1383:
	j L1379
L1380:
	lw $s5, 16($sp)
	li $s6, 2
	beq $s5, $s6, L1388
	li $s6, 0
	j L1389
L1388:
	li $s6, 1
L1389:
	beq $s6, $zero, L1387
	lw $s6, sym20
	lw $s5, sym9
	blt $s6, $s5, L1391
	li $s5, 0
	j L1392
L1391:
	li $s5, 1
L1392:
	beq $s5, $zero, L1390
	li $s5, 13
	sw $s5, 16($sp)
L1390:
	j L1386
L1387:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1395
	li $s6, 0
	j L1396
L1395:
	li $s6, 1
L1396:
	beq $s6, $zero, L1394
	lw $s6, sym20
	lw $s5, sym10
	blt $s6, $s5, L1398
	li $s5, 0
	j L1399
L1398:
	li $s5, 1
L1399:
	beq $s5, $zero, L1397
	li $s5, 13
	sw $s5, 16($sp)
L1397:
	j L1393
L1394:
	lw $s5, 16($sp)
	li $s6, 4
	beq $s5, $s6, L1402
	li $s6, 0
	j L1403
L1402:
	li $s6, 1
L1403:
	beq $s6, $zero, L1401
	lw $s6, sym20
	lw $s5, sym11
	blt $s6, $s5, L1405
	li $s5, 0
	j L1406
L1405:
	li $s5, 1
L1406:
	beq $s5, $zero, L1404
	li $s5, 13
	sw $s5, 16($sp)
L1404:
	j L1400
L1401:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1409
	li $s6, 0
	j L1410
L1409:
	li $s6, 1
L1410:
	beq $s6, $zero, L1408
	lw $s6, sym20
	lw $s5, sym12
	blt $s6, $s5, L1412
	li $s5, 0
	j L1413
L1412:
	li $s5, 1
L1413:
	beq $s5, $zero, L1411
	li $s5, 13
	sw $s5, 16($sp)
L1411:
	j L1407
L1408:
	lw $s5, 16($sp)
	li $s6, 6
	beq $s5, $s6, L1416
	li $s6, 0
	j L1417
L1416:
	li $s6, 1
L1417:
	beq $s6, $zero, L1415
	lw $s6, sym20
	lw $s5, sym13
	blt $s6, $s5, L1419
	li $s5, 0
	j L1420
L1419:
	li $s5, 1
L1420:
	beq $s5, $zero, L1418
	li $s5, 13
	sw $s5, 16($sp)
L1418:
	j L1414
L1415:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1423
	li $s6, 0
	j L1424
L1423:
	li $s6, 1
L1424:
	beq $s6, $zero, L1422
	lw $s6, sym20
	lw $s5, sym14
	blt $s6, $s5, L1426
	li $s5, 0
	j L1427
L1426:
	li $s5, 1
L1427:
	beq $s5, $zero, L1425
	li $s5, 13
	sw $s5, 16($sp)
L1425:
	j L1421
L1422:
	lw $s5, 16($sp)
	li $s6, 8
	beq $s5, $s6, L1430
	li $s6, 0
	j L1431
L1430:
	li $s6, 1
L1431:
	beq $s6, $zero, L1429
	lw $s6, sym20
	lw $s5, sym15
	blt $s6, $s5, L1433
	li $s5, 0
	j L1434
L1433:
	li $s5, 1
L1434:
	beq $s5, $zero, L1432
	li $s5, 13
	sw $s5, 16($sp)
L1432:
	j L1428
L1429:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1437
	li $s6, 0
	j L1438
L1437:
	li $s6, 1
L1438:
	beq $s6, $zero, L1436
	lw $s6, sym20
	lw $s5, sym16
	blt $s6, $s5, L1440
	li $s5, 0
	j L1441
L1440:
	li $s5, 1
L1441:
	beq $s5, $zero, L1439
	li $s5, 13
	sw $s5, 16($sp)
L1439:
	j L1435
L1436:
	lw $s5, 16($sp)
	li $s6, 10
	beq $s5, $s6, L1444
	li $s6, 0
	j L1445
L1444:
	li $s6, 1
L1445:
	beq $s6, $zero, L1443
	lw $s6, sym20
	lw $s5, sym17
	blt $s6, $s5, L1447
	li $s5, 0
	j L1448
L1447:
	li $s5, 1
L1448:
	beq $s5, $zero, L1446
	li $s5, 13
	sw $s5, 16($sp)
L1446:
	j L1442
L1443:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1451
	li $s6, 0
	j L1452
L1451:
	li $s6, 1
L1452:
	beq $s6, $zero, L1450
	lw $s6, sym20
	lw $s5, sym18
	blt $s6, $s5, L1454
	li $s5, 0
	j L1455
L1454:
	li $s5, 1
L1455:
	beq $s5, $zero, L1453
	li $s5, 13
	sw $s5, 16($sp)
L1453:
	j L1449
L1450:
	lw $s5, 16($sp)
	li $s6, 12
	beq $s5, $s6, L1458
	li $s6, 0
	j L1459
L1458:
	li $s6, 1
L1459:
	beq $s6, $zero, L1457
	lw $s6, sym20
	lw $s5, sym19
	blt $s6, $s5, L1461
	li $s5, 0
	j L1462
L1461:
	li $s5, 1
L1462:
	beq $s5, $zero, L1460
	li $s5, 13
	sw $s5, 16($sp)
L1460:
	j L1456
L1457:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1465
	li $s6, 0
	j L1466
L1465:
	li $s6, 1
L1466:
	beq $s6, $zero, L1464
	lw $s6, sym20
	lw $s5, sym20
	blt $s6, $s5, L1468
	li $s5, 0
	j L1469
L1468:
	li $s5, 1
L1469:
	beq $s5, $zero, L1467
	li $s5, 13
	sw $s5, 16($sp)
L1467:
	j L1463
L1464:
	lw $s5, 16($sp)
	li $s6, 14
	beq $s5, $s6, L1471
	li $s6, 0
	j L1472
L1471:
	li $s6, 1
L1472:
	beq $s6, $zero, L1470
	lw $s6, sym20
	lw $s5, sym21
	blt $s6, $s5, L1474
	li $s5, 0
	j L1475
L1474:
	li $s5, 1
L1475:
	beq $s5, $zero, L1473
	li $s5, 13
	sw $s5, 16($sp)
L1473:
L1470:
L1463:
L1456:
L1449:
L1442:
L1435:
L1428:
L1421:
L1414:
L1407:
L1400:
L1393:
L1386:
L1379:
L1372:
	j L1368
L1369:
	lw $s5, 8($sp)
	li $s6, 14
	beq $s5, $s6, L1477
	li $s6, 0
	j L1478
L1477:
	li $s6, 1
L1478:
	beq $s6, $zero, L1476
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1481
	li $s5, 0
	j L1482
L1481:
	li $s5, 1
L1482:
	beq $s5, $zero, L1480
	lw $s5, sym21
	lw $s6, sym7
	blt $s5, $s6, L1484
	li $s6, 0
	j L1485
L1484:
	li $s6, 1
L1485:
	beq $s6, $zero, L1483
	li $s6, 14
	sw $s6, 16($sp)
L1483:
	j L1479
L1480:
	lw $s6, 16($sp)
	li $s5, 1
	beq $s6, $s5, L1488
	li $s5, 0
	j L1489
L1488:
	li $s5, 1
L1489:
	beq $s5, $zero, L1487
	lw $s5, sym21
	lw $s6, sym8
	blt $s5, $s6, L1491
	li $s6, 0
	j L1492
L1491:
	li $s6, 1
L1492:
	beq $s6, $zero, L1490
	li $s6, 14
	sw $s6, 16($sp)
L1490:
	j L1486
L1487:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1495
	li $s5, 0
	j L1496
L1495:
	li $s5, 1
L1496:
	beq $s5, $zero, L1494
	lw $s5, sym21
	lw $s6, sym9
	blt $s5, $s6, L1498
	li $s6, 0
	j L1499
L1498:
	li $s6, 1
L1499:
	beq $s6, $zero, L1497
	li $s6, 14
	sw $s6, 16($sp)
L1497:
	j L1493
L1494:
	lw $s6, 16($sp)
	li $s5, 3
	beq $s6, $s5, L1502
	li $s5, 0
	j L1503
L1502:
	li $s5, 1
L1503:
	beq $s5, $zero, L1501
	lw $s5, sym21
	lw $s6, sym10
	blt $s5, $s6, L1505
	li $s6, 0
	j L1506
L1505:
	li $s6, 1
L1506:
	beq $s6, $zero, L1504
	li $s6, 14
	sw $s6, 16($sp)
L1504:
	j L1500
L1501:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1509
	li $s5, 0
	j L1510
L1509:
	li $s5, 1
L1510:
	beq $s5, $zero, L1508
	lw $s5, sym21
	lw $s6, sym11
	blt $s5, $s6, L1512
	li $s6, 0
	j L1513
L1512:
	li $s6, 1
L1513:
	beq $s6, $zero, L1511
	li $s6, 14
	sw $s6, 16($sp)
L1511:
	j L1507
L1508:
	lw $s6, 16($sp)
	li $s5, 5
	beq $s6, $s5, L1516
	li $s5, 0
	j L1517
L1516:
	li $s5, 1
L1517:
	beq $s5, $zero, L1515
	lw $s5, sym21
	lw $s6, sym12
	blt $s5, $s6, L1519
	li $s6, 0
	j L1520
L1519:
	li $s6, 1
L1520:
	beq $s6, $zero, L1518
	li $s6, 14
	sw $s6, 16($sp)
L1518:
	j L1514
L1515:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1523
	li $s5, 0
	j L1524
L1523:
	li $s5, 1
L1524:
	beq $s5, $zero, L1522
	lw $s5, sym21
	lw $s6, sym13
	blt $s5, $s6, L1526
	li $s6, 0
	j L1527
L1526:
	li $s6, 1
L1527:
	beq $s6, $zero, L1525
	li $s6, 14
	sw $s6, 16($sp)
L1525:
	j L1521
L1522:
	lw $s6, 16($sp)
	li $s5, 7
	beq $s6, $s5, L1530
	li $s5, 0
	j L1531
L1530:
	li $s5, 1
L1531:
	beq $s5, $zero, L1529
	lw $s5, sym21
	lw $s6, sym14
	blt $s5, $s6, L1533
	li $s6, 0
	j L1534
L1533:
	li $s6, 1
L1534:
	beq $s6, $zero, L1532
	li $s6, 14
	sw $s6, 16($sp)
L1532:
	j L1528
L1529:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1537
	li $s5, 0
	j L1538
L1537:
	li $s5, 1
L1538:
	beq $s5, $zero, L1536
	lw $s5, sym21
	lw $s6, sym15
	blt $s5, $s6, L1540
	li $s6, 0
	j L1541
L1540:
	li $s6, 1
L1541:
	beq $s6, $zero, L1539
	li $s6, 14
	sw $s6, 16($sp)
L1539:
	j L1535
L1536:
	lw $s6, 16($sp)
	li $s5, 9
	beq $s6, $s5, L1544
	li $s5, 0
	j L1545
L1544:
	li $s5, 1
L1545:
	beq $s5, $zero, L1543
	lw $s5, sym21
	lw $s6, sym16
	blt $s5, $s6, L1547
	li $s6, 0
	j L1548
L1547:
	li $s6, 1
L1548:
	beq $s6, $zero, L1546
	li $s6, 14
	sw $s6, 16($sp)
L1546:
	j L1542
L1543:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1551
	li $s5, 0
	j L1552
L1551:
	li $s5, 1
L1552:
	beq $s5, $zero, L1550
	lw $s5, sym21
	lw $s6, sym17
	blt $s5, $s6, L1554
	li $s6, 0
	j L1555
L1554:
	li $s6, 1
L1555:
	beq $s6, $zero, L1553
	li $s6, 14
	sw $s6, 16($sp)
L1553:
	j L1549
L1550:
	lw $s6, 16($sp)
	li $s5, 11
	beq $s6, $s5, L1558
	li $s5, 0
	j L1559
L1558:
	li $s5, 1
L1559:
	beq $s5, $zero, L1557
	lw $s5, sym21
	lw $s6, sym18
	blt $s5, $s6, L1561
	li $s6, 0
	j L1562
L1561:
	li $s6, 1
L1562:
	beq $s6, $zero, L1560
	li $s6, 14
	sw $s6, 16($sp)
L1560:
	j L1556
L1557:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1565
	li $s5, 0
	j L1566
L1565:
	li $s5, 1
L1566:
	beq $s5, $zero, L1564
	lw $s5, sym21
	lw $s6, sym19
	blt $s5, $s6, L1568
	li $s6, 0
	j L1569
L1568:
	li $s6, 1
L1569:
	beq $s6, $zero, L1567
	li $s6, 14
	sw $s6, 16($sp)
L1567:
	j L1563
L1564:
	lw $s6, 16($sp)
	li $s5, 13
	beq $s6, $s5, L1572
	li $s5, 0
	j L1573
L1572:
	li $s5, 1
L1573:
	beq $s5, $zero, L1571
	lw $s5, sym21
	lw $s6, sym20
	blt $s5, $s6, L1575
	li $s6, 0
	j L1576
L1575:
	li $s6, 1
L1576:
	beq $s6, $zero, L1574
	li $s6, 14
	sw $s6, 16($sp)
L1574:
	j L1570
L1571:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1578
	li $s5, 0
	j L1579
L1578:
	li $s5, 1
L1579:
	beq $s5, $zero, L1577
	lw $s5, sym21
	lw $s6, sym21
	blt $s5, $s6, L1581
	li $s6, 0
	j L1582
L1581:
	li $s6, 1
L1582:
	beq $s6, $zero, L1580
	li $s6, 14
	sw $s6, 16($sp)
L1580:
L1577:
L1570:
L1563:
L1556:
L1549:
L1542:
L1535:
L1528:
L1521:
L1514:
L1507:
L1500:
L1493:
L1486:
L1479:
L1476:
L1368:
L1260:
L1152:
L1044:
L936:
L828:
L720:
L612:
L504:
L396:
L288:
L180:
L72:
	lw $s6, 8($sp)
	li $s5, 1
	addu $s6, $s6, $s5
	sw $s6, 8($sp)
L69:
	lw $s6, 8($sp)
	li $s5, 14
	ble $s6, $s5, L1583
	li $s5, 0
	j L1584
L1583:
	li $s5, 1
L1584:
	bne $s5, $zero, L70
L71:
	lw $s5, 4($sp)
	li $s6, 0
	beq $s5, $s6, L1587
	li $s6, 0
	j L1588
L1587:
	li $s6, 1
L1588:
	beq $s6, $zero, L1586
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1591
	li $s5, 0
	j L1592
L1591:
	li $s5, 1
L1592:
	beq $s5, $zero, L1590
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1589
L1590:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1595
	li $s6, 0
	j L1596
L1595:
	li $s6, 1
L1596:
	beq $s6, $zero, L1594
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1593
L1594:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1599
	li $s5, 0
	j L1600
L1599:
	li $s5, 1
L1600:
	beq $s5, $zero, L1598
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1597
L1598:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1603
	li $s6, 0
	j L1604
L1603:
	li $s6, 1
L1604:
	beq $s6, $zero, L1602
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1601
L1602:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1607
	li $s5, 0
	j L1608
L1607:
	li $s5, 1
L1608:
	beq $s5, $zero, L1606
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1605
L1606:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1611
	li $s6, 0
	j L1612
L1611:
	li $s6, 1
L1612:
	beq $s6, $zero, L1610
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1609
L1610:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1615
	li $s5, 0
	j L1616
L1615:
	li $s5, 1
L1616:
	beq $s5, $zero, L1614
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1613
L1614:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1619
	li $s6, 0
	j L1620
L1619:
	li $s6, 1
L1620:
	beq $s6, $zero, L1618
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1617
L1618:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1623
	li $s5, 0
	j L1624
L1623:
	li $s5, 1
L1624:
	beq $s5, $zero, L1622
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1621
L1622:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1627
	li $s6, 0
	j L1628
L1627:
	li $s6, 1
L1628:
	beq $s6, $zero, L1626
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1625
L1626:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1631
	li $s5, 0
	j L1632
L1631:
	li $s5, 1
L1632:
	beq $s5, $zero, L1630
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1629
L1630:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1635
	li $s6, 0
	j L1636
L1635:
	li $s6, 1
L1636:
	beq $s6, $zero, L1634
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1633
L1634:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1639
	li $s5, 0
	j L1640
L1639:
	li $s5, 1
L1640:
	beq $s5, $zero, L1638
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym7
	j L1637
L1638:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1643
	li $s6, 0
	j L1644
L1643:
	li $s6, 1
L1644:
	beq $s6, $zero, L1642
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym7
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym7
	j L1641
L1642:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1646
	li $s5, 0
	j L1647
L1646:
	li $s5, 1
L1647:
	beq $s5, $zero, L1645
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym7
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym7
L1645:
L1641:
L1637:
L1633:
L1629:
L1625:
L1621:
L1617:
L1613:
L1609:
L1605:
L1601:
L1597:
L1593:
L1589:
	j L1585
L1586:
	lw $s5, 4($sp)
	li $s6, 1
	beq $s5, $s6, L1650
	li $s6, 0
	j L1651
L1650:
	li $s6, 1
L1651:
	beq $s6, $zero, L1649
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1654
	li $s5, 0
	j L1655
L1654:
	li $s5, 1
L1655:
	beq $s5, $zero, L1653
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1652
L1653:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1658
	li $s6, 0
	j L1659
L1658:
	li $s6, 1
L1659:
	beq $s6, $zero, L1657
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1656
L1657:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1662
	li $s5, 0
	j L1663
L1662:
	li $s5, 1
L1663:
	beq $s5, $zero, L1661
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1660
L1661:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1666
	li $s6, 0
	j L1667
L1666:
	li $s6, 1
L1667:
	beq $s6, $zero, L1665
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1664
L1665:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1670
	li $s5, 0
	j L1671
L1670:
	li $s5, 1
L1671:
	beq $s5, $zero, L1669
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1668
L1669:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1674
	li $s6, 0
	j L1675
L1674:
	li $s6, 1
L1675:
	beq $s6, $zero, L1673
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1672
L1673:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1678
	li $s5, 0
	j L1679
L1678:
	li $s5, 1
L1679:
	beq $s5, $zero, L1677
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1676
L1677:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1682
	li $s6, 0
	j L1683
L1682:
	li $s6, 1
L1683:
	beq $s6, $zero, L1681
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1680
L1681:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1686
	li $s5, 0
	j L1687
L1686:
	li $s5, 1
L1687:
	beq $s5, $zero, L1685
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1684
L1685:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1690
	li $s6, 0
	j L1691
L1690:
	li $s6, 1
L1691:
	beq $s6, $zero, L1689
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1688
L1689:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1694
	li $s5, 0
	j L1695
L1694:
	li $s5, 1
L1695:
	beq $s5, $zero, L1693
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1692
L1693:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1698
	li $s6, 0
	j L1699
L1698:
	li $s6, 1
L1699:
	beq $s6, $zero, L1697
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1696
L1697:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1702
	li $s5, 0
	j L1703
L1702:
	li $s5, 1
L1703:
	beq $s5, $zero, L1701
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym8
	j L1700
L1701:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1706
	li $s6, 0
	j L1707
L1706:
	li $s6, 1
L1707:
	beq $s6, $zero, L1705
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym8
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym8
	j L1704
L1705:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1709
	li $s5, 0
	j L1710
L1709:
	li $s5, 1
L1710:
	beq $s5, $zero, L1708
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym8
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym8
L1708:
L1704:
L1700:
L1696:
L1692:
L1688:
L1684:
L1680:
L1676:
L1672:
L1668:
L1664:
L1660:
L1656:
L1652:
	j L1648
L1649:
	lw $s5, 4($sp)
	li $s6, 2
	beq $s5, $s6, L1713
	li $s6, 0
	j L1714
L1713:
	li $s6, 1
L1714:
	beq $s6, $zero, L1712
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1717
	li $s5, 0
	j L1718
L1717:
	li $s5, 1
L1718:
	beq $s5, $zero, L1716
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1715
L1716:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1721
	li $s6, 0
	j L1722
L1721:
	li $s6, 1
L1722:
	beq $s6, $zero, L1720
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1719
L1720:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1725
	li $s5, 0
	j L1726
L1725:
	li $s5, 1
L1726:
	beq $s5, $zero, L1724
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1723
L1724:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1729
	li $s6, 0
	j L1730
L1729:
	li $s6, 1
L1730:
	beq $s6, $zero, L1728
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1727
L1728:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1733
	li $s5, 0
	j L1734
L1733:
	li $s5, 1
L1734:
	beq $s5, $zero, L1732
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1731
L1732:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1737
	li $s6, 0
	j L1738
L1737:
	li $s6, 1
L1738:
	beq $s6, $zero, L1736
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1735
L1736:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1741
	li $s5, 0
	j L1742
L1741:
	li $s5, 1
L1742:
	beq $s5, $zero, L1740
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1739
L1740:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1745
	li $s6, 0
	j L1746
L1745:
	li $s6, 1
L1746:
	beq $s6, $zero, L1744
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1743
L1744:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1749
	li $s5, 0
	j L1750
L1749:
	li $s5, 1
L1750:
	beq $s5, $zero, L1748
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1747
L1748:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1753
	li $s6, 0
	j L1754
L1753:
	li $s6, 1
L1754:
	beq $s6, $zero, L1752
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1751
L1752:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1757
	li $s5, 0
	j L1758
L1757:
	li $s5, 1
L1758:
	beq $s5, $zero, L1756
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1755
L1756:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1761
	li $s6, 0
	j L1762
L1761:
	li $s6, 1
L1762:
	beq $s6, $zero, L1760
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1759
L1760:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1765
	li $s5, 0
	j L1766
L1765:
	li $s5, 1
L1766:
	beq $s5, $zero, L1764
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym9
	j L1763
L1764:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1769
	li $s6, 0
	j L1770
L1769:
	li $s6, 1
L1770:
	beq $s6, $zero, L1768
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym9
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym9
	j L1767
L1768:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1772
	li $s5, 0
	j L1773
L1772:
	li $s5, 1
L1773:
	beq $s5, $zero, L1771
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym9
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym9
L1771:
L1767:
L1763:
L1759:
L1755:
L1751:
L1747:
L1743:
L1739:
L1735:
L1731:
L1727:
L1723:
L1719:
L1715:
	j L1711
L1712:
	lw $s5, 4($sp)
	li $s6, 3
	beq $s5, $s6, L1776
	li $s6, 0
	j L1777
L1776:
	li $s6, 1
L1777:
	beq $s6, $zero, L1775
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1780
	li $s5, 0
	j L1781
L1780:
	li $s5, 1
L1781:
	beq $s5, $zero, L1779
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1778
L1779:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1784
	li $s6, 0
	j L1785
L1784:
	li $s6, 1
L1785:
	beq $s6, $zero, L1783
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1782
L1783:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1788
	li $s5, 0
	j L1789
L1788:
	li $s5, 1
L1789:
	beq $s5, $zero, L1787
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1786
L1787:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1792
	li $s6, 0
	j L1793
L1792:
	li $s6, 1
L1793:
	beq $s6, $zero, L1791
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1790
L1791:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1796
	li $s5, 0
	j L1797
L1796:
	li $s5, 1
L1797:
	beq $s5, $zero, L1795
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1794
L1795:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1800
	li $s6, 0
	j L1801
L1800:
	li $s6, 1
L1801:
	beq $s6, $zero, L1799
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1798
L1799:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1804
	li $s5, 0
	j L1805
L1804:
	li $s5, 1
L1805:
	beq $s5, $zero, L1803
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1802
L1803:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1808
	li $s6, 0
	j L1809
L1808:
	li $s6, 1
L1809:
	beq $s6, $zero, L1807
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1806
L1807:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1812
	li $s5, 0
	j L1813
L1812:
	li $s5, 1
L1813:
	beq $s5, $zero, L1811
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1810
L1811:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1816
	li $s6, 0
	j L1817
L1816:
	li $s6, 1
L1817:
	beq $s6, $zero, L1815
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1814
L1815:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1820
	li $s5, 0
	j L1821
L1820:
	li $s5, 1
L1821:
	beq $s5, $zero, L1819
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1818
L1819:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1824
	li $s6, 0
	j L1825
L1824:
	li $s6, 1
L1825:
	beq $s6, $zero, L1823
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1822
L1823:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1828
	li $s5, 0
	j L1829
L1828:
	li $s5, 1
L1829:
	beq $s5, $zero, L1827
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym10
	j L1826
L1827:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1832
	li $s6, 0
	j L1833
L1832:
	li $s6, 1
L1833:
	beq $s6, $zero, L1831
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym10
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym10
	j L1830
L1831:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1835
	li $s5, 0
	j L1836
L1835:
	li $s5, 1
L1836:
	beq $s5, $zero, L1834
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym10
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym10
L1834:
L1830:
L1826:
L1822:
L1818:
L1814:
L1810:
L1806:
L1802:
L1798:
L1794:
L1790:
L1786:
L1782:
L1778:
	j L1774
L1775:
	lw $s5, 4($sp)
	li $s6, 4
	beq $s5, $s6, L1839
	li $s6, 0
	j L1840
L1839:
	li $s6, 1
L1840:
	beq $s6, $zero, L1838
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1843
	li $s5, 0
	j L1844
L1843:
	li $s5, 1
L1844:
	beq $s5, $zero, L1842
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1841
L1842:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1847
	li $s6, 0
	j L1848
L1847:
	li $s6, 1
L1848:
	beq $s6, $zero, L1846
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1845
L1846:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1851
	li $s5, 0
	j L1852
L1851:
	li $s5, 1
L1852:
	beq $s5, $zero, L1850
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1849
L1850:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1855
	li $s6, 0
	j L1856
L1855:
	li $s6, 1
L1856:
	beq $s6, $zero, L1854
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1853
L1854:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1859
	li $s5, 0
	j L1860
L1859:
	li $s5, 1
L1860:
	beq $s5, $zero, L1858
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1857
L1858:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1863
	li $s6, 0
	j L1864
L1863:
	li $s6, 1
L1864:
	beq $s6, $zero, L1862
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1861
L1862:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1867
	li $s5, 0
	j L1868
L1867:
	li $s5, 1
L1868:
	beq $s5, $zero, L1866
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1865
L1866:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1871
	li $s6, 0
	j L1872
L1871:
	li $s6, 1
L1872:
	beq $s6, $zero, L1870
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1869
L1870:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1875
	li $s5, 0
	j L1876
L1875:
	li $s5, 1
L1876:
	beq $s5, $zero, L1874
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1873
L1874:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1879
	li $s6, 0
	j L1880
L1879:
	li $s6, 1
L1880:
	beq $s6, $zero, L1878
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1877
L1878:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1883
	li $s5, 0
	j L1884
L1883:
	li $s5, 1
L1884:
	beq $s5, $zero, L1882
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1881
L1882:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1887
	li $s6, 0
	j L1888
L1887:
	li $s6, 1
L1888:
	beq $s6, $zero, L1886
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1885
L1886:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1891
	li $s5, 0
	j L1892
L1891:
	li $s5, 1
L1892:
	beq $s5, $zero, L1890
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym11
	j L1889
L1890:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1895
	li $s6, 0
	j L1896
L1895:
	li $s6, 1
L1896:
	beq $s6, $zero, L1894
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym11
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym11
	j L1893
L1894:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1898
	li $s5, 0
	j L1899
L1898:
	li $s5, 1
L1899:
	beq $s5, $zero, L1897
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym11
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym11
L1897:
L1893:
L1889:
L1885:
L1881:
L1877:
L1873:
L1869:
L1865:
L1861:
L1857:
L1853:
L1849:
L1845:
L1841:
	j L1837
L1838:
	lw $s5, 4($sp)
	li $s6, 5
	beq $s5, $s6, L1902
	li $s6, 0
	j L1903
L1902:
	li $s6, 1
L1903:
	beq $s6, $zero, L1901
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1906
	li $s5, 0
	j L1907
L1906:
	li $s5, 1
L1907:
	beq $s5, $zero, L1905
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1904
L1905:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1910
	li $s6, 0
	j L1911
L1910:
	li $s6, 1
L1911:
	beq $s6, $zero, L1909
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1908
L1909:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1914
	li $s5, 0
	j L1915
L1914:
	li $s5, 1
L1915:
	beq $s5, $zero, L1913
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1912
L1913:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1918
	li $s6, 0
	j L1919
L1918:
	li $s6, 1
L1919:
	beq $s6, $zero, L1917
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1916
L1917:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1922
	li $s5, 0
	j L1923
L1922:
	li $s5, 1
L1923:
	beq $s5, $zero, L1921
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1920
L1921:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1926
	li $s6, 0
	j L1927
L1926:
	li $s6, 1
L1927:
	beq $s6, $zero, L1925
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1924
L1925:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1930
	li $s5, 0
	j L1931
L1930:
	li $s5, 1
L1931:
	beq $s5, $zero, L1929
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1928
L1929:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1934
	li $s6, 0
	j L1935
L1934:
	li $s6, 1
L1935:
	beq $s6, $zero, L1933
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1932
L1933:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L1938
	li $s5, 0
	j L1939
L1938:
	li $s5, 1
L1939:
	beq $s5, $zero, L1937
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1936
L1937:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L1942
	li $s6, 0
	j L1943
L1942:
	li $s6, 1
L1943:
	beq $s6, $zero, L1941
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1940
L1941:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L1946
	li $s5, 0
	j L1947
L1946:
	li $s5, 1
L1947:
	beq $s5, $zero, L1945
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1944
L1945:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L1950
	li $s6, 0
	j L1951
L1950:
	li $s6, 1
L1951:
	beq $s6, $zero, L1949
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1948
L1949:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L1954
	li $s5, 0
	j L1955
L1954:
	li $s5, 1
L1955:
	beq $s5, $zero, L1953
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym12
	j L1952
L1953:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L1958
	li $s6, 0
	j L1959
L1958:
	li $s6, 1
L1959:
	beq $s6, $zero, L1957
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym12
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym12
	j L1956
L1957:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L1961
	li $s5, 0
	j L1962
L1961:
	li $s5, 1
L1962:
	beq $s5, $zero, L1960
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym12
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym12
L1960:
L1956:
L1952:
L1948:
L1944:
L1940:
L1936:
L1932:
L1928:
L1924:
L1920:
L1916:
L1912:
L1908:
L1904:
	j L1900
L1901:
	lw $s5, 4($sp)
	li $s6, 6
	beq $s5, $s6, L1965
	li $s6, 0
	j L1966
L1965:
	li $s6, 1
L1966:
	beq $s6, $zero, L1964
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L1969
	li $s5, 0
	j L1970
L1969:
	li $s5, 1
L1970:
	beq $s5, $zero, L1968
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym13
	j L1967
L1968:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L1973
	li $s6, 0
	j L1974
L1973:
	li $s6, 1
L1974:
	beq $s6, $zero, L1972
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym13
	j L1971
L1972:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L1977
	li $s5, 0
	j L1978
L1977:
	li $s5, 1
L1978:
	beq $s5, $zero, L1976
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym13
	j L1975
L1976:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L1981
	li $s6, 0
	j L1982
L1981:
	li $s6, 1
L1982:
	beq $s6, $zero, L1980
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym13
	j L1979
L1980:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L1985
	li $s5, 0
	j L1986
L1985:
	li $s5, 1
L1986:
	beq $s5, $zero, L1984
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym13
	j L1983
L1984:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L1989
	li $s6, 0
	j L1990
L1989:
	li $s6, 1
L1990:
	beq $s6, $zero, L1988
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym13
	j L1987
L1988:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L1993
	li $s5, 0
	j L1994
L1993:
	li $s5, 1
L1994:
	beq $s5, $zero, L1992
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym13
	j L1991
L1992:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L1997
	li $s6, 0
	j L1998
L1997:
	li $s6, 1
L1998:
	beq $s6, $zero, L1996
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym13
	j L1995
L1996:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2001
	li $s5, 0
	j L2002
L2001:
	li $s5, 1
L2002:
	beq $s5, $zero, L2000
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym13
	j L1999
L2000:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2005
	li $s6, 0
	j L2006
L2005:
	li $s6, 1
L2006:
	beq $s6, $zero, L2004
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym13
	j L2003
L2004:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2009
	li $s5, 0
	j L2010
L2009:
	li $s5, 1
L2010:
	beq $s5, $zero, L2008
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym13
	j L2007
L2008:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2013
	li $s6, 0
	j L2014
L2013:
	li $s6, 1
L2014:
	beq $s6, $zero, L2012
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym13
	j L2011
L2012:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2017
	li $s5, 0
	j L2018
L2017:
	li $s5, 1
L2018:
	beq $s5, $zero, L2016
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym13
	j L2015
L2016:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2021
	li $s6, 0
	j L2022
L2021:
	li $s6, 1
L2022:
	beq $s6, $zero, L2020
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym13
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym13
	j L2019
L2020:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2024
	li $s5, 0
	j L2025
L2024:
	li $s5, 1
L2025:
	beq $s5, $zero, L2023
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym13
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym13
L2023:
L2019:
L2015:
L2011:
L2007:
L2003:
L1999:
L1995:
L1991:
L1987:
L1983:
L1979:
L1975:
L1971:
L1967:
	j L1963
L1964:
	lw $s5, 4($sp)
	li $s6, 7
	beq $s5, $s6, L2028
	li $s6, 0
	j L2029
L2028:
	li $s6, 1
L2029:
	beq $s6, $zero, L2027
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2032
	li $s5, 0
	j L2033
L2032:
	li $s5, 1
L2033:
	beq $s5, $zero, L2031
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2030
L2031:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2036
	li $s6, 0
	j L2037
L2036:
	li $s6, 1
L2037:
	beq $s6, $zero, L2035
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2034
L2035:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2040
	li $s5, 0
	j L2041
L2040:
	li $s5, 1
L2041:
	beq $s5, $zero, L2039
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2038
L2039:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2044
	li $s6, 0
	j L2045
L2044:
	li $s6, 1
L2045:
	beq $s6, $zero, L2043
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2042
L2043:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2048
	li $s5, 0
	j L2049
L2048:
	li $s5, 1
L2049:
	beq $s5, $zero, L2047
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2046
L2047:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2052
	li $s6, 0
	j L2053
L2052:
	li $s6, 1
L2053:
	beq $s6, $zero, L2051
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2050
L2051:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2056
	li $s5, 0
	j L2057
L2056:
	li $s5, 1
L2057:
	beq $s5, $zero, L2055
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2054
L2055:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2060
	li $s6, 0
	j L2061
L2060:
	li $s6, 1
L2061:
	beq $s6, $zero, L2059
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2058
L2059:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2064
	li $s5, 0
	j L2065
L2064:
	li $s5, 1
L2065:
	beq $s5, $zero, L2063
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2062
L2063:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2068
	li $s6, 0
	j L2069
L2068:
	li $s6, 1
L2069:
	beq $s6, $zero, L2067
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2066
L2067:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2072
	li $s5, 0
	j L2073
L2072:
	li $s5, 1
L2073:
	beq $s5, $zero, L2071
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2070
L2071:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2076
	li $s6, 0
	j L2077
L2076:
	li $s6, 1
L2077:
	beq $s6, $zero, L2075
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2074
L2075:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2080
	li $s5, 0
	j L2081
L2080:
	li $s5, 1
L2081:
	beq $s5, $zero, L2079
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym14
	j L2078
L2079:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2084
	li $s6, 0
	j L2085
L2084:
	li $s6, 1
L2085:
	beq $s6, $zero, L2083
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym14
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym14
	j L2082
L2083:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2087
	li $s5, 0
	j L2088
L2087:
	li $s5, 1
L2088:
	beq $s5, $zero, L2086
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym14
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym14
L2086:
L2082:
L2078:
L2074:
L2070:
L2066:
L2062:
L2058:
L2054:
L2050:
L2046:
L2042:
L2038:
L2034:
L2030:
	j L2026
L2027:
	lw $s5, 4($sp)
	li $s6, 8
	beq $s5, $s6, L2091
	li $s6, 0
	j L2092
L2091:
	li $s6, 1
L2092:
	beq $s6, $zero, L2090
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2095
	li $s5, 0
	j L2096
L2095:
	li $s5, 1
L2096:
	beq $s5, $zero, L2094
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2093
L2094:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2099
	li $s6, 0
	j L2100
L2099:
	li $s6, 1
L2100:
	beq $s6, $zero, L2098
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2097
L2098:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2103
	li $s5, 0
	j L2104
L2103:
	li $s5, 1
L2104:
	beq $s5, $zero, L2102
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2101
L2102:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2107
	li $s6, 0
	j L2108
L2107:
	li $s6, 1
L2108:
	beq $s6, $zero, L2106
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2105
L2106:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2111
	li $s5, 0
	j L2112
L2111:
	li $s5, 1
L2112:
	beq $s5, $zero, L2110
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2109
L2110:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2115
	li $s6, 0
	j L2116
L2115:
	li $s6, 1
L2116:
	beq $s6, $zero, L2114
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2113
L2114:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2119
	li $s5, 0
	j L2120
L2119:
	li $s5, 1
L2120:
	beq $s5, $zero, L2118
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2117
L2118:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2123
	li $s6, 0
	j L2124
L2123:
	li $s6, 1
L2124:
	beq $s6, $zero, L2122
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2121
L2122:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2127
	li $s5, 0
	j L2128
L2127:
	li $s5, 1
L2128:
	beq $s5, $zero, L2126
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2125
L2126:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2131
	li $s6, 0
	j L2132
L2131:
	li $s6, 1
L2132:
	beq $s6, $zero, L2130
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2129
L2130:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2135
	li $s5, 0
	j L2136
L2135:
	li $s5, 1
L2136:
	beq $s5, $zero, L2134
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2133
L2134:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2139
	li $s6, 0
	j L2140
L2139:
	li $s6, 1
L2140:
	beq $s6, $zero, L2138
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2137
L2138:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2143
	li $s5, 0
	j L2144
L2143:
	li $s5, 1
L2144:
	beq $s5, $zero, L2142
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym15
	j L2141
L2142:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2147
	li $s6, 0
	j L2148
L2147:
	li $s6, 1
L2148:
	beq $s6, $zero, L2146
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym15
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym15
	j L2145
L2146:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2150
	li $s5, 0
	j L2151
L2150:
	li $s5, 1
L2151:
	beq $s5, $zero, L2149
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym15
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym15
L2149:
L2145:
L2141:
L2137:
L2133:
L2129:
L2125:
L2121:
L2117:
L2113:
L2109:
L2105:
L2101:
L2097:
L2093:
	j L2089
L2090:
	lw $s5, 4($sp)
	li $s6, 9
	beq $s5, $s6, L2154
	li $s6, 0
	j L2155
L2154:
	li $s6, 1
L2155:
	beq $s6, $zero, L2153
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2158
	li $s5, 0
	j L2159
L2158:
	li $s5, 1
L2159:
	beq $s5, $zero, L2157
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2156
L2157:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2162
	li $s6, 0
	j L2163
L2162:
	li $s6, 1
L2163:
	beq $s6, $zero, L2161
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2160
L2161:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2166
	li $s5, 0
	j L2167
L2166:
	li $s5, 1
L2167:
	beq $s5, $zero, L2165
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2164
L2165:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2170
	li $s6, 0
	j L2171
L2170:
	li $s6, 1
L2171:
	beq $s6, $zero, L2169
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2168
L2169:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2174
	li $s5, 0
	j L2175
L2174:
	li $s5, 1
L2175:
	beq $s5, $zero, L2173
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2172
L2173:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2178
	li $s6, 0
	j L2179
L2178:
	li $s6, 1
L2179:
	beq $s6, $zero, L2177
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2176
L2177:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2182
	li $s5, 0
	j L2183
L2182:
	li $s5, 1
L2183:
	beq $s5, $zero, L2181
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2180
L2181:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2186
	li $s6, 0
	j L2187
L2186:
	li $s6, 1
L2187:
	beq $s6, $zero, L2185
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2184
L2185:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2190
	li $s5, 0
	j L2191
L2190:
	li $s5, 1
L2191:
	beq $s5, $zero, L2189
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2188
L2189:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2194
	li $s6, 0
	j L2195
L2194:
	li $s6, 1
L2195:
	beq $s6, $zero, L2193
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2192
L2193:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2198
	li $s5, 0
	j L2199
L2198:
	li $s5, 1
L2199:
	beq $s5, $zero, L2197
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2196
L2197:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2202
	li $s6, 0
	j L2203
L2202:
	li $s6, 1
L2203:
	beq $s6, $zero, L2201
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2200
L2201:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2206
	li $s5, 0
	j L2207
L2206:
	li $s5, 1
L2207:
	beq $s5, $zero, L2205
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym16
	j L2204
L2205:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2210
	li $s6, 0
	j L2211
L2210:
	li $s6, 1
L2211:
	beq $s6, $zero, L2209
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym16
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym16
	j L2208
L2209:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2213
	li $s5, 0
	j L2214
L2213:
	li $s5, 1
L2214:
	beq $s5, $zero, L2212
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym16
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym16
L2212:
L2208:
L2204:
L2200:
L2196:
L2192:
L2188:
L2184:
L2180:
L2176:
L2172:
L2168:
L2164:
L2160:
L2156:
	j L2152
L2153:
	lw $s5, 4($sp)
	li $s6, 10
	beq $s5, $s6, L2217
	li $s6, 0
	j L2218
L2217:
	li $s6, 1
L2218:
	beq $s6, $zero, L2216
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2221
	li $s5, 0
	j L2222
L2221:
	li $s5, 1
L2222:
	beq $s5, $zero, L2220
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2219
L2220:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2225
	li $s6, 0
	j L2226
L2225:
	li $s6, 1
L2226:
	beq $s6, $zero, L2224
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2223
L2224:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2229
	li $s5, 0
	j L2230
L2229:
	li $s5, 1
L2230:
	beq $s5, $zero, L2228
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2227
L2228:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2233
	li $s6, 0
	j L2234
L2233:
	li $s6, 1
L2234:
	beq $s6, $zero, L2232
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2231
L2232:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2237
	li $s5, 0
	j L2238
L2237:
	li $s5, 1
L2238:
	beq $s5, $zero, L2236
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2235
L2236:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2241
	li $s6, 0
	j L2242
L2241:
	li $s6, 1
L2242:
	beq $s6, $zero, L2240
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2239
L2240:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2245
	li $s5, 0
	j L2246
L2245:
	li $s5, 1
L2246:
	beq $s5, $zero, L2244
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2243
L2244:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2249
	li $s6, 0
	j L2250
L2249:
	li $s6, 1
L2250:
	beq $s6, $zero, L2248
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2247
L2248:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2253
	li $s5, 0
	j L2254
L2253:
	li $s5, 1
L2254:
	beq $s5, $zero, L2252
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2251
L2252:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2257
	li $s6, 0
	j L2258
L2257:
	li $s6, 1
L2258:
	beq $s6, $zero, L2256
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2255
L2256:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2261
	li $s5, 0
	j L2262
L2261:
	li $s5, 1
L2262:
	beq $s5, $zero, L2260
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2259
L2260:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2265
	li $s6, 0
	j L2266
L2265:
	li $s6, 1
L2266:
	beq $s6, $zero, L2264
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2263
L2264:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2269
	li $s5, 0
	j L2270
L2269:
	li $s5, 1
L2270:
	beq $s5, $zero, L2268
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym17
	j L2267
L2268:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2273
	li $s6, 0
	j L2274
L2273:
	li $s6, 1
L2274:
	beq $s6, $zero, L2272
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym17
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym17
	j L2271
L2272:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2276
	li $s5, 0
	j L2277
L2276:
	li $s5, 1
L2277:
	beq $s5, $zero, L2275
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym17
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym17
L2275:
L2271:
L2267:
L2263:
L2259:
L2255:
L2251:
L2247:
L2243:
L2239:
L2235:
L2231:
L2227:
L2223:
L2219:
	j L2215
L2216:
	lw $s5, 4($sp)
	li $s6, 11
	beq $s5, $s6, L2280
	li $s6, 0
	j L2281
L2280:
	li $s6, 1
L2281:
	beq $s6, $zero, L2279
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2284
	li $s5, 0
	j L2285
L2284:
	li $s5, 1
L2285:
	beq $s5, $zero, L2283
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2282
L2283:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2288
	li $s6, 0
	j L2289
L2288:
	li $s6, 1
L2289:
	beq $s6, $zero, L2287
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2286
L2287:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2292
	li $s5, 0
	j L2293
L2292:
	li $s5, 1
L2293:
	beq $s5, $zero, L2291
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2290
L2291:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2296
	li $s6, 0
	j L2297
L2296:
	li $s6, 1
L2297:
	beq $s6, $zero, L2295
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2294
L2295:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2300
	li $s5, 0
	j L2301
L2300:
	li $s5, 1
L2301:
	beq $s5, $zero, L2299
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2298
L2299:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2304
	li $s6, 0
	j L2305
L2304:
	li $s6, 1
L2305:
	beq $s6, $zero, L2303
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2302
L2303:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2308
	li $s5, 0
	j L2309
L2308:
	li $s5, 1
L2309:
	beq $s5, $zero, L2307
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2306
L2307:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2312
	li $s6, 0
	j L2313
L2312:
	li $s6, 1
L2313:
	beq $s6, $zero, L2311
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2310
L2311:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2316
	li $s5, 0
	j L2317
L2316:
	li $s5, 1
L2317:
	beq $s5, $zero, L2315
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2314
L2315:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2320
	li $s6, 0
	j L2321
L2320:
	li $s6, 1
L2321:
	beq $s6, $zero, L2319
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2318
L2319:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2324
	li $s5, 0
	j L2325
L2324:
	li $s5, 1
L2325:
	beq $s5, $zero, L2323
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2322
L2323:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2328
	li $s6, 0
	j L2329
L2328:
	li $s6, 1
L2329:
	beq $s6, $zero, L2327
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2326
L2327:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2332
	li $s5, 0
	j L2333
L2332:
	li $s5, 1
L2333:
	beq $s5, $zero, L2331
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym18
	j L2330
L2331:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2336
	li $s6, 0
	j L2337
L2336:
	li $s6, 1
L2337:
	beq $s6, $zero, L2335
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym18
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym18
	j L2334
L2335:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2339
	li $s5, 0
	j L2340
L2339:
	li $s5, 1
L2340:
	beq $s5, $zero, L2338
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym18
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym18
L2338:
L2334:
L2330:
L2326:
L2322:
L2318:
L2314:
L2310:
L2306:
L2302:
L2298:
L2294:
L2290:
L2286:
L2282:
	j L2278
L2279:
	lw $s5, 4($sp)
	li $s6, 12
	beq $s5, $s6, L2343
	li $s6, 0
	j L2344
L2343:
	li $s6, 1
L2344:
	beq $s6, $zero, L2342
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2347
	li $s5, 0
	j L2348
L2347:
	li $s5, 1
L2348:
	beq $s5, $zero, L2346
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2345
L2346:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2351
	li $s6, 0
	j L2352
L2351:
	li $s6, 1
L2352:
	beq $s6, $zero, L2350
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2349
L2350:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2355
	li $s5, 0
	j L2356
L2355:
	li $s5, 1
L2356:
	beq $s5, $zero, L2354
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2353
L2354:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2359
	li $s6, 0
	j L2360
L2359:
	li $s6, 1
L2360:
	beq $s6, $zero, L2358
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2357
L2358:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2363
	li $s5, 0
	j L2364
L2363:
	li $s5, 1
L2364:
	beq $s5, $zero, L2362
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2361
L2362:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2367
	li $s6, 0
	j L2368
L2367:
	li $s6, 1
L2368:
	beq $s6, $zero, L2366
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2365
L2366:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2371
	li $s5, 0
	j L2372
L2371:
	li $s5, 1
L2372:
	beq $s5, $zero, L2370
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2369
L2370:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2375
	li $s6, 0
	j L2376
L2375:
	li $s6, 1
L2376:
	beq $s6, $zero, L2374
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2373
L2374:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2379
	li $s5, 0
	j L2380
L2379:
	li $s5, 1
L2380:
	beq $s5, $zero, L2378
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2377
L2378:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2383
	li $s6, 0
	j L2384
L2383:
	li $s6, 1
L2384:
	beq $s6, $zero, L2382
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2381
L2382:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2387
	li $s5, 0
	j L2388
L2387:
	li $s5, 1
L2388:
	beq $s5, $zero, L2386
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2385
L2386:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2391
	li $s6, 0
	j L2392
L2391:
	li $s6, 1
L2392:
	beq $s6, $zero, L2390
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2389
L2390:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2395
	li $s5, 0
	j L2396
L2395:
	li $s5, 1
L2396:
	beq $s5, $zero, L2394
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym19
	j L2393
L2394:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2399
	li $s6, 0
	j L2400
L2399:
	li $s6, 1
L2400:
	beq $s6, $zero, L2398
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym19
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym19
	j L2397
L2398:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2402
	li $s5, 0
	j L2403
L2402:
	li $s5, 1
L2403:
	beq $s5, $zero, L2401
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym19
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym19
L2401:
L2397:
L2393:
L2389:
L2385:
L2381:
L2377:
L2373:
L2369:
L2365:
L2361:
L2357:
L2353:
L2349:
L2345:
	j L2341
L2342:
	lw $s5, 4($sp)
	li $s6, 13
	beq $s5, $s6, L2405
	li $s6, 0
	j L2406
L2405:
	li $s6, 1
L2406:
	beq $s6, $zero, L2404
	lw $s6, 16($sp)
	li $s5, 0
	beq $s6, $s5, L2409
	li $s5, 0
	j L2410
L2409:
	li $s5, 1
L2410:
	beq $s5, $zero, L2408
	lw $s5, sym7
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym7
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2407
L2408:
	lw $s5, 16($sp)
	li $s6, 1
	beq $s5, $s6, L2413
	li $s6, 0
	j L2414
L2413:
	li $s6, 1
L2414:
	beq $s6, $zero, L2412
	lw $s6, sym8
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym8
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2411
L2412:
	lw $s6, 16($sp)
	li $s5, 2
	beq $s6, $s5, L2417
	li $s5, 0
	j L2418
L2417:
	li $s5, 1
L2418:
	beq $s5, $zero, L2416
	lw $s5, sym9
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym9
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2415
L2416:
	lw $s5, 16($sp)
	li $s6, 3
	beq $s5, $s6, L2421
	li $s6, 0
	j L2422
L2421:
	li $s6, 1
L2422:
	beq $s6, $zero, L2420
	lw $s6, sym10
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym10
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2419
L2420:
	lw $s6, 16($sp)
	li $s5, 4
	beq $s6, $s5, L2425
	li $s5, 0
	j L2426
L2425:
	li $s5, 1
L2426:
	beq $s5, $zero, L2424
	lw $s5, sym11
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym11
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2423
L2424:
	lw $s5, 16($sp)
	li $s6, 5
	beq $s5, $s6, L2429
	li $s6, 0
	j L2430
L2429:
	li $s6, 1
L2430:
	beq $s6, $zero, L2428
	lw $s6, sym12
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym12
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2427
L2428:
	lw $s6, 16($sp)
	li $s5, 6
	beq $s6, $s5, L2433
	li $s5, 0
	j L2434
L2433:
	li $s5, 1
L2434:
	beq $s5, $zero, L2432
	lw $s5, sym13
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym13
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2431
L2432:
	lw $s5, 16($sp)
	li $s6, 7
	beq $s5, $s6, L2437
	li $s6, 0
	j L2438
L2437:
	li $s6, 1
L2438:
	beq $s6, $zero, L2436
	lw $s6, sym14
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym14
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2435
L2436:
	lw $s6, 16($sp)
	li $s5, 8
	beq $s6, $s5, L2441
	li $s5, 0
	j L2442
L2441:
	li $s5, 1
L2442:
	beq $s5, $zero, L2440
	lw $s5, sym15
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym15
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2439
L2440:
	lw $s5, 16($sp)
	li $s6, 9
	beq $s5, $s6, L2445
	li $s6, 0
	j L2446
L2445:
	li $s6, 1
L2446:
	beq $s6, $zero, L2444
	lw $s6, sym16
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym16
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2443
L2444:
	lw $s6, 16($sp)
	li $s5, 10
	beq $s6, $s5, L2449
	li $s5, 0
	j L2450
L2449:
	li $s5, 1
L2450:
	beq $s5, $zero, L2448
	lw $s5, sym17
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym17
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2447
L2448:
	lw $s5, 16($sp)
	li $s6, 11
	beq $s5, $s6, L2453
	li $s6, 0
	j L2454
L2453:
	li $s6, 1
L2454:
	beq $s6, $zero, L2452
	lw $s6, sym18
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym18
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2451
L2452:
	lw $s6, 16($sp)
	li $s5, 12
	beq $s6, $s5, L2457
	li $s5, 0
	j L2458
L2457:
	li $s5, 1
L2458:
	beq $s5, $zero, L2456
	lw $s5, sym19
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym19
	lw $s5, 12($sp)
	sw $s5, sym20
	j L2455
L2456:
	lw $s5, 16($sp)
	li $s6, 13
	beq $s5, $s6, L2461
	li $s6, 0
	j L2462
L2461:
	li $s6, 1
L2462:
	beq $s6, $zero, L2460
	lw $s6, sym20
	sw $s6, 12($sp)
	lw $s6, sym20
	sw $s6, sym20
	lw $s6, 12($sp)
	sw $s6, sym20
	j L2459
L2460:
	lw $s6, 16($sp)
	li $s5, 14
	beq $s6, $s5, L2464
	li $s5, 0
	j L2465
L2464:
	li $s5, 1
L2465:
	beq $s5, $zero, L2463
	lw $s5, sym21
	sw $s5, 12($sp)
	lw $s5, sym20
	sw $s5, sym21
	lw $s5, 12($sp)
	sw $s5, sym20
L2463:
L2459:
L2455:
L2451:
L2447:
L2443:
L2439:
L2435:
L2431:
L2427:
L2423:
L2419:
L2415:
L2411:
L2407:
L2404:
L2341:
L2278:
L2215:
L2152:
L2089:
L2026:
L1963:
L1900:
L1837:
L1774:
L1711:
L1648:
L1585:
	jal sym24
	move $s5, $v0
	lw $s5, 4($sp)
	li $s6, 1
	addu $s5, $s5, $s6
	sw $s5, 4($sp)
L66:
	lw $s5, 4($sp)
	li $s6, 13
	ble $s5, $s6, L2466
	li $s6, 0
	j L2467
L2466:
	li $s6, 1
L2467:
	bne $s6, $zero, L67
L68:
L1:
	lw $ra, 0($sp)
	addi $sp, $sp, 20
	jal sym6
sym24:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $zero, 4($sp)
	li $s6, 0
	sw $s6, 4($sp)
	j L2469
L2470:
	lw $s6, 4($sp)
	li $s5, 0
	beq $s6, $s5, L2474
	li $s5, 0
	j L2475
L2474:
	li $s5, 1
L2475:
	beq $s5, $zero, L2473
	lw $s5, sym7
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2476:
.byte 1, 32
.text
	la $s5, L2476
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2472
L2473:
	lw $s5, 4($sp)
	li $s6, 1
	beq $s5, $s6, L2479
	li $s6, 0
	j L2480
L2479:
	li $s6, 1
L2480:
	beq $s6, $zero, L2478
	lw $s6, sym8
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2481:
.byte 1, 32
.text
	la $s6, L2481
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2477
L2478:
	lw $s6, 4($sp)
	li $s5, 2
	beq $s6, $s5, L2484
	li $s5, 0
	j L2485
L2484:
	li $s5, 1
L2485:
	beq $s5, $zero, L2483
	lw $s5, sym9
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2486:
.byte 1, 32
.text
	la $s5, L2486
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2482
L2483:
	lw $s5, 4($sp)
	li $s6, 3
	beq $s5, $s6, L2489
	li $s6, 0
	j L2490
L2489:
	li $s6, 1
L2490:
	beq $s6, $zero, L2488
	lw $s6, sym10
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2491:
.byte 1, 32
.text
	la $s6, L2491
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2487
L2488:
	lw $s6, 4($sp)
	li $s5, 4
	beq $s6, $s5, L2494
	li $s5, 0
	j L2495
L2494:
	li $s5, 1
L2495:
	beq $s5, $zero, L2493
	lw $s5, sym11
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2496:
.byte 1, 32
.text
	la $s5, L2496
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2492
L2493:
	lw $s5, 4($sp)
	li $s6, 5
	beq $s5, $s6, L2499
	li $s6, 0
	j L2500
L2499:
	li $s6, 1
L2500:
	beq $s6, $zero, L2498
	lw $s6, sym12
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2501:
.byte 1, 32
.text
	la $s6, L2501
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2497
L2498:
	lw $s6, 4($sp)
	li $s5, 6
	beq $s6, $s5, L2504
	li $s5, 0
	j L2505
L2504:
	li $s5, 1
L2505:
	beq $s5, $zero, L2503
	lw $s5, sym13
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2506:
.byte 1, 32
.text
	la $s5, L2506
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2502
L2503:
	lw $s5, 4($sp)
	li $s6, 7
	beq $s5, $s6, L2509
	li $s6, 0
	j L2510
L2509:
	li $s6, 1
L2510:
	beq $s6, $zero, L2508
	lw $s6, sym14
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2511:
.byte 1, 32
.text
	la $s6, L2511
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2507
L2508:
	lw $s6, 4($sp)
	li $s5, 8
	beq $s6, $s5, L2514
	li $s5, 0
	j L2515
L2514:
	li $s5, 1
L2515:
	beq $s5, $zero, L2513
	lw $s5, sym15
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2516:
.byte 1, 32
.text
	la $s5, L2516
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2512
L2513:
	lw $s5, 4($sp)
	li $s6, 9
	beq $s5, $s6, L2519
	li $s6, 0
	j L2520
L2519:
	li $s6, 1
L2520:
	beq $s6, $zero, L2518
	lw $s6, sym16
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2521:
.byte 1, 32
.text
	la $s6, L2521
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2517
L2518:
	lw $s6, 4($sp)
	li $s5, 10
	beq $s6, $s5, L2524
	li $s5, 0
	j L2525
L2524:
	li $s5, 1
L2525:
	beq $s5, $zero, L2523
	lw $s5, sym17
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2526:
.byte 1, 32
.text
	la $s5, L2526
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2522
L2523:
	lw $s5, 4($sp)
	li $s6, 11
	beq $s5, $s6, L2529
	li $s6, 0
	j L2530
L2529:
	li $s6, 1
L2530:
	beq $s6, $zero, L2528
	lw $s6, sym18
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2531:
.byte 1, 32
.text
	la $s6, L2531
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2527
L2528:
	lw $s6, 4($sp)
	li $s5, 12
	beq $s6, $s5, L2534
	li $s5, 0
	j L2535
L2534:
	li $s5, 1
L2535:
	beq $s5, $zero, L2533
	lw $s5, sym19
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2536:
.byte 1, 32
.text
	la $s5, L2536
	move $a0, $s5
	jal sym1
	move $s5, $v0
	j L2532
L2533:
	lw $s5, 4($sp)
	li $s6, 13
	beq $s5, $s6, L2539
	li $s6, 0
	j L2540
L2539:
	li $s6, 1
L2540:
	beq $s6, $zero, L2538
	lw $s6, sym20
	move $a0, $s6
	jal sym2
	move $s6, $v0
.data
L2541:
.byte 1, 32
.text
	la $s6, L2541
	move $a0, $s6
	jal sym1
	move $s6, $v0
	j L2537
L2538:
	lw $s6, 4($sp)
	li $s5, 14
	beq $s6, $s5, L2543
	li $s5, 0
	j L2544
L2543:
	li $s5, 1
L2544:
	beq $s5, $zero, L2542
	lw $s5, sym21
	move $a0, $s5
	jal sym2
	move $s5, $v0
.data
L2545:
.byte 1, 32
.text
	la $s5, L2545
	move $a0, $s5
	jal sym1
	move $s5, $v0
L2542:
L2537:
L2532:
L2527:
L2522:
L2517:
L2512:
L2507:
L2502:
L2497:
L2492:
L2487:
L2482:
L2477:
L2472:
	lw $s5, 4($sp)
	li $s6, 1
	addu $s5, $s5, $s6
	sw $s5, 4($sp)
L2469:
	lw $s5, 4($sp)
	li $s6, 14
	ble $s5, $s6, L2546
	li $s6, 0
	j L2547
L2546:
	li $s6, 1
L2547:
	bne $s6, $zero, L2470
L2471:
.data
L2548:
.byte 1, 10
.text
	la $s6, L2548
	move $a0, $s6
	jal sym1
	move $s6, $v0
L2468:
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
L2549:
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
	div $s6, $s5
	mfhi $s6
	sw $s6, sym25
	lw $s6, sym25
	move $v0, $s6
	j L2550
.data
L2551:
.byte 72, 101, 114, 114, 111, 114, 58, 32, 102, 117, 110, 99, 116, 105, 111, 110, 32, 73, 78, 84, 69, 82, 78, 65, 76, 114, 97, 110, 100, 111, 109, 32, 109, 117, 115, 116, 32, 114, 101, 116, 117, 114, 110, 32, 97, 32, 118, 97, 108, 117, 101, 32, 97, 116, 32, 111, 114, 32, 110, 101, 97, 114, 32, 108, 105, 110, 101, 32, 50, 51, 50, 54, 10
.text
	la $a0, L2551
	jal sym1
	jal sym6
L2550:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
