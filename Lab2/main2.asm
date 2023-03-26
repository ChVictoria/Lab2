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

Caption1a db "35 8-bit bin", 0
TextBuf1a db 64 dup(?)
Value1a db 35

Caption2 db "-35 8-bit", 0
TextBuf2 db 2 dup(?)
Value2 db -35

Caption2a db "-35 8-bit bin", 0
TextBuf2a db 64 dup(?)
Value2a db -35

Caption3 db "35 16-bit", 0
TextBuf3 db 4 dup(?)
Value3 dw 35

Caption3a db "35 16-bit bin", 0
TextBuf3a db 64 dup(?)
Value3a dw 35

Caption4 db "-35 16-bit", 0
TextBuf4 db 4 dup(?)
Value4 dw -35

Caption4a db "-35 16-bit bin", 0
TextBuf4a db 64 dup(?)
Value4a dw -35

Caption5 db "35 32-bit", 0
TextBuf5 db 8 dup(?)
Value5 dd 35

Caption5a db "35 32-bit bin", 0
TextBuf5a db 64 dup(?)
Value5a dd 35

Caption6 db "-35 32-bit", 0
TextBuf6 db 8 dup(?)
Value6 dd -35

Caption6a db "-35 32-bit bin", 0
TextBuf6a db 64 dup(?)
Value6a dd -35

Caption7 db "35 64-bit", 0
TextBuf7 db 16 dup(?)
Value7 dq 35

Caption7a db "35 64-bit bin", 0
TextBuf7a db 70 dup(?)
Value7a dq 35

Caption8 db "-35 64-bit", 0
TextBuf8 db 16 dup(?)
Value8 dq -35

Caption8a db "-35 64-bit bin", 0
TextBuf8a db 70 dup(?)
Value8a dq -35

Caption9 db "35.0 32-bit", 0
TextBuf9 db 8 dup(?)
Value9 dd 35.0

Caption9a db "35.0 32-bit bin", 0
TextBuf9a db 64 dup(?)
Value9a dd 35.0

Caption10 db "-70.0 32-bit", 0
TextBuf10 db 8 dup(?)
Value10 dd -70.0

Caption10a db "-70.0 32-bit bin", 0
TextBuf10a db 64 dup(?)
Value10a dd -70.0

Caption11 db "35.35 32-bit", 0
TextBuf11 db 8 dup(?)
Value11 dd 35.35

Caption11a db "35.35 32-bit bin", 0
TextBuf11a db 64 dup(?)
Value11a dd 35.35

Caption12 db "35.0 64-bit", 0
TextBuf12 db 16 dup(?)
Value12 dq 35.0

Caption12a db "35.0 64-bit bin", 0
TextBuf12a db 80 dup(?)
Value12a dq 35.0

Caption13 db "-70.0 64-bit", 0
TextBuf13 db 16 dup(?)
Value13 dq -70.0

Caption13a db "-70.0 64-bit bin", 0
TextBuf13a db 80 dup(?)
Value13a dq -70.0

Caption14 db "35.35 64-bit", 0
TextBuf14 db 16 dup(?)
Value14 dq 35.35

Caption14a db "35.35 64-bit bin", 0
TextBuf14a db 80 dup(?)
Value14a dq 35.35

Caption15 db "35.0 80-bit", 0
TextBuf15 db 20 dup(?)
Value15 dt 35.0

Caption15a db "35.0 80-bit bin", 0
TextBuf15a db 90 dup(?)
Value15a dt 35.0

Caption16 db "-70.0 80-bit", 0
TextBuf16 db 20 dup(?)
Value16 dt -70.0

Caption16a db "-70.0 80-bit bin", 0
TextBuf16a db 90 dup(?)
Value16a dt -70.0

Caption17 db "35.35 80-bit", 0
TextBuf17 db 20 dup(?)
Value17 dt 35.35

Caption17a db "35.35 80-bit bin", 0
TextBuf17a db 90 dup(?)
Value17a dt 35.35

