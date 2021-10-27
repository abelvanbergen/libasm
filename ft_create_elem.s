;t_list	*ft_create_elem(void *data);

section .text
	global _ft_create_elem
	extern _malloc

_ft_create_elem:
	push	rdi
	mov		rdi, 16				;set size to malloc
	push	rbp					;set base pointer on stack
	mov		rbp, rsp			;set current pointer to base pointer
	and		rsp, -16			;aligning the stack for malloc			^3 malloc prep
	call	_malloc
	mov		rsp, rbp			;set base pointer to current  pointer
	pop		rbp					;get basepointer back					^2 malloc break down
	pop		rdi
	cmp		rax, 0				;check for malloc fail
	je		.end				;if so, jump
	mov		[rax], rdi			;set data
	mov		QWORD [rax + 8], 0	;set next 0

.end:
	ret
