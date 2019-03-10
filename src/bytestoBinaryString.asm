section .DATA, write
    chr_0: db "0000"
    chr_1: db "0001"
    chr_2: db "0010"
    chr_3: db "0011"
    chr_4: db "0100"
    chr_5: db "0101"
    chr_6: db "0110"
    chr_7: db "0111"
    chr_8: db "1000"
    chr_9: db "1001"
    chr_a: db "1010"
    chr_b: db "1011"
    chr_c: db "1100"
    chr_d: db "1101"
    chr_e: db "1110"
    chr_f: db "1111"


section .TEXT
    global bufferToBin


    ;address of memory
    ;length in bytes
    ;address of buffer to write
    bufferToBin:
        mov rsi, [rsp+24]       ; rsi stores number addr
        mov rcx, [rsp+16]       ; rcx stores length of number in bytes
        mov rdi, [rsp+8]        ; rdi stores pointer to current buffer position 
        parse2:
            mov r8b, [rsi + rcx -1]      ; get 1 byte from number
    
            mov al, r8b         ;  
            and al, 0F0h         ; get first 4 bits
            shr al, 4           ; 
            call getBinaryRepr  ;
            mov [rdi], rax
            add rdi, 4
        
            mov al, r8b
            and al, 0fh;
            call getBinaryRepr
            mov [rdi], rax
            add rdi, 4
        loop parse2
        ret
    
    ;4 low bits should be stored in al
    getBinaryRepr:
        mov dl, al     ; store 4 low bits
        mov r10, chr_0 ; store reference to table start
        shl dl, 2      ; each table element has 4 bytes
        mov rax, [rdx + r10]    ; result to rax
        
    

