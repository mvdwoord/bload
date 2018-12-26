; On x86 (IBM PC/AT compatible) the BIOS boots the system, and
; after initialization the first sector (512 bytes) is loaded
; into memory on location 0x7c00. Apparently this was once
; decided by IBM PC 5150 BIOS developer team (Dr. David Bradley).
; For backwards compatibility this has never changed. Good times.
;
; We also direct nasm explicitly to generate 16bit code.
[org 0x7c00]
[bits 16]


mov si, HELLO_HENK
call printf

; Safety mechanism, endless idle loop.
jmp $

; Includes
%include "printf.asm"

; Strings
HELLO_HENK: db 'Hello Henk. This is your bootloader speaking..', 0x0a, 0x0d, 0

; Padding and Magic Number. The bootloader should be 512 bytes long.
; $ is the current address, $$ is the starting address, subtract two 
; for the magic number.
times 510 - ($ - $$) db 0
dw 0xAA55
