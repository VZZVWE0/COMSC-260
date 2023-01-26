; Demonstrate reference parameters   (ArrayFill.asm)
; This program fills an array with 32-bit randomly generated integers.
INCLUDE Irvine32.inc

.data
count = 25
array DWORD count DUP(?)
prompt BYTE "===The output form ArrayFill3===", 0

.code
main PROC

mov edx, OFFSET prompt
call WriteString
call Crlf

push OFFSET array
push COUNT
call ArrayFill
mov ECX, count
mov ESI, 0

L1:

    mov eax, array[ESI]
    call WriteInt
    call CRLF
    add ESI, type array

    loop L1

    exit
    main ENDP

ArrayFill PROC

LOCAL array:DWORD
mov eax, array
pushad                       ; save registers
mov esi, [ebp+12]            ; offset of array
mov ecx, [ebp+8]             ; array size

cmp ecx, 0                   ; ECX == 0?
je L2                        ; yes: skip over loop
    
L1:
    mov eax, 300                 ; get random 0 - FFFFh
    call RandomRange             ; from the link library
    sub eax, 100
    mov [esi], EAX
    add esi ,TYPE DWORD

    loop L1

L2: 
    popad                       ; restore registers
    pop ebp  
    leave
    ret 8                      ; clean up the stack

    ArrayFill ENDP

END main
