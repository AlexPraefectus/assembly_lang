section .DATA, write
    convTable: db "0123456789ABCDEF"

section .TEXT
    GLOBAL binToHex
    GLOBAL bufferToHex

binToHex:
    mov rdx, convTable
    ;add rax, rsi
    mov al, [rdx + rax]
    ret

; params:
; number addr
; number length
; buffer addr
bufferToHex:
    mov rsi, [rsp+24]       ; rsi stores number addr
    mov rcx, [rsp+16]       ; rcx stores length of number in bits
    mov rdi, [rsp+8]        ; rdi stores pointer to current buffer position 
    shr rcx, 3              ; get amount of bytes in number
    inc rcx
    parse:
        mov r8b, [rsi]      ; get 1 byte from number

        mov al, r8b         ;  
        and al, 0F0h         ; get first 4 bits
        shr al, 4           ; 
        call binToHex       ;
        mov [rdi], al
        inc rdi
        
        mov al, r8b
        and al, 0fh;
        call binToHex
        mov [rdi], al 
        inc rdi
    loop parse
    ret
    
    
