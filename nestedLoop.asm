; (Ch4_Textbook practice 4-7): Loop
; nestedLoop.asm
; example of a nested loop

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
count DWORD ?
total WORD ?

.code
main proc
; nested loop
	mov ax, 0		; initialize ax = 0
	mov ecx,100	; set outer loop count
L1:
	mov count,ecx	; save outer loop count
	mov ecx,20	; set inner loop count
L2:	
	inc ax
	loop L2		; repeat the inner loop
	
	mov ecx,count	; restore outer loop count
	loop L1		; repeat the outer loop

	mov total, ax

	invoke ExitProcess,0
main endp
end main