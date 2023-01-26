;Programmer: Anna Felipe
;Programmer ID: 1506055

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data 

Array DWORD 100, 200, 300, 400, 500 , 600, 700, 800, 900, 1000

.code
main PROC

mov esi, OFFSET Array
mov edi, OFFSET Array
add edi, SIZEOF Array
sub edi, TYPE Array

mov ecx, LENGTHOF Array/2

L1:
	mov eax, [esi]
	mov ebx, [edi]
	mov [edi], eax
	mov [esi], ebx

	add esi, TYPE Array
	sub edi, TYPE Array

	loop L1

mov ecx, LENGTHOF Array/2

L2:	
	
	mov ebx, [esi]
	mov eax, [edi]
	mov [edi], ebx
	mov [esi], eax

	add esi, TYPE Array
	sub edi, TYPE Array
	
	loop L2

INVOKE ExitProcess, 0
main ENDP
END main
