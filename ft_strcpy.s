;char	*ft_strcpy(char *dest, char *src);

section .text
	global _ft_strcpy

_ft_strcpy:
	xor		rax, rax					;set index 0

.loop:
	cmp		[rsi + rax], byte 0			;check for end of src_string
	je		.end						;if so, jump

	mov		r9b, [rsi + rax]			;copy src to register
	mov		[rdi + rax], r9b			;copy register to dest
	inc		rax							;increase counter
	jmp		.loop

.end:
	mov		[rdi + rax], byte 0			;set terminating char
	mov		rax, rdi					;copy dest to return
	ret
