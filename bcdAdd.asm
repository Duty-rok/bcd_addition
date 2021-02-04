section .data
    len equ 2
    b   db  1,7
    c   db  4,5
section .bss
    summ    resb    3
section .text
global _start
extern  _print
extern _output_eol
_start:
   xor  ebx,    ebx
   xor  edx,    edx
   mov  ecx, len
.cikl:
    mov al, [b+ebx]
    adc al, [c+ebx]
    aaa
    mov [summ+ebx], al
    inc bx
    mov eax,    0
    loop    .cikl
    adc eax,    0
    mov byte [summ+ebx],    al
    ;adc byte [summ+ebx],    0
    xor ecx,    ecx
    mov ecx,    3
.cikl2:
    xor eax,    eax
    mov al, byte [summ+ebx]
    push    ecx
    push    ebx
    push    eax
    call    _print
    add esp,    4
    pop ebx
    pop ecx
    dec ebx
    loop    .cikl2
    call _output_eol
    mov eax,    1
    mov ebx,    0
    int 80h
