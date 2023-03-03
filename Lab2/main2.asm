.586
.model flat, stdcall

option casemap :none

include module.inc
include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
include C:\masm32\include\user32.inc

includelib C:\masm32\lib\kernel32.lib
includelib C:\masm32\lib\user32.lib


.data
Caption1 db "35 8-bit", 0
TextBuf1 db 2 dup(?)
Value1 db 35

Caption2 db "-35 8-bit", 0
TextBuf2 db 2 dup(?)
Value2 db -35

Caption3 db "35 16-bit", 0
TextBuf3 db 4 dup(?)
Value3 dw 35

Caption4 db "-35 16-bit", 0
TextBuf4 db 4 dup(?)
Value4 dw -35

Caption5 db "35 32-bit", 0
TextBuf5 db 8 dup(?)
Value5 dd 35

Caption6 db "-35 32-bit", 0
TextBuf6 db 8 dup(?)
Value6 dd -35

Caption7 db "35 64-bit", 0
TextBuf7 db 16 dup(?)
Value7 dq 35

Caption8 db "-35 64-bit", 0
TextBuf8 db 16 dup(?)
Value8 dq -35

Caption9 db "35.0 32-bit", 0
TextBuf9 db 8 dup(?)
Value9 dd 35.0

Caption10 db "-70.0 32-bit", 0
TextBuf10 db 8 dup(?)
Value10 dd -70.0

Caption11 db "35.35 32-bit", 0
TextBuf11 db 8 dup(?)
Value11 dd 35.35

Caption12 db "35.0 64-bit", 0
TextBuf12 db 16 dup(?)
Value12 dq 35.0

Caption13 db "-70.0 64-bit", 0
TextBuf13 db 16 dup(?)
Value13 dq -70.0

Caption14 db "35.35 64-bit", 0
TextBuf14 db 16 dup(?)
Value14 dq 35.35

Caption15 db "35.0 80-bit", 0
TextBuf15 db 20 dup(?)
Value15 dt 35.0

Caption16 db "-70.0 80-bit", 0
TextBuf16 db 20 dup(?)
Value16 dt -70.0

Caption17 db "35.35 80-bit", 0
TextBuf17 db 20 dup(?)
Value17 dt 35.35

.code
start:
  push offset TextBuf1
  push offset Value1
  push 8
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf1, ADDR Caption1, MB_ICONINFORMATION

  push offset TextBuf2
  push offset Value2
  push 8
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf2, ADDR Caption2, MB_ICONINFORMATION

  push offset TextBuf3
  push offset Value3
  push 16
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf3, ADDR Caption3, MB_ICONINFORMATION

  push offset TextBuf4
  push offset Value4
  push 16
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf4, ADDR Caption4, MB_ICONINFORMATION

  push offset TextBuf5
  push offset Value5
  push 32
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf5, ADDR Caption5, MB_ICONINFORMATION

  push offset TextBuf6
  push offset Value6
  push 32
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf6, ADDR Caption6, MB_ICONINFORMATION

  push offset TextBuf7
  push offset Value7
  push 64
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf7, ADDR Caption7, MB_ICONINFORMATION

  push offset TextBuf8
  push offset Value8
  push 64
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf8, ADDR Caption8, MB_ICONINFORMATION

  push offset TextBuf9
  push offset Value9
  push 32
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf9, ADDR Caption9, MB_ICONINFORMATION

  push offset TextBuf10
  push offset Value10
  push 32
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf10, ADDR Caption10, MB_ICONINFORMATION

  push offset TextBuf11
  push offset Value11
  push 32
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf11, ADDR Caption11, MB_ICONINFORMATION

  push offset TextBuf12
  push offset Value12
  push 64
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf12, ADDR Caption12, MB_ICONINFORMATION

  push offset TextBuf13
  push offset Value13
  push 64
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf13, ADDR Caption13, MB_ICONINFORMATION

  push offset TextBuf14
  push offset Value14
  push 64
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf14, ADDR Caption14, MB_ICONINFORMATION

  push offset TextBuf15
  push offset Value15
  push 80
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf15, ADDR Caption15, MB_ICONINFORMATION

  push offset TextBuf16
  push offset Value16
  push 80
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf16, ADDR Caption16, MB_ICONINFORMATION

  push offset TextBuf17
  push offset Value17
  push 80
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf17, ADDR Caption17, MB_ICONINFORMATION

  invoke ExitProcess, 0
end start
