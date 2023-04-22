;recieving data in dx
;assuming we are called with dx=0x1234

print_hex:
    pusha

    mov cx, 0   ;index variable


hex_loop:
    ;converting last char of dx to ascii
    cmp cx, 4
    je end

    mov ax, dx      ;ax as working reg
    and ax, 0x000f  ;0x1234 -> 0x0004 masking first three to 0
    add al, 0x30    ;add 0x30 to N to convert it to ascii N
    cmp al, 0x39    ;if > 9, add extra 8 to represent A to F
    jle step2
    add al, 7       ;A is ascii 65 instead of 58, 65-58=7


step2:
    ;get correct position of the string to place our ascii
    ;bx <- base address + string length - index of char
    mov bx, HEX_OUT + 5     ;base + length
    sub bx, cx              ;index variable
    mov [bx], al            ;copying ascii in al to position pointed by bx
    ror dx, 4               ;0x1234 -> 0x4123 -> 0x4312 -> 0x2341 -> 0x1234

    add cx, 1
    jmp hex_loop

end:
    mov bx, HEX_OUT
    call print

HEX_OUT:
    db '0x0000', 0