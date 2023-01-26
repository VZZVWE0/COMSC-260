; Programmer: Anna Felipe
; Programmer ID: 1506055

.386
.model flat, stdcall
.stack 4096

ExitProcess proto,wExitCode:word

.data

;Part 1

intA WORD 100
intB SWORD -100

;Part 2

arrayD WORD 1,2,3,4

.code
main proc

;Part 1

movzx EBX, intA
movsx EDX, intB


;Part 2

mov ax, arrayD
xchg ax, [arrayD+6]
xchg ax, arrayD
mov ax, [arrayD+2]
xchg ax, [arrayD+4]
mov [arrayD+2], ax

	invoke ExitProcess, 0

main ENDP
END main
