;size_t	ft_strlen(char *str)

section .text
    global _ft_strlen

_ft_strlen:
    xor   rax, rax					;set counter 0

.loop:
    cmp   byte [rdi + rax], 0		;check for end of string
    je    .end						;if so, jump

    inc   rax						;increase counter
    jmp   .loop

.end:
    ret
