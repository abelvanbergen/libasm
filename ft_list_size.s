;int		ft_list_size(t_list *begin_list);

section	.text
	global _ft_list_size

_ft_list_size:
	xor		rax, rax				;set counter 0

.loop:
	cmp		rdi, 0					;check for end of list
	je		.end					;if so, jump

	mov		rdi, [rdi + 8]			;move list to next note
	inc		rax						;increase counter
	jmp		.loop

.end:
	ret
