.386
.model flat, stdcall
.stack 4096
INCLUDE Irvine32.inc

.data


.code
main PROC
mov dx, 5000h
mov ax, 20h
mul dx
    
    invoke ExitProcess, 0

  main ENDP             
END main                                 