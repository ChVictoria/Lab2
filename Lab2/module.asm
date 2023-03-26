.586
.model flat, c
.code
;��������� StrHex_MY ������ ����� ���������������� ����
;������ �������� - ������ ������ ���������� (����� �������)
;������ �������� - ������ �����
;����� �������� - ���������� ����� � ���� (�� ���� ������ 8)
StrHex_MY proc
	push ebp
	mov ebp,esp

	mov ecx, [ebp+8] ;������� ��� �����
	cmp ecx, 0
	jle @exitp
	shr ecx, 3 ;������� ����� �����
	mov esi, [ebp+12] ;������ �����
	mov ebx, [ebp+16] ;������ ������ ����������
@cycle:
	mov dl, byte ptr[esi+ecx-1] ;���� ����� - �� �� hex-�����
	
	mov al, dl
	shr al, 4 ;������ �����
	call HexSymbol_MY
	mov byte ptr[ebx], al
	
	mov al, dl ;������� �����
	call HexSymbol_MY
	mov byte ptr[ebx+1], al
	
	mov eax, ecx
	cmp eax, 4
	jle @next
	dec eax
	and eax, 3 ;������� ������� ����� �� ��� ����
	cmp al, 0
	jne @next
	mov byte ptr[ebx+2], 32 ;��� ������� �������
	inc ebx

@next:
	add ebx, 2
	dec ecx
	jnz @cycle
	mov byte ptr[ebx], 0 ;����� ���������� �����
@exitp:
	pop ebp
	ret 12
StrHex_MY endp

;�� ��������� �������� ��� hex-�����
;�������� - �������� AL
;��������� -> AL
HexSymbol_MY proc
	and al, 0Fh
	add al, 48 ;��� ����� ����� ��� ���� 0-9
	cmp al, 58
	jl @exitp
	add al, 7 ;��� ���� A,B,C,D,E,F
@exitp:
	ret
HexSymbol_MY endp

;��������� StrBin ������ ����� ��������� ����
;������ �������� - ������ ������ ���������� (����� �������)
;������ �������� - ������ �����
;����� �������� - ���������� ����� � ����
StrBin proc
	push ebp
	mov ebp,esp

	mov ecx, [ebp+8] ;������� ��� �����
	mov edi, ecx
	cmp ecx, 0
	jle @exitp
	shr ecx, 3
	mov esi, [ebp+12] ;������ �����
	mov ebx, [ebp+16] ;������ ������ ����������
@cycle:
	mov dl, byte ptr[esi+ecx-1]

	mov al, dl
	shr al, 7
	call BinSym
	mov byte ptr[ebx], al

	mov al, dl
	shr al, 6
	call BinSym
	mov byte ptr[ebx+1], al

	mov al, dl
	shr al, 5
	call BinSym
	mov byte ptr[ebx+2], al

	mov al, dl
	shr al, 4
	call BinSym
	mov byte ptr[ebx+3], al

	mov al, dl
	shr al, 3
	call BinSym
	mov byte ptr[ebx+4], al

	mov al, dl
	shr al, 2
	call BinSym
	mov byte ptr[ebx+5], al

	mov al, dl
	shr al, 1
	call BinSym
	mov byte ptr[ebx+6], al

	mov al, dl
	call BinSym
	mov byte ptr[ebx+7], al

	add ebx, 8
	dec ecx
	jnz @cycle
	mov byte ptr[ebx+8], 0 ;����� ���������� �����
	
@exitp:
	pop ebp
	ret 12
StrBin endp

BinSym proc
	and al, 01h
	add al, 48
	ret
BinSym endp

end