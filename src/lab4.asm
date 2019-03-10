SECTION .TEXT
    %include "src/module.asm"
    %include "src/longAddProc.asm"
    %include "src/longSubProc.asm"
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
  ;############
  ;############
  ;############
  push left_operand_adding1
  push 384
  push output_buffer + 2
  call bufferToHex
  mov ax, '00'
  mov [output_buffer], ax
  mov al, `\n`
  mov [output_buffer + 98], al

  mov eax, 4
  mov ebx, 1
  mov ecx, output_buffer
  mov edx, 99
  int 80h


  push right_operand_adding1
  push 384
  push output_buffer + 2
  call bufferToHex
  mov ax, '00'
  mov [output_buffer], ax
  mov al, `\n`
  mov [output_buffer + 98], al

  mov eax, 4
  mov ebx, 1
  mov ecx, output_buffer
  mov edx, 99
  int 80h


  push left_operand_adding1
  push right_operand_adding1
  push result_adding
  call longAddProc
  push result_adding
  push 392
  push output_buffer
  call bufferToHex
  mov al, `\n`
  mov [output_buffer + 98], al

  mov eax, 4
  mov ebx, 1
  mov ecx, output_buffer
  mov edx, 99
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, output_buffer + 98
  mov edx, 1
  int 80h
  ;############
  ;############
  ;############


  push left_operand_adding2
  push 384
  push output_buffer + 2
  call bufferToHex
  mov ax, '00'
  mov [output_buffer], ax
  mov al, `\n`
  mov [output_buffer + 98], al

  mov eax, 4
  mov ebx, 1
  mov ecx, output_buffer
  mov edx, 99
  int 80h


  push right_operand_adding2
  push 384
  push output_buffer + 2
  call bufferToHex
  mov ax, '00'
  mov [output_buffer], ax
  mov al, `\n`
  mov [output_buffer + 98], al

  mov eax, 4
  mov ebx, 1
  mov ecx, output_buffer
  mov edx, 99
  int 80h


  push left_operand_adding2
  push right_operand_adding2
  push result_adding
  call longAddProc
  push result_adding
  push 392
  push output_buffer
  call bufferToHex
  mov al, `\n`
  mov [output_buffer + 98], al

  mov eax, 4
  mov ebx, 1
  mov ecx, output_buffer
  mov edx, 99
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, output_buffer + 98
  mov edx, 1
  int 80h


  ;############
  ;############
  ;############


  push left_operand_sub
  push 736
  push output_buffer + 2
  call bufferToHex
  mov ax, '00'
  mov [output_buffer], ax
  mov al, `\n`
  mov [output_buffer + 186], al

  mov eax, 4
  mov ebx, 1
  mov ecx, output_buffer
  mov edx, 187
  int 80h


  push right_operand_sub
  push 736
  push output_buffer + 2
  call bufferToHex
  mov ax, '00'
  mov [output_buffer], ax
  mov al, `\n`
  mov [output_buffer + 186], al

  mov eax, 4
  mov ebx, 1
  mov ecx, output_buffer
  mov edx, 187
  int 80h


  push left_operand_sub
  push right_operand_sub
  push result_sub
  call longSubProc

  push result_sub
  push 744
  push output_buffer
  call bufferToHex
  mov al, `\n`
  mov [output_buffer + 186], al

  mov eax, 4
  mov ebx, 1
  mov ecx, output_buffer
  mov edx, 187
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, output_buffer + 187
  mov edx, 1
  int 80h
;############
;############
;############



	; Terminate program
	mov eax,1            ; 'exit' system call
	mov ebx,0            ; exit with error code 0
	int 80h              ; call the kernel


SECTION .DATA, write
    hello: db `Здоровеньки Були! Корєнев Олександр, група ІВ-72\n`
    helloLen: equ $-hello
    lab: db `Лабораторна робота №4\n`
    labLen: equ $-lab
    left_operand_adding1: dd 800C0001h, 800B0001h, 800A0001h, 80090001h, 80080001h, 80070001h, 80060001h, 80050001h, 80040001h, 80030001h, 80020001h, 80010001h
    right_operand_adding1: dd 80000001h, 80000001h, 80000001h, 80000001h, 80000001h, 80000001h, 80000001h, 80000001h, 80000001h, 80000001h, 80000001h, 80000001h
    left_operand_adding2: dd 0000000Ah, 0000000Bh, 0000000Ch, 0000000Dh, 0000000Fh, 00000010h, 00000011h, 00000012h, 00000013h, 00000014h, 00000015h, 00000016h
    right_operand_adding2: dd 00000001h, 00000001h, 00000001h, 00000001h,  00000001h, 00000001h, 00000001h, 00000001h,  00000001h, 00000001h, 00000001h, 00000001h
    left_operand_sub: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    right_operand_sub: dd 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32

SECTION .bss, write
    output_buffer: resb 200
    result_adding: resb 49
    result_sub: resb 93
