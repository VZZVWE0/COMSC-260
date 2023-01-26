.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode: DWORD

.data

valueA DWORD 1000
valueB DWORD 500
valueC DWORD 450
valueD DWORD 100
sum DWORD 0

sValueA DWORD -2000
sValueB DWORD 100
sValueC DWORD 1000
sValueD DWORD -500
ssum DWORD 0
	

.code 
main PROC

mov eax, valueA
mov ebx, valueB
mov ecx, valueC
mov edx, valueD

add eax, ebx
add ecx, edx
sub eax, ecx

	INVOKE ExitProcess,0

main ENDP
END main
