.586
.model flat, stdcall

include C:\masm32\include\kernel32.inc
include C:\masm32\include\user32.inc

includelib C:\masm32\lib\kernel32.lib
includelib C:\masm32\lib\user32.lib

.data
Caption db "� �������� �� ��������", 0
Text db "Hello!", 10, 13, "������������ ³����� �������", 0

.code
main:
  invoke MessageBoxA, 0, ADDR Text, ADDR Caption, 0
  invoke ExitProcess, 0
end main