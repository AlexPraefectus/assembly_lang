SECTION .TEXT
    %include "src/module.asm"
    %include "src/bytestoBinaryString.asm"
    GLOBAL _start



_start:
        mov eax,4            ; 'write' system call = 4
	mov ebx,1            ; file descriptor 1 = STDOUT
	mov ecx,hello        ; string to write
	mov edx,helloLen     ; length of string to write
	int 80h              ; call the kernel


        mov eax, 4
        mov ebx, 1
        mov ecx, lab         ; Current lab number
        mov edx, labLen      ; string length
        int 80h
        

	push number1
        push 8
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+3], al
        push number1
        push 1
        push message + 4
        call bufferToBin
	mov al, `\n`
	mov [message+12], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 13
        int 80h



	push number2
        push 8
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+3], al
        push number2
        push 1
        push message + 4
        call bufferToBin
	mov al, `\n`
	mov [message+12], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 13
        int 80h


	push number3
        push 16
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+5], al
        push number3
        push 2
        push message + 6
        call bufferToBin
	mov al, `\n`
	mov [message+22], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 23
        int 80h


	push number4
        push 16
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+5], al
        push number4
        push 2
        push message + 6
        call bufferToBin
	mov al, `\n`
	mov [message+22], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 23
        int 80h


	push number5
        push 32
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+9], al
        push number5
        push 4
        push message + 10
        call bufferToBin
	mov al, `\n`
	mov [message+42], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 43
        int 80h

	push number6
        push 32
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+9], al
        push number6
        push 4
        push message + 10
        call bufferToBin
	mov al, `\n`
	mov [message+42], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 43
        int 80h

	push number7
        push 64
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+17], al
        push number7
        push 8
        push message + 18
        call bufferToBin
	mov al, `\n`
	mov [message+82], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 83
        int 80h


	push number8
        push 64
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+17], al
        push number8
        push 8
        push message + 18
        call bufferToBin
	mov al, `\n`
	mov [message+82], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 83
        int 80h


	push number9
        push 32
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+9], al
        push number9
        push 4
        push message + 10
        call bufferToBin
	mov al, `\n`
	mov [message+42], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 43
        int 80h
	

	push number10
        push 32
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+9], al
        push number10
        push 4
        push message + 10
        call bufferToBin
	mov al, `\n`
	mov [message+42], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 43
        int 80h


	push number11
        push 32
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+9], al
        push number11
        push 4
        push message + 10
        call bufferToBin
	mov al, `\n`
	mov [message+42], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 43
        int 80h


	push number12
        push 64
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+17], al
        push number12
        push 8
        push message + 18
        call bufferToBin
	mov al, `\n`
	mov [message+82], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 83
        int 80h


	push number13
        push 64
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+17], al
        push number13
        push 8
        push message + 18
        call bufferToBin
	mov al, `\n`
	mov [message+82], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 83
        int 80h


	push number14
        push 64
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+17], al
        push number14
        push 8
        push message + 18
        call bufferToBin
	mov al, `\n`
	mov [message+82], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 83
        int 80h


	push number15
        push 80
        push message + 1
        call bufferToHex
        mov al, `\t`
        mov [message+17], al
        push number15
        push 10
        push message + 22
        call bufferToBin
	mov al, `\n`
	mov [message+100], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 103
        int 80h


	push number16
        push 80
        push message + 1
        call bufferToHex
        mov al, `\n`
        mov [message+21], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 22
        int 80h


	push number17
        push 80
        push message + 1
        call bufferToHex
        mov al, `\n`
        mov [message+21], al
        mov eax, 4
        mov ebx, 1
        mov ecx, message + 1
        mov edx, 22
        int 80h



	; Terminate program
	mov eax,1            ; 'exit' system call
	mov ebx,0            ; exit with error code 0
	int 80h              ; call the kernel


SECTION .DATA, write
    hello: db `Здоровеньки Були! Корєнев Олександр, група ІВ-72\n`
    helloLen: equ $-hello
    lab: db `Лабораторна робота №3\n`
    labLen: equ $-lab
    number1: db 20
    number2: db -20
    number3: dw 20
    number4: dw -20
    number5: dd 20
    number6: dd -20
    number7: dq 20
    number8: dq -20

    number9: dd 20.0
    number10: dd -20.0
    number11: dd 20.20

    number12: dq 20.0
    number13: dq -20.0
    number14: dq 20.20

    number15: dt 20.0
    number16: dt -20.0
    number17: dt 20.20
    
    message: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    messageTail: db `\n`

SECTION .BSS, write
    messageBinary: resb 80
