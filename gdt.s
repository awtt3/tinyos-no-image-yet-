; gdt.S
; Assemble: nasm -f elf32 gdt.S -o gdt.o

global gdt_install
section .text

gdt_descriptor:
    dw 0
    dd 0

gdt_flush:
    lgdt [esp+4]
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    jmp 0x08:.1
.1:
    ret

; exported function
gdt_install:
    ; caller supplies pointer to descriptor on stack; we just return to C which will call gdt_flush
    ret
