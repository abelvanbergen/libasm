;void	ft_list_push_front(t_list **begin_list, void *data);

section .text
	global _ft_list_push_front
	extern _ft_create_elem

_ft_list_push_front:
	cmp		rdi, 0					;check if beginlist == NULL
	je		.end					;if so, jump
	push	rdi						;push rdi to reserve
	mov 	rdi, rsi				;set data in rdi for functioncall
	call	_ft_create_elem			;functioncall
	pop		rdi						;restore the reserve
	cmp		rax, 0					;check for malloc fail
	je		.end					;if so, jump
	mov		rdx, [rdi]				;set list in register to work with
	mov		[rax + 8], rdx			;attatch list to new note
	mov		[rdi], rax				;set new note to head

.end:	
	ret
