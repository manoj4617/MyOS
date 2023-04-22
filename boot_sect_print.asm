print:  
    pusha

;implementing the below loop
;while(string[i] != 0){
;   print string[i];
;   i++;
;}

start:
    mov al, [bx]
    cmp al, 0
    je done

    ;printing
    mov ah, 0x0e
    int 0x10

    add bx, 1
    jmp start

done:
    popa
    ret

print_nl:
    pusha

    mov ah, 0x0e
    mov al, 0x0a    ;new line char '\n'
    int 0x10

    mov al, 0x0d    ;carriage return '\r'
    int 0x10

    popa
    ret