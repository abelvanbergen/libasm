;void	ft_list_sort(t_list **begin_list, int (*cmp)());

;r9 = beginlist, r11 = function, rcx = changed, r10 = tempregister

section .text
	global _ft_list_sort

_ft_list_sort:
	mov		r9, rdi						;set beginlist to reserve
	mov		r11, rsi					;set function to reserve

.input_check:
	cmp		rdi, 0						;check for begin_List == 0
	je		.end						;if so, jump
	cmp		QWORD [rdi], 0				;check for *begin_list == 0
	je		.end						;if so, jump

.set_up_loop:
	xor		rcx, rcx					;set changed to 0
	mov		rdx, [r9]					;set list to begin

.loop:
	cmp		QWORD [rdx + 8], 0			;checkif next note is end of list
	je		.inf_loop					;if so, jump

	mov		rdi, [rdx]					;set data current note to check
	mov		r10, [rdx + 8]
	mov		rsi, [r10]					;^2 set data next note to check
	push	rcx
	push	rdx
	push	r9
	push	r10
	push	r11
	call	r11
	pop		r11
	pop		r10
	pop		r9
	pop		rdx
	pop		rcx							;^11 call ft_strcmp to check for order
	cmp		rax, 0						;check for difference
	jle		.loop_inc					;if lower or equal, jump

	mov		[rdx], rsi
	mov		[r10], rdi					;^2 switch the data
	inc		rcx							;increase changed

.loop_inc:
	mov		rdx, [rdx + 8]				;move list to next note
	jmp		.loop

.inf_loop:
	cmp		rcx, 0						;check if changed == 0
	jne		.set_up_loop				;if not jump

.end:
	ret
