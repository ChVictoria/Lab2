.586
.model flat, c
.data
  res_count dd ?
  counter dd ?
  s_count dd ?

  divisor dw ?

 .code

Mul_416X32 proc
	push ebp
	mov ebp,esp

	mov edi, [ebp+12] ; EDI = адреса масиву
	mov esi, [ebp+8] ; ESI = 32-бітне число
	mov ecx, 14
	xor ebp, ebp
	xor ebx, ebx
	
	clc
	cycle:
	mov eax,  dword ptr[edi + ebp]
	mul esi
	mov dword ptr[edi + ebp], eax
	add dword ptr[edi + ebp], ebx
    mov ebx, edx
	add ebp, 4
	loop cycle

	pop ebp
	ret 8
Mul_416X32 endp

Div10 proc
	push ebp
	mov ebp,esp

	mov ebx, [ebp+20] ; EBX = адреса залишку від ділення
	mov edi, [ebp+16] ; EDI = адреса результату ділення
	mov ecx, [ebp+12] ; ECX = розрядність числа
	mov esi, [ebp+8] ; ESI = адреса числа

	mov res_count, ecx
	sub res_count, 4
	mov s_count, ecx
	sub s_count, 5

	sub ecx, 8
	mov ebp, ecx
	shr ebp, 3
	mov al, [esi+ebp]
	shr al, 4 ; AL = 4 біти числа

	cycle:
		cmp al, 10
		jl @zero
		call Write1
		sub al, 10
		jmp @goon
		@zero:
		call Write0
		@goon:
		dec res_count
		cmp res_count, 0
		jl @end
		shl al, 1
		call Read1bit
		dec s_count
		or al, dl
		jmp cycle
	@end:
	mov byte ptr[ebx], al
	pop ebp
	ret 16
Div10 endp

Write1 proc
	push ecx
	push eax
	mov eax, res_count
	mov counter, eax
	shr counter, 3
	
	mov ecx, res_count
	and ecx, 07h ;ecx = зсув
	
	mov ah, 1
	shl ah, cl
	mov ecx, counter
	or byte ptr [edi+ecx], ah
	pop eax
	pop ecx
	ret 
Write1 endp

Write0 proc
	push ecx
	push eax
	mov eax, res_count
	mov counter, eax
	shr counter, 3
	mov ecx, res_count
	and ecx, 07h ;ecx = зсув
	mov ah, 1
	shl ah, cl
	not ah
	mov ecx, counter
	and byte ptr [edi+ecx], ah
	pop eax
	pop ecx
	ret 
Write0 endp

Read1bit proc
	push ecx
	push eax
	mov eax, s_count
	mov counter, eax
	shr counter, 3
	mov ecx, s_count
	and ecx, 07h ;ecx = зсув
	xor edx, edx
	mov dl, 1
	shl dl, cl
	push ebx
	mov ebx, counter
	and dl, byte ptr[esi+ebx]
	shr dl, cl
	pop ebx
	pop eax
	pop ecx
	ret 
Read1bit endp




Div10_16bit proc
	push ebp
	mov ebp,esp

	mov ebx, [ebp+20] ; EBX = адреса залишку від ділення
	mov edi, [ebp+16] ; EDI = адреса результату ділення
	mov ecx, [ebp+12] ; ECX = розрядність числа
	mov esi, [ebp+8] ; ESI = адреса числа

	shr ecx, 3
	sub ecx, 2
	xor dx, dx
	mov divisor, 10

	@cycle1:
	mov ax, word ptr[esi+ecx]
	div divisor
	mov word ptr[edi+ecx], ax
	sub ecx, 2
	cmp ecx, 0
	jge @cycle1
	mov word ptr[ebx], dx

	pop ebp
	ret 16
Div10_16bit endp


End