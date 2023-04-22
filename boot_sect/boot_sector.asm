;
;A simple boot sector that prints a message to the screen using BIOS routine
;

;mov ah, 0x0e	;int 10/ah = 0eh -> scrolling teletype BIOS routine
;mov al , 'H'
;int 0x10
;mov al, 'e'
;int 0x10
;mov al, 'l'
;int 0x10
;mov al , 'l'
;int 0x10
;mov al , 'o'
;int 0x10

; mov bp, 0x8000	;Set the base of the stack a little above where BIOS
; mov sp, bp		;loads our boot sector so that it wont overwrite;
; push 'A'		;Pushing character to stack for later retreival
; push 'B'
; push 'C'
; pop bx
; mov al, bl
; int 0x10
; pop bx
; mov al, bl
; int 0x10
; mov al, [0x7ffe]
; int 0x10

[org 0x7c00]

	mov bx, HELLO
	call print

	call print_nl

	mov bx, GOODBYE
	call print

	call print_nl
	call print_nl


	;Reading some sectors from the disk
	;mov [BOOT_DRIVE], dl	;BIOS stores boot drive in dl so its
							;best to remember this for later

	mov bp, 0x8000			;setting stack safely out of the boot sector
	mov sp, bp

	mov bx, 0x9000			;load 5 sectors to 0x0000(es):0x9000(bx)
	mov dh, 2				;from the boot disk
	call disk_load
	;mov dl, [BOOT_DRIVE]

	mov dx, [0x9000]
	call print_hex

	call print_nl

	mov dx, [0x9000 + 512]	;print out the first loaded word which
	call print_hex		;we expect to be 0xdada, stored at address 0x9000
	call print_nl	

	jmp $		;Jump to current address

%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"
%include "disk_load.asm"

;BOOT_DRIVE: db 0

HELLO:
	db "Hello World, To my NEW_OS", 0

;Infinite loop (e9 fd ff)
GOODBYE:
	db "Good Bye", 0

; Fill with 510 zeroes minus the size of the previous code
times 510 - ($-$$) db 0
;Magic number
dw 0xaa55

times 256 dw 0xdada
times 256 dw 0xface
