%include 'in_out.asm'
SECTION .data
msg: DB 'Введите x: ',0
result: DB 'f(g(x))=',0
SECTION .bss
x: RESB 80
res: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax,x
call atoi
call _subcalcul
call _calcul ; Вызов подпрограммы _calcul
mov eax,result
call sprint
mov eax,[res]
call iprintLF
call quit
_calcul:
mov eax,[res]
push ebx
mov ebx,2
mul ebx
add eax, 7
mov [res],eax
pop ebx
ret
_subcalcul:
push ebx
mov ebx, 3
mul ebx
sub eax, 1
mov [res],eax
pop ebx
ret
