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
.const

.data
Caption1 db "Перше додавання",0
Caption2 db "Друге додавання",0
Caption3 db "Перше віднімання",0
Caption4 db "Друге віднімання",0

TextBuf1 db 218 dup(?)
TextBuf2 db 216 dup(?)
TextBuf3 db 64 dup(?)
TextBuf4 db 64 dup(?)

A1 dd 80010001h, 80020001h, 80030001h, 80040001h, 80050001h, 80060001h, 80070001h, 80080001h, 80090001h, 800A0001h, 800B0001h, 800C0001h, 800D0001h, 800E0001h, 800F0001h, 80100001h, 80110001h, 80120001h, 80130001h, 80140001h, 80150001h, 80160001h, 80170001h, 80180001h, 80190001h, 801A0001h, 801B0001h
B1 dd 27 dup(80000003h)

A2 dd 27 dup(?)
B2 dd 27 dup(?)

A3 dd 8 dup(0)
B3A4 dd 25, 26, 27, 28, 29, 30, 31, 32

B4 dd 8 dup(00000001h)

R1 db 109 dup(?)
R2 dd 27 dup(?)
R3 dd 8 dup(?)
R4 dd 8 dup(?)

.code
main:
;перше додавання
push offset A1
push offset B1
push offset R1
call Add_864_LONGOP
push offset TextBuf1 
push offset R1
push 872
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf1, ADDR Caption1,0

;друге додавання
mov eax, 25
mov ecx, 27   ; ECX = потрібна кількість повторень
mov edx, 0
cycleAB2:	
mov DWord ptr[B2+4*edx], eax
mov DWord ptr[A2+4*edx], 80000003h
add eax, 1
inc edx
loop cycleAB2

push offset A2
push offset B2
push offset R2
call Add_864_LONGOP
push offset TextBuf2
push offset R2
push 864
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf2, ADDR Caption2, 0

;перше віднімання
push offset A3
push offset B3A4
push offset R3
call Sub_256_LONGOP
push offset TextBuf3
push offset R3
push 256
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf3, ADDR Caption3, 0

;друге віднімання
push offset B3A4
push offset B4
push offset R4
call Sub_256_LONGOP
push offset TextBuf4
push offset R4
push 256
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf4, ADDR Caption4, 0


invoke ExitProcess, 0
end main
