.586
.model flat, c
.data
  counter1 dd ?
  counter2 dd ?
  carryflag db 0
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

Mul_448X448 proc
	push ebp
	mov ebp,esp

	mov esi, [ebp+16] ; ESI = адреса A
	mov ebx, [ebp+12] ; EBX = адреса B
	mov edi, [ebp+8] ; EDI = адреса результату

	
	mov counter1, 14
	xor ecx, ecx
	clc

	@cycle1:
	xor ebp, ebp
	mov counter2, 14
		@cycle2:
			mov eax,  dword ptr[esi + ebp]
			mul dword ptr[ebx + ecx]
			add ebp, ecx
			add dword ptr[edi + ebp], eax
			adc dword ptr[edi + ebp + 4], edx

			jnc @notcf
			xor eax, eax
			mov eax, ebp
			@cf:
			add eax, 4
			add dword ptr[edi + eax + 4], 1
			jc @cf

			@notcf:
			sub ebp, ecx
			add ebp, 4
			dec counter2
			jnz @cycle2
		add ecx, 4
		dec counter1
		jnz @cycle1

	pop ebp
	ret 12
Mul_448X448 endp
End