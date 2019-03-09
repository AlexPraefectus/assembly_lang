SECTION .TEXT
    %include "src/module.asm"
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



        mov r9b, [number3 + 1]
        and r9b, 080h
        jnz printMinus3
        mov al, `+`
        jmp continue3
    printMinus3:
        mov al, '-'        
    continue3:
        mov [message], al
        mov r9b, [number3 + 1]
        and r9b, 07Fh
        mov [number3 + 1], r9b
	push number3
        push 16
        push message + 1
        call bufferToHex

        mov al, `\n`
        mov [message+5], al

        mov eax, 4
        mov ebx, 1
        mov ecx, message
        mov edx, 6
        int 80h


        mov r9b, [number4 + 1]
        and r9b, 080h
        jnz printMinus4
        mov al, `+`
        jmp continue4
    printMinus4:
        mov al, '-'        
    continue4:
        mov [message], al
        mov r9b, [number4 + 1]
        and r9b, 07Fh
        mov [number4 + 1], r9b
	push number4
        push 16
        push message + 1
        call bufferToHex

        mov al, `\n`
        mov [message+5], al

        mov eax, 4
        mov ebx, 1
        mov ecx, message
        mov edx, 6
        int 80h



        mov r9b, [number5 + 3]
        and r9b, 080h
        jnz printMinus5
        mov al, `+`
        jmp continue5
    printMinus5:
        mov al, '-'        
    continue5:
        mov [message], al
        mov r9b, [number5 + 3]
        and r9b, 07Fh
        mov [number5 + 3], r9b
	push number5
        push 32
        push message + 1
        call bufferToHex

        mov al, `\n`
        mov [message+9], al

        mov eax, 4
        mov ebx, 1
        mov ecx, message
        mov edx, 10
        int 80h



        mov r9b, [number6 + 3]
        and r9b, 080h
        jnz printMinus6
        mov al, `+`
        jmp continue6
    printMinus6:
        mov al, '-'        
    continue6:
        mov [message], al
        mov r9b, [number6 + 3]
        and r9b, 07Fh
        mov [number6 + 3], r9b
	push number6
        push 32
        push message + 1
        call bufferToHex

        mov al, `\n`
        mov [message+9], al

        mov eax, 4
        mov ebx, 1
        mov ecx, message
        mov edx, 10
        int 80h


        mov r9b, [number7 + 7]
        and r9b, 080h
        jnz printMinus7
        mov al, `+`
        jmp continue7
    printMinus7:
        mov al, '-'        
    continue7:
        mov [message], al
        mov r9b, [number7 + 7]
        and r9b, 07Fh
        mov [number7 + 7], r9b
	push number7
        push 64
        push message + 1
        call bufferToHex

        mov al, `\n`
        mov [message+17], al

        mov eax, 4
        mov ebx, 1
        mov ecx, message
        mov edx, 18
        int 80h


        mov r9b, [number8 + 7]
        and r9b, 080h
        jnz printMinus8
        mov al, `+`
        jmp continue8
    printMinus8:
        mov al, '-'        
    continue8:
        mov [message], al
        mov r9b, [number8 + 7]
        and r9b, 07Fh
        mov [number8 + 7], r9b
	push number8
        push 64
        push message + 1
        call bufferToHex

        mov al, `\n`
        mov [message+17], al

        mov eax, 4
        mov ebx, 1
        mov ecx, message
        mov edx, 18
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
    number7: dd 20, 0
    number8: dd 0FFFFFFECh, 0FFFFFFFFh 
    message: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    messageTail: db `\n`

SECTION .BSS, write
    messageBinary: resb 80
