%include 'in_out.asm'

section .data
    msgX db "x = ",0h
    msgA db "a = ",0h

section .bss
    x resb 10
    a resb 10
    f resb 10

section .text
global _start

_start:
    ; ---------- Ввод 'X'
    mov eax, msgX
    call sprint
    mov ecx, x
    mov edx,10
    call sread

    ; ---------- Ввод 'A'
    mov eax, msgA
    call sprint
    mov ecx, a
    mov edx,10
    call sread

    ; ---------- Преобразование 'x' из символа в число
    mov eax, x
    call atoi
    mov [x], eax

    ; ---------- Преобразование 'a' из символа в число
    mov eax, a
    call atoi
    mov [a], eax


    mov ecx, [x]
    cmp ecx, [a]

    jge func

    mov eax, 5
    jmp fin

func:
    mov eax, [x]
    mov ecx, [a]
    sub eax, ecx

fin:
    call iprintLF 
    call quit


