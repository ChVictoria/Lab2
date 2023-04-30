.586
.model flat, c
.code

;��������� Write1_LONGOP ������ 1 � � ���, ��������� � N-�� �������
;������ �������� - ������ �����
;������ �������� - N
;����� �������� - M


Write1_LONGOP proc
	push ebp
	mov ebp,esp
	mov esi, [ebp+16] ;������ �����
	mov ebx, [ebp+12] ;N
	mov edx, [ebp+8] ;M

	dec ebx ;����� ��� �� ������� ����� ������ �������
	mov ebp, ebx ;ebp = ������� ���
	cycle:
	    mov ebx, ebp
		mov ecx, ebx 
		shr ebx, 3 ;ebx = ����� �����
	
		and ecx, 07h ;ecx = ����
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