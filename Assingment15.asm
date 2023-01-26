INCLUDE Irvine32.inc

Str_find PROTO, pTarget: PTR BYTE, pSource: PTR BYTE

.data
prompt1 BYTE "The target string is: 01ABAAAAAABABCC45ABC9012", 0
prompt2 BYTE "The source string is: AAABA", 0

target BYTE "01ABAAAAAABABCC45ABC9012", 0
source BYTE "AAABA", 0
pos DWORD ?

str1 BYTE "Sourch string found at position: ", 0
str2 BYTE " in Target string (counting from zero).", 0Ah, 0Ah, 0Dh, 0
str3 BYTE "Unable to find Source string in Target String.", 0Ah, 0Ah, 0Dh, 0

stop DWORD ?
lengthTarget DWORD ?
lengthSource DWORD ?

.code
main PROC

	mov edx, OFFSET prompt1
	call WriteString
	call Crlf
	
	mov edx, OFFSET prompt2
	call WriteString
	call Crlf
	call Crlf

	INVOKE Str_find, ADDR target, ADDR source
	mov pos, eax
	jz found

	found:
		mov edx, OFFSET str1
		call WriteString
		mov eax, pos
		call WriteDec
		
		mov edx, OFFSET str2
		call WriteString
		call ReadInt

	quit:
		INVOKE ExitProcess, 0

	main ENDP

Str_find PROC, pTarget: PTR BYTE, pSource: PTR BYTE

	INVOKE Str_length, pTarget
	mov lengthTarget, eax

	INVOKE Str_length, pSource
	mov lengthSource, eax

	mov edi, OFFSET target
	mov esi, OFFSET source

	mov eax, edi
	add eax, lengthTarget
	sub eax, lengthSource
	inc eax
	mov stop, eax

	cld
	mov ecx, lengthSource

	L1:
		pushad 
		repe cmpsb
		popad
		je found

		inc edi
		cmp edi, stop
		jmp L1


	found:
		mov eax, edi
		sub eax, pTarget
		cmp eax, eax

	done:
		ret

Str_find ENDP
	END main
			

