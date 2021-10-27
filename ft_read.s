;int		ft_read(int fildes, void *buf, size_t nbyte)

section .text
	global _ft_read
	extern ___error

_ft_read:
	mov		rax, 0x02000003		;set syscall code for read
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
