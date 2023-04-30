.586
.model flat, stdcall
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include module.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

option casemap :none

.data
  initial dd 22 dup(48484848h)
  result dd 22 dup(0)
  reversed32 dd 0
  var dd 48484848h
  TB db 32 dup(0)
  CP db "Super Program!", 0
  counter dd 0
  pointer dd 0
  counter1 dd 0
  offset_init dd 0
  offset_result dd 0

.code

 Reverse32low proc
 push ebp
 mov ebp,esp
 mov esi, [ebp+8] ;адреса var
;32-б в var
 xor ebp, ebp ;ebp = позиція біту
 mov bl, 31
 xor edx, edx ;edx = проміжний результат
;reversed32 = результат
 mov counter, 0
 cycle:
  mov ecx, counter
 ;ecx = зсув
  mov eax, 1
  shl eax, cl
  mov edx, [esi+ebp]
  and edx, eax
  mov cl, bl
  shl edx, cl
  or reversed32, edx
  inc counter
  sub bl, 2
  cmp bl, -1
  jne cycle

 pop ebp
 ret 8
Reverse32low endp

Reverse32high proc
 push ebp
 mov ebp,esp
 mov esi, [ebp+8] ;адреса var
;32-б в var
 xor ebp, ebp ;ebp = позиція біту
 mov bl, 31
 xor edx, edx ;edx = проміжний результат
;reversed32 = результат
 mov counter, 31
 cycle:
  mov ecx, counter
 ;ecx = зсув
  mov eax, 1
  shl eax, cl
  mov edx, [esi+ebp]
  and edx, eax
  mov cl, bl
  shr edx, cl
  or reversed32, edx
  dec counter
  sub bl, 2
  cmp bl, -1
  jne cycle

 pop ebp
 ret 8
Reverse32high endp

main:
mov edi, 21
mov ebp, 0
mov offset_init, offset initial
mov offset_result, offset result
@lp:
  mov var, dword ptr[offset_init+ebp]
  mov reversed32, 0
  push offset var 
  call Reverse32low

  push offset var 
  call Reverse32high

  mov dword ptr[offset_result+edi], reversed32

  inc ebp
  dec edi
  cmp edi, -1
  jne @lp


  push offset TB
  push offset result
  push 704
  call StrHex_MY  


invoke MessageBox, 0, addr TB, addr CP, 0
invoke ExitProcess, 0
end main