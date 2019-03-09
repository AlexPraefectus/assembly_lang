SECTION .TEXT
    %include "src/module.asm"
    GLOBAL _start
    GLOBAL printCPUIDproc

printCPUIDproc:
        mov r8d,'    '
        mov [message], r8d
        mov [message+4], r8d
        mov [message+8], r8d
        mov [message+12], r8d
        CPUID
        mov [message], eax
        mov [message+4], ebx
        mov [message+8], edx
        mov [message+12], ecx
        mov eax, 4
        mov ebx, 1
        mov ecx, message
        mov edx, 18
        int 80h
        ret

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
        
        mov r9b, [number1]
        and r9b, 080h
        jnz printMinus1
        mov al, `+`
        jmp continue1
    printMinus1:
        mov al, '-'        
    continue1:
        mov [message], al
        mov r9b, [number1]
        and r9b, 07Fh
        mov [number1], r9b
	push number1
        push 8
        push message + 1
        call bufferToHex

        mov al, `\n`
        mov [message+3], al

        mov eax, 4
        mov ebx, 1
        mov ecx, message
        mov edx, 4
        int 80h


        mov r9b, [number2]
        and r9b, 080h
        jnz printMinus2
        mov al, `+`
        jmp continue2
    printMinus2:
        mov al, '-'        
    continue2:
        mov [message], al
        mov r9b, [number2]
        and r9b, 07Fh
        mov [number2], r9b
	push number2
        push 8
        push message + 1
        call bufferToHex

        mov al, `\n`
        mov [message+3], al

        mov eax, 4
        mov ebx, 1
        mov ecx, message
        mov edx, 4
        int 80h



        mov r9b, [number3]
        and r9b, 080h
        jnz printMinus3
        mov al, `+`
        jmp continue3
    printMinus3:
        mov al, '-'        
    continue3:
        mov [message], al
        mov r9b, [number3]
        and r9b, 07Fh
        mov [number3], r9b
	push number3
        push 8
        push message + 1
        call bufferToHex

        mov al, `\n`
        mov [message+5], al

        mov eax, 4
        mov ebx, 1
        mov ecx, message
        mov edx, 6
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
    message: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    messageTail: db `\n`

SECTION .BSS, write
    messageBinary: resb 80
