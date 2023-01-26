
INCLUDE Irvine32.inc

SetColor PROTO forecolor:BYTE, backcolor: BYTE
WriteColorChar PROTO forecolor:BYTE, backcolor:BYTE, char:BYTE
PrintRowOdd PROTO color:BYTE
PrintRowEven PROTO color:BYTE

.data

prompt BYTE "Programmer: Anna Felipe", 0
prompt2 BYTE "Programmer ID: 1506055", 0

rows = 8
columns = 8

.code
main PROC

mov edx, OFFSET prompt
call WriteString
call Crlf
mov edx, OFFSET prompt2
call WriteString
call Crlf

    mov ecx, rows / 2
    
    L1:
        INVOKE PrintRowOdd, white        
        call Crlf

        INVOKE PrintRowEven, white
        call Crlf
        loop L1

     INVOKE ExitProcess, 0

    main ENDP

PrintRowOdd PROC uses ecx, color:BYTE
    mov ecx, columns / 2
L1:
    INVOKE WriteColorChar, ' ', color, color
    INVOKE WriteColorChar, ' ', color, color
    INVOKE WriteColorChar, ' ', white, white
    INVOKE WriteColorChar, ' ', white, white
    loop L1

    ret
PrintRowOdd ENDP

PrintRowEven PROC uses ecx, color:BYTE
    mov ecx, columns / 2
L1:
    INVOKE WriteColorChar, ' ', white, white
    INVOKE WriteColorChar, ' ', white, white
    INVOKE WriteColorChar, ' ', color, color
    INVOKE WriteColorChar, ' ', color, color
    loop L1

    ret
PrintRowEven ENDP

WriteColorChar PROC USES eax, char:BYTE, forecolor:BYTE, backcolor:BYTE 
    INVOKE SetColor, forecolor, backcolor
    mov al, char
    call WriteChar

    ret
WriteColorChar ENDP

SetColor PROC, forecolor:BYTE, backcolor:BYTE
    movzx eax, backcolor
    shl eax, 4
    or al, forecolor
    call SetTextColor      
    ret
SetColor ENDP
END MAIN

