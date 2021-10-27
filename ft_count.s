;int		ft_count(char *str, char c);

section	.text
	global	_ft_count

_ft_count:
	mov		r8, -1						;set index -1
	mov		r9, rsi						;set char c in r9
	xor		rax, rax					;set counter 0

.loop:
	inc		r8							;increase index
	cmp		[rdi + r8], byte 0			;check for end of list
	je		.end				;if so, jump
	cmp		[rdi + r8], r9b				;checks if str[i] == c
	jne		.loop						;if not, jump

	inc		rax							;increase counter
	jmp		.loop

.end:
	ret

