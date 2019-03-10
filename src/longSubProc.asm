SECTION .TEXT
    global longAddProc


; calculating sum of two 384 bit numbers
; params
; left operand address
; right operand address
; result address
    longSubProc:
        pop r10                     ; pop return address
        pop rdi
        pop rdx
        pop rsi
        push r10                    ; restore return address
        mov rcx, 23                 ; 92 / 4 (register size) = 23
        mov r9, 0                   ; loop variable
        clc                         ; carry flag to 0
        SubLoop:
            mov r8d, [r9 * 8 + rsi]
            sbb r8d, [r9 * 8 + rdx]
            mov [r9 * 8 + rdi], r8d
            inc r9
            loop SubLoop
        mov al, 0
        adc al, 0
        mov [rdi + 92], al         ; write carry flag to result's high byte
        ret
