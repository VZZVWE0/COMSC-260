.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


INCLUDE Irvine32.inc

.data

bArray BYTE 100 dup (0)
ptrArray DWORD bArray

.code
main PROC
        
        call Randomize
        mov eax, 100
        call RandomRange
        
        mov ecx, 20
        L1:
            call CreateRandomString
        LOOP L1
        call WaitMsg

        invoke ExitProcess, 0
main ENDP

    CreateRandomString PROC USES ecx  
        mov ecx, eax

        L2:
            mov eax, 26
            call RandomRange
            add eax, 65
            mov esi, OFFSET bArray
            call WriteChar
            
        LOOP L2      
        call Crlf
        ret
    CreateRandomString ENDP

END main