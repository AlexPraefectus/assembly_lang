SECTION .TEXT
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

        mov eax, 0
        call printCPUIDproc
        mov eax, 1
        call printCPUIDproc
        mov eax, 2
        call printCPUIDproc
        mov eax, 80000000h
	call printCPUIDproc
        mov eax, 80000001h
	call printCPUIDproc
        mov eax, 80000002h
	call printCPUIDproc
        mov eax, 80000003h
	call printCPUIDproc
        mov eax, 80000004h
	call printCPUIDproc
        mov eax, 80000005h
	call printCPUIDproc
        mov eax, 80000008h
	call printCPUIDproc

	; Terminate program
	mov eax,1            ; 'exit' system call
	mov ebx,0            ; exit with error code 0
	int 80h              ; call the kernel


SECTION .DATA, write
    hello: db `Здоровеньки Були! Корєнев Олександр, група ІВ-72\n`
    helloLen: equ $-hello
    lab: db `Лабораторна робота №2\n`
    labLen: equ $-lab
    message: dd 0, 0, 0, 0
    messageTail: db `\n`
