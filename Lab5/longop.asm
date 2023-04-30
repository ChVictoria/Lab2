.586
.model flat, c
.code

;процедура Write1_LONGOP записує 1 у М бітів, починаючи з N-го розряду
;перший параметр - адреса числа
;другий параметр - N
;третій параметр - M


Write1_LONGOP proc
	push ebp
	mov ebp,esp
	mov esi, [ebp+16] ;адреса числа
	mov ebx, [ebp+12] ;N
	mov edx, [ebp+8] ;M

	dec ebx ;номер біту на одиницю менше номера розряду
	mov ebp, ebx ;ebp = позиція біту
	cycle:
	    mov ebx, ebp
		mov ecx, ebx 
		shr ebx, 3 ;ebx = номер байту
	
		and ecx, 07h ;ecx = зсув
		mov al, 1
		shl al, cl
		or byte ptr [esi+ebx], al
		inc ebp
		dec edx
		jnz cycle

	pop ebp
	ret 12
	Write1_LONGOP endp

End