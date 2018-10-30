TITLE Example code to read a string from user and display it in the console

INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
str1 BYTE "Enter identification string: ", 0
idStr BYTE 15 DUP(? )

.code
main proc

	mov edx, OFFSET str1
	call WriteString
	mov edx, OFFSET idStr
	mov ecx, (SIZEOF idStr) - 1
	call ReadString
	mov edx, OFFSET idStr
	call WriteString

	invoke ExitProcess,0
main endp
end main