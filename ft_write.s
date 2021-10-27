;int		ft_write(int fd, char *message, int len)

section .text
	global _ft_write
	extern ___error

_ft_write:
	mov		rax, 0x02000004		;set syscall code for write
	syscall
	jc		.error				;check for error
	ret


.error:
	mov		r9, rax				;hold errorcode

	push	r9
	call	___error			;get location error
	pop		r9					;						^3 prep errorcall

	mov		[rax], r9			;set errorcode on errorlocation
	mov		rax, -1				;ret -1
	ret
