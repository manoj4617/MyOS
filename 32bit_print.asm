[bits 32]
;Constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

;printing all null-terminated string pointed by edx
print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY

print_string_pm_loop:
    mov al, [ebx]               ;store the char at ebx in al
    mov ah, WHITE_ON_BLACK      ;store the attributes in ah

    cmp al, 0                   ;if (al == 0) at end of string
    je print_string_pm_done

    mov [edx], ax
    add ebx, 1                  ;increament ebx to next char in string
    add edx, 2                  ;move to next char cell in vid memory

    jmp print_string_pm_loop

print_string_pm_done:
    popa
    ret