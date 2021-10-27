;void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

;r9 = prev note, rcx = head, r8 begin_list, r11 = next note, rdx = function, r10 = placeholder

section .text
	global _ft_list_remove_if
	extern _free


_ft_list_remove_if:
	mov		r9, 0					;set prev == 0
	mov		rcx, rdi
	mov		r8, [rdi]				;set beginlist in r8

.loop:
	cmp		r8, 0					;check for end list
	je		.end					;if so, jump

	mov		r11, [r8 + 8]			;set list->next in placeholder
	mov		rdi, [r8]				;set data for functioncall
	push	r8
	push	r9
	push	r10
	push	r11
	push	rsi
	push	rcx
	push	rdx
	call	rdx
	pop		rdx
	pop		rcx
	pop		rsi
	pop		r11
	pop		r10
	pop		r9
	pop		r8						;^15	call ft_strcmp to check if to del
	cmp		rax, 0					;check if data == data_rev
	jne		.set_prev				;if not, jump
	cmp		r9, 0					;check if he is at the head
	je		.set_head				;if so, jump
	jmp		.set_tail

.set_head:
	mov		r10, [r8 + 8]
	mov		[rcx], r10				;^2 set r8->next in prev->next
	jmp		.free					;doe ik nu nog niks mee

.set_tail:
	mov		r10, [r8 + 8]
	mov		[r9 + 8], r10			;^2 set r8->next in prev->next

.free:
	mov		rdi, r8
	push	r8
	push	r9
	push	r10
	push	r11
	push	rsi
	push	rcx
	push	rdx
	call	_free
	pop		rdx
	pop		rcx
	pop		rsi
	pop		r11
	pop		r10
	pop		r9
	pop		r8						;^15	call free
	jmp		.loop_inc

.set_prev:
	mov		r9, r8					;move prev to next note

.loop_inc:
	mov		r8, r11					;move list to next note
	jmp		.loop

.end:
	ret
