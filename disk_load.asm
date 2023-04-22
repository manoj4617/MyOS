;load DH sectors to ES:BX from drivr DL
disk_load:
    pusha
    push dx         ;store dx on stack so later we can recall
                    ;how many sectors were requested to be read
                    ;even if it is altered in the meantime
    mov ah, 0x02    ;BIOS read sector function
    mov al, dh      ;read dh sector
    mov cl, 0x02    ;start reading from second sector (after the boot sector)
    mov ch, 0x00    ;select cylinder 0
    mov dh, 0x00    ;select head 0

    int 0x13        ;BIOS interrupt
    jc disk_error   ;jump of error(carry flag)

    pop dx
    cmp al, dh
    jne sector_error

    popa
    ret

disk_error:
    mov bx, DISK_ERROR_MSG
    call print
    call print_nl
    mov dh, ah
    call print_hex
    call print_nl
    jmp disk_loop

sector_error:
    mov bx, SECTORS_ERROR
    call print

disk_loop:
    jmp $

DISK_ERROR_MSG:
    db "Disk read error!", 0

SECTORS_ERROR:
    db "Incorrect number of sectors read", 0

