;Programmer: Anna Felipe
;Programmer ID: 1506055

INCLUDE Irvine32.inc

.data
array DWORD 4BC94530h, 2CBA9429h, 4FB54386h, 69FC0544h, 5F5BE7ACh
prompt BYTE "Enter the number of bits shift to the left using SHLD: ", 0
count DWORD ?

.code
main PROC

	mov edx, OFFSET prompt
	call WriteString
	call ReadInt
	mov esi, OFFSET count
	call Crlf

	mov bl, al
	call ShiftDoublewords

; Display the results
	mov  esi,OFFSET array
	mov  ecx,LENGTHOF array
	mov  ebx,TYPE array
	call DumpMem

	Invoke ExitProcess, 0
main ENDP

ShiftDoublewords PROC

	mov  esi,OFFSET array
	mov  ecx,(LENGTHOF array) - 1

L1:	push ecx						; save loop counter
	mov  eax,[esi + TYPE DWORD]
	mov  CL,BL						; shift count
	shld [esi],eax,cl				; shift EAX into high bits of [esi]
	add  esi,TYPE DWORD				; point to next doubleword pair
	pop  ecx						; restore loop counter
	loop L1


	mov CL, BL
	shl DWORD PTR [esi], CL
	ret

ShiftDoublewords ENDP

END main

al, keyBuf[edi]
			xor buffer[esi], KEY  ; translate a byte
			inc esi				  ; point to next byte
			inc edi
		
	loop L1
	popad
	ret

DisplayMessage PROC		; Displays the encrypted or decrypted message.
							; Receives: EDX points to the message
							; Returns:  nothing

		pushad
		call WriteString
		mov edx, OFFSET buffer ; display the buffer
		call WriteString
		call Crlf
		call Crlf
		popad
		ret

DisplayMessage ENDP

END main