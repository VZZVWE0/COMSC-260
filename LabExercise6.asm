; Copying a String (CopyStr.asm)
; This program copies a string.

; Anna Felipe
; 1506055


.386
.model flat,stdcall

.stack 4096
ExitProcess PROTO, dwExitCode:dword

.data

.code
main proc

 mov AL, 7Bh
 add AL, 98h



	invoke ExitProcess,0
main endp
end main