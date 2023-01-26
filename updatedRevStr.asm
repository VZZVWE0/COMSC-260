;updatedRevStr.asm
; updated from Reversing a String (RevStr.asm)
; This program reverses a string from the user's input
; print out the outupt on the console

;.386
;.model flat,stdcall
;.stack 4096
;ExitProcess proto,dwExitCode:dword
INCLUDE Irvine32.inc

.data
prompt BYTE "Please enter a string within 50-characters: ",0
buffer BYTE 51 DUP(0) ; input buffer
byteCount DWORD ? ; holds counter

.code
main proc

mov edx, OFFSET prompt		; call prompt
call WriteString			; prints propmt to console

call Crlf

; print the original string in the console

mov  edx, OFFSET buffer		; point to the bugge
mov  ecx, SIZEOF buffer		; specifiy max character
call ReadString				; input the string
mov byteCount, eax			; number of characters
call WriteString			; print string to console

call Crlf

; Push the name on the stack.

mov	 ecx,byteCount
mov	 esi, 0

L1:	movzx eax, buffer[esi]	; get character
	push eax				; push on stack
	inc	 esi
	loop L1

; Pop the name from the stack in reverse
; and store it in the aName array.

mov	 ecx, byteCount
mov	 esi, 0

L2:	pop  eax				; get character
	mov	 buffer[esi],al		; store in string
	inc	 esi
	loop L2

; print out the reversed string in the console

mov  edx, OFFSET buffer
call WriteString
call Crlf

	INVOKE ExitProcess,0
main ENDP
END main