.586
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc

include module.inc
include longop.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib


.data
	var dd 32 dup(0)
	N dd 27
	M dd 100
	Caption db "Результат виконання операції", 0
	TextBuf db 1024 dup(0)
	CaptionErr db "Помилка", 0
	TextBufErr db "Індекс біту виходить за межі масиву", 0

.code
main:
	mov eax, N
	add eax, M
	cmp eax, 1025
	jle @next
	invoke MessageBoxA, 0, ADDR TextBufErr, ADDR CaptionErr,0
	jmp @end

	@next:
	push offset var
	push N
	push M
	call Write1_LONGOP

	push offset TextBuf
	push offset var
	push 1024
	call StrHex_MY

	
	invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption,0
	@end:
	invoke ExitProcess, 0
end main
