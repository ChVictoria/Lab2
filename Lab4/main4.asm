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
factorial dd 14 dup(0)
i dd 2
CaptionFact db "‘актор≥ал = 80!",0
TextBufFact db 448 dup(0)

NXNtest dd 14 dup(11111111111111111111111111111111b)
NXNresult dd 28 dup(0)
CaptionNXNtest db " вадрат числа FFFF...FFFF",0
TextBufNXNtest db 896 dup(0)

sq_factorial dd 28 dup(0)
CaptionSqFact db " вадрат фактор≥алу = 80!*80!",0
TextBufSqFact db 896 dup(0)



NX32testA dd 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh, 0
NX32testB dd 0FFFFFFFFh
CaptionNX32test db "FFFFFFFF*FFFF...FFFF",0
TextBufNX32test db 448 dup(0)

NXNtestA dd 14 dup(55555555h)
NXNtestB dd  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80000000h
NXNresult1 dd 28 dup(0)
CaptionNXNtest1 db "55..5*80...01",0
TextBufNXNtest1 db 896 dup(0)

.code
main:

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
push 448
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBufFact, ADDR CaptionFact,0

push offset factorial
push offset factorial
push offset sq_factorial
call Mul_448X448

push offset NXNtest
push offset NXNtest
push offset NXNresult
call Mul_448X448

push offset TextBufNXNtest
push offset NXNresult
push 896
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBufNXNtest, ADDR CaptionNXNtest,0

push offset TextBufSqFact
push offset sq_factorial
push 896
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBufSqFact, ADDR CaptionSqFact,0



push offset NX32testA
push NX32testB
call Mul_416X32

push offset TextBufNX32test
push offset NX32testA
push 448
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBufNX32test, ADDR CaptionNX32test,0

push offset NXNtestA
push offset NXNtestB
push offset NXNresult1
call Mul_448X448

push offset TextBufNXNtest1
push offset NXNresult1
push 896
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBufNXNtest1, ADDR CaptionNXNtest1,0


invoke ExitProcess, 0
end main