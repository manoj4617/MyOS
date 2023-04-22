gdt_start:
    dd 0x0      ;'dd' means define double (4 bytes)
    dd 0x0      

;code segment descriptor
gdt_code:
    ;base=0x0, limit=0xfffff
    ;1st flag: (present)1 (privilage)00 (descriptor type)1 -> 1001b
    ;type flags: (code)1 (conforming)0 (readable)1 (accessed)0 -> 1010b
    ;2nd flags: (granularity)1 (32-bit default) 1 (64-bit seg)0 (ALV)0 -> 1100b

    dw 0xffff       ;Limit (bits 0-15)
    dw 0x0          ;Base (bits 0-15)
    dd 0x0          ;Base (bits 16-23)
    dd 10011010b    ;1st flag, type flag
    db 11001111b    ;2nd flag, limit (bits 16-19)
    db 0x0          ;base (bits 24-31)

gdt_data:   
    dw 0xffff
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start


CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
