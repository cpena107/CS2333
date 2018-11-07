; RevStr.asm prints any given string in reverse.
; Chapter 5 example

include irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	aName BYTE 'Hello World',0
	nameSize = ($ - aName) - 1

.code
main proc
	mov ecx,nameSize
	mov esi,0

L1:	movzx eax,aName[esi]	; get character
	push eax	; push on stack
	inc esi
	Loop L1

; Pop the name from the stack, in reverse,
; and store in the aName array.
	mov ecx,nameSize
	mov esi,0

L2:	pop eax	; get character
	mov aName[esi],al	; store in string
	inc esi
	Loop L2

; Display the name.
	mov edx,OFFSET aName
	call Writestring
	call Crlf


	invoke ExitProcess,0
main endp
end main