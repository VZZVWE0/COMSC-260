; Calculating a Factorial                   (Factorial.asm)

; This program uses recursion to calculate the
; factorial of an integer.

INCLUDE Irvine32.inc

.data

.code
main PROC

mov ax, 63h
mov bl, 10h
div bl
	
	exit
	main ENDP

END main