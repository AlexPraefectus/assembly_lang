SECTION .TEXT
    global longAddProc


; calculating sum of two 384 bit numbers
; params
; left operand address
; right operand address
; result address
    longAddProc:
        pop r10                     ; pop return address
        pop rdi
        pop rdx
        pop rsi
        push r10                    ; restore return address
        mov rcx, 6                  ; 48 / 8 (register size) = 6
        mov r9, 0                   ; loop variable
        clc                         ; carry flag to 0
        addingLoop:
            mov r8, [r9 * 8 + rsi]
            adc r8, [r9 * 8 + rdx]
            mov [r9 * 8 + rdi], r8
            inc r9
            loop addingLoop
        adc al, 0
        mov [rdi + 48], al         ; write carry flag to result's high byte
        ret
