;int		ft_strcmp(char *str1, char *str2)

section .text
	global	_ft_strcmp

_ft_strcmp:
	xor		r8,r8
	xor		r9,r9						;^4 setting up r8 and r9 to compare
	xor		rax,rax						;set index 0

.loop:
	mov		r8b, byte [rdi + rax]		;set rdi on index to r9b
	mov		r9b, byte [rsi + rax]
	sub		r8, r9						;r8 = r8 - r9
	jne		.end						;if r9 != 0 jump
	cmp		byte [rdi + rax], byte 0	;check if end of string
	je		.end						;if so, jump

	inc		rax							;increase index
	jmp		.loop

.end:
	mov		rax, r8						;set returnß
	ret
