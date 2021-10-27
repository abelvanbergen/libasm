;int		ft_atoi_base(char *str, char *base);

;

section .text
	global _ft_atoi_base
	extern _ft_strchr_l
	extern _ft_count

;r8 = base_string, r9 = base_len, r10 = index, r11 = neg, rdx = res

_ft_atoi_base:
	mov		r8, rdi						;set nb in r8
	mov		rdi, rsi					;set base in rdi

.length_base:
	mov		rsi, 0						;set rsi on \0
	push	rdi
	push	r8
	call	_ft_strchr_l
	pop		r8
	pop		rdi							;^5 call ft_strchr_l to find length base
	cmp		rax, 1						;checks if return is > 1
	jle		.ret_zero					;if not, jump
	mov		r9, rax						;set length number in r9

.plus_in_base:
	mov		rsi, 43						;set rsi on +
	push	rdi
	push	r8
	push	r9
	call	_ft_strchr_l
	pop		r9
	pop		r8
	pop		rdi							;^7 call ft_strchr_l to look for +
	cmp		rax, -1						;checks if + is found
	jne		.ret_zero					;if so, jump

.min_in_base:
	mov		rsi, 45						;set rsi on -
	push	rdi
	push	r8
	push	r9
	call	_ft_strchr_l
	pop		r9
	pop		r8
	pop		rdi							;^7 call ft_strchr_l to look for -
	cmp		rax, -1						;checks if - is found
	jne		.ret_zero					;if so, jump

.only_different_char:
	xor		r10, r10					;set index 0

.only_different_char_loop:
	cmp		[rdi + r10], byte 0			;check for end of string
	je		.if_plus					;if so, jump
	mov		sil, [rdi + r10]			;set which char to count
	push	rdi
	push	r8
	push	r9
	push	r10
	call	_ft_count
	pop		r10
	pop		r9
	pop		r8
	pop		rdi							;^7 call ft_count to count the amount of sil
	cmp		rax, 1						;check if return == 1
	jne		.ret_zero					;if not, jump

	inc		r10							;increase the index
	jmp		.only_different_char_loop

.if_plus:
	mov		r11, 1						;set neg 1
	xor		r10, r10					;set index 0
	cmp		[r8 + r10], byte 43			;check if fisrt byte is +
	jne		.if_min						;if not jump

	inc		r10							;increase index
	jmp		.calc_nb

.if_min:
	cmp		[r8 + r10], byte 45			;check if fisrt byte is -
	jne		.calc_nb					;if not, jump

	inc		r10							;increase index
	mov		r11, -1						;set neg -1
	jmp		.calc_nb

.calc_nb:
	xor		rdx, rdx					;set res 0

.calc_nb_loop:
	cmp		[r8 + r10], byte 0			;check for end of string
	je		.ft_set_return				;if so, jump
	mov		rax, r9						;set nb_base in rax
	mul		rdx							;multiply rax with rdx
	mov		rdx, rax					;set ret in rdx (result)
	mov		sil, [r8 + r10]				;set which char to find
	push	rdi
	push	rdx
	push	r8
	push	r9
	push	r10
	push	r11
	call	_ft_strchr_l
	pop		r11
	pop		r10
	pop		r9
	pop		r8
	pop		rdx
	pop		rdi							;^13 call ft_strchr_l to look for sil
	cmp		rax, -1						;check if found
	je		.ret_zero					;if so, jump

	add		rdx, rax					;add value to result
	inc		r10							;increase index
	jmp		.calc_nb_loop

.ft_set_return:
	mov		rax, rdx					;set result in return
	mul		r11							;multiply with neg
	jmp		.end

.ret_zero:
	mov		rax, 0						;set ret zero if needed

.end:
	ret
