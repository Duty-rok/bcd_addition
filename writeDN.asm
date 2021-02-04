%define arg1 ebp+8 ; fro access of subprgram's first argument 
global _print
global _output_eol
section .text
_output_eol:
    mov	eax,	4
	mov	ebx,	1
	mov	ecx,	eol
	mov	edx,	1
	int 80h
ret
_lprint: ;recursive subprogram for output the text
section .data
	number	dd	0
    space   db  20h
    eol db 0xa 
section .text
	cmp	eax,	0
	je	.p_exit
	div	ebx
	add	edx,	48
	push	edx
	xor	edx,	edx
	call	_lprint
	pop	dword [number]
	mov	ecx,	number
	mov	eax,	4
	mov	ebx,	1
	mov	edx,	1
	int 80h
.p_exit:
	ret
_print: ; subprogram for output the dec numbers
    push ebp
    mov ebp,    esp
	xor	eax,	eax
    xor edx,    edx
	mov	al,	byte [arg1]
	cmp	eax,	0
	je	.write_zero
	mov	ebx,	0xA
	call _lprint
	jmp	.exit
.write_zero:
	add byte    [edi], 48
    mov	eax,	4
	mov	ebx,	1
	mov	ecx,	edi
	mov	edx,	1
	int 80h
    sub byte    [edi],48
.exit:
	;mov	eax,	4
	;mov	ebx,	1
	;mov	ecx,	space
	;mov	edx,	1
	;int 80h
    mov esp,    ebp
    pop ebp
    ret

