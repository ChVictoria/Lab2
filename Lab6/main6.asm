.586
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc

include longop.inc
include module.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

.data
dividend dd 2 dup (0FFFFFFFFh)
res dd 2 dup (0)
zal dd 0
Caption db "Ділення на 10",0
TextBuf1 db 64 dup(0)

factorial dd 14 dup(0)
i dd 2
CaptionFact db "Факторіал = 80!",0
TextBufFact db 448 dup(0)

x dd -32768
m db 4
divisor dd 11
result dd ?
Caption2 db "Обчислення функції",0
TextBuf2 db 32 dup(0)

.code
main:
push offset zal
push offset res
push 64
push offset dividend
call Div10_16bit

push offset TextBuf1
push offset res
push 64
call StrDec
invoke MessageBoxA, 0, ADDR TextBuf1, ADDR Caption,0

mov [factorial], 1
@fact_cycle:
push offset factorial
push i
call Mul_416X32
inc i
cmp i, 81
jne @fact_cycle

push offset TextBufFact
push offset factorial
push 400
call StrDec
invoke MessageBoxA, 0, ADDR TextBufFact, ADDR CaptionFact,0

mov edx, 0FFFFFFFFh
mov eax, x
mov cl, m
sar eax, cl
idiv divisor
mov result, eax

push offset TextBuf2
push offset result
push 32
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf2, ADDR Caption2,0

invoke ExitProcess, 0
end main