.code
start:
  push offset TextBuf1
  push offset Value1
  push 8
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf1, ADDR Caption1, MB_ICONINFORMATION

  push offset TextBuf1a
  push offset Value1a
  push 8
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf1a, ADDR Caption1a, MB_ICONINFORMATION

  push offset TextBuf2
  push offset Value2
  push 8
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf2, ADDR Caption2, MB_ICONINFORMATION

  push offset TextBuf2a
  push offset Value2a
  push 8
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf2a, ADDR Caption2a, MB_ICONINFORMATION

  push offset TextBuf3
  push offset Value3
  push 16
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf3, ADDR Caption3, MB_ICONINFORMATION

  push offset TextBuf3a
  push offset Value3a
  push 16
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf3a, ADDR Caption3a, MB_ICONINFORMATION

  push offset TextBuf4
  push offset Value4
  push 16
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf4, ADDR Caption4, MB_ICONINFORMATION

  push offset TextBuf4a
  push offset Value4a
  push 16
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf4a, ADDR Caption4a, MB_ICONINFORMATION

  push offset TextBuf5
  push offset Value5
  push 32
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf5, ADDR Caption5, MB_ICONINFORMATION

  push offset TextBuf5a
  push offset Value5a
  push 32
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf5a, ADDR Caption5a, MB_ICONINFORMATION

  push offset TextBuf6
  push offset Value6
  push 32
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf6, ADDR Caption6, MB_ICONINFORMATION

  push offset TextBuf6a
  push offset Value6a
  push 32
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf6a, ADDR Caption6a, MB_ICONINFORMATION

  push offset TextBuf7
  push offset Value7
  push 64
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf7, ADDR Caption7, MB_ICONINFORMATION

  push offset TextBuf7a
  push offset Value7a
  push 64
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf7a, ADDR Caption7a, MB_ICONINFORMATION

  push offset TextBuf8
  push offset Value8
  push 64
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf8, ADDR Caption8, MB_ICONINFORMATION

  push offset TextBuf8a
  push offset Value8a
  push 64
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf8a, ADDR Caption8a, MB_ICONINFORMATION

  push offset TextBuf9
  push offset Value9
  push 32
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf9, ADDR Caption9, MB_ICONINFORMATION

  push offset TextBuf9a
  push offset Value9a
  push 32
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf9a, ADDR Caption9a, MB_ICONINFORMATION

  push offset TextBuf10
  push offset Value10
  push 32
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf10, ADDR Caption10, MB_ICONINFORMATION

  push offset TextBuf10a
  push offset Value10a
  push 32
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf10a, ADDR Caption10a, MB_ICONINFORMATION

  push offset TextBuf11
  push offset Value11
  push 32
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf11, ADDR Caption11, MB_ICONINFORMATION

  push offset TextBuf11a
  push offset Value11a
  push 32
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf11a, ADDR Caption11a, MB_ICONINFORMATION

  push offset TextBuf12
  push offset Value12
  push 64
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf12, ADDR Caption12, MB_ICONINFORMATION

  push offset TextBuf12a
  push offset Value12a
  push 64
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf12a, ADDR Caption12a, MB_ICONINFORMATION

  push offset TextBuf13
  push offset Value13
  push 64
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf13, ADDR Caption13, MB_ICONINFORMATION

  push offset TextBuf13a
  push offset Value13a
  push 64
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf13a, ADDR Caption13a, MB_ICONINFORMATION

  push offset TextBuf14
  push offset Value14
  push 64
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf14, ADDR Caption14, MB_ICONINFORMATION

  push offset TextBuf14a
  push offset Value14a
  push 64
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf14a, ADDR Caption14a, MB_ICONINFORMATION

  push offset TextBuf15
  push offset Value15
  push 80
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf15, ADDR Caption15, MB_ICONINFORMATION

  push offset TextBuf15a
  push offset Value15a
  push 80
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf15a, ADDR Caption15a, MB_ICONINFORMATION

  push offset TextBuf16
  push offset Value16
  push 80
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf16, ADDR Caption16, MB_ICONINFORMATION

  push offset TextBuf16a
  push offset Value16a
  push 80
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf16a, ADDR Caption16a, MB_ICONINFORMATION

  push offset TextBuf17
  push offset Value17
  push 80
  call StrHex_MY
  invoke MessageBoxA, 0, ADDR TextBuf17, ADDR Caption17, MB_ICONINFORMATION

  push offset TextBuf17a
  push offset Value17a
  push 80
  call StrBin
  invoke MessageBoxA, 0, ADDR TextBuf17a, ADDR Caption17a, MB_ICONINFORMATION

  invoke ExitProcess, 0
end start
