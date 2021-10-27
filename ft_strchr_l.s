;int		ft_strchr_l(char *str, char c);

;search for char c and returns the index, if charc is not found ret -1

section .text
	global _ft_strchr_l

_ft_strchr_l:
	mov		r9, rsi							;set char c in r9
	xor		rax, rax						;set index 0

.loop:
	cmp		[rdi + rax], r9b				;check if str[i] == 0
	je		.end				;if so, jump
	cmp		[rdi + rax], byte 0				;check if end of string
	je		.char_not_found					;if so, jump

	inc		rax								;increase index
	jmp		.loop

.char_not_found:
	mov		rax, -1							;set return -1

.end:
	ret
