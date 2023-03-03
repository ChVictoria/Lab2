.586
.model flat, stdcall

include C:\masm32\include\kernel32.inc
include C:\masm32\include\user32.inc

includelib C:\masm32\lib\kernel32.lib
includelib C:\masm32\lib\user32.lib


.data

CaptionHello db "Я програма на асемблері", 0
TextHello db "Hello!", 13, 10, "Черноіваненко Вікторія Андріївна", 0

Vendor db 16 dup(0)
CaptionVendor db "CPUID 0 Vendor string",0

res dd 256 dup(0)
Text db 'EAX=xxxxxxxx',13,10,
		'EBX=xxxxxxxx',13,10,
		'ECX=xxxxxxxx',13,10,
		'EDX=xxxxxxxx',0
Caption0 db "Результат CPUID 0",0
Caption1 db "Результат CPUID 1",0
Caption2 db "Результат CPUID 2",0
Caption0h db "CPUID 80000000h",0
Caption1h db "CPUID 80000001h",0
Caption2h db "CPUID 80000002h",0
Caption3h db "CPUID 80000003h",0
Caption4h db "CPUID 80000004h",0
Caption5h db "CPUID 80000005h",0
Caption8h db "CPUID 80000008h",0


.code

DwordToStrHex proc
	push ebp
	mov ebp,esp
	mov ebx,[ebp+8]
	mov edx,[ebp+12]
	xor eax,eax
	mov edi,7
@next:
	mov al,dl
	and al,0Fh 
	add ax,48 
	cmp ax,58
	jl @store
	add ax,7 
@store:
	mov [ebx+edi],al
	shr edx,4
	dec edi
	cmp edi,0
	jge @next
	pop ebp
	ret 8
DwordToStrHex endp

HelpProc proc
  cpuid
  mov dword ptr[res], eax
  mov dword ptr[res+4], ebx
  mov dword ptr[res+8], ecx
  mov dword ptr[res+12], edx
  push [res] 
  push offset [Text+4] 
  call DwordToStrHex
  push [res+4] 
  push offset [Text+18]
  call DwordToStrHex
  push [res+8] 
  push offset [Text+32]
  call DwordToStrHex
  push [res+12] 
  push offset [Text+46]
  call DwordToStrHex
  ret
HelpProc endp

start:

  invoke MessageBoxA, 0, ADDR TextHello, ADDR CaptionHello, 0
  
  mov eax, 0
  cpuid 
  mov dword ptr[Vendor], ebx
  mov dword ptr[Vendor+4], edx
  mov dword ptr[Vendor+8], ecx

  invoke MessageBoxA, 0, ADDR Vendor, ADDR CaptionVendor, 0

  mov eax, 0
  call HelpProc
  
  invoke MessageBoxA, 0, ADDR Text, ADDR Caption0, 0

  mov eax, 1
  call HelpProc

  invoke MessageBoxA, 0, ADDR Text, ADDR Caption1, 0

  mov eax, 2
  call HelpProc

  invoke MessageBoxA, 0, ADDR Text, ADDR Caption2, 0

  mov eax, 80000000h
  call HelpProc

  invoke MessageBoxA, 0, ADDR Text, ADDR Caption0h, 0

  mov eax, 80000001h
  call HelpProc

  invoke MessageBoxA, 0, ADDR Text, ADDR Caption1h, 0

  mov eax, 80000002h
  call HelpProc

  invoke MessageBoxA, 0, ADDR Text, ADDR Caption2h, 0

  mov eax, 80000003h
  call HelpProc

  invoke MessageBoxA, 0, ADDR Text, ADDR Caption3h, 0

  mov eax, 80000004h
  call HelpProc

  invoke MessageBoxA, 0, ADDR Text, ADDR Caption4h, 0

  mov eax, 80000005h
  call HelpProc

  invoke MessageBoxA, 0, ADDR Text, ADDR Caption5h, 0

  mov eax, 80000008h
  call HelpProc

  invoke MessageBoxA, 0, ADDR Text, ADDR Caption8h, 0

  invoke ExitProcess, 0
end start