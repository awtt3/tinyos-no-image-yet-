; boot.asm
[BITS 16]
[ORG 0x7C00]

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    ; Load kernel.bin (assuming it's <= 32 sectors)
    mov si, 0x7E00
    mov bx, 0x1000  ; load address for kernel
    mov cx, 1        ; number of sectors
    mov dx, 0x80     ; boot drive
    int 0x13

    jmp 0x0000:0x1000 ; jump to kernel

times 510-($-$$) db 0
dw 0xAA55
