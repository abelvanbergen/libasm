;char	*ft_strdup(char *str);

section .text
	global _ft_strdup
	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy

_ft_strdup:
	push	rdi					;push rdi to reserve it
	call	_ft_strlen			;get strlen from rdi (string to dup)
	mov		rdi, rax			;set return in rdi for malloc
	inc		rdi					;increase rdi for terminating char
	push	rbp					;set base pointer on stack
	mov		rbp, rsp			;set current pointer to base pointer
	and		rsp, -16			;aligning the stack for malloc			^3 malloc prep
	call	_malloc
	mov		rsp, rbp			;set base pointer to current  pointer
	pop		rbp					;get basepointer back					^2 malloc break down
	pop		rsi					;get str form stack (rdi)
	cmp		rax, 0				;check for malloc fail
	je		.end				;if so, jump
	mov		rdi, rax			;set malloc pointer to rdi for strcpy
	call	_ft_strcpy

.end:
	ret
