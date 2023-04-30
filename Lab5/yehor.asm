.586
.model flat, c
.data
index_right dd 0
index_left dd ?
reversed32 dd 0
var dd 22 dup(0)
.code

;��������� Reverse_LONGOP ������ ����� ����������
;������ �������� - ������ �����
;������ �������� - ���������� �����
;����� �������� - ������ ����������


Reverse_LONGOP proc
  push ebp
  mov ebp,esp
  mov esi, [ebp+16] ;������ �����
  mov edx [ebp+12];���������� �����
  mov edi, [ebp+8] ;������ ����������

  mov index_left, edx
  
  cycle:
      mov ebx, index_right
    mov ecx, ebx 
    shr ebx, 3 ;ebx = ����� �����
  
    and ecx, 07h ;ecx = ����
    mov al, 1
    shl al, cl
    or al, byte ptr [esi+ebx]
    mov byte ptr [var+ebx], al



    
    inc ebp
    dec edx

    inc index_right
    dec index_left
    jnz cycle

  pop ebp
  ret 12
  Write1_LONGOP endp



.586
.model flat, stdcall
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include module.inc
include longop.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

option casemap :none

.data
  reversed32 dd 0
  var dd 12345678h

.code
;32-� � var
 xor ebp, ebp ;ebp = ������� ���
 mov bl, 31
 xor edx, edx ;edx = �������� ���������
;reversed32 = ���������
 Reverse32 proc
 cycle:
  mov ecx, ebp 
  shr ebp, 3 ;ebp = ����� �����
  
  and ecx, 07h ;ecx = ����
  mov al, 1
  shl al, cl
  or byte ptr [var+ebp], al
  mov cl, bl
  shl edx, cl
  or reversed32, edx
  inc ebp
  sub bl, 2
  cmp bl, -1
  jne cycle
Reverse32 endp

main:
  mov eax, 12345678h 
  call Reverse32

invoke ExitProcess, 0
end main