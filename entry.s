; entry.S -- multiboot header + minimal 32-bit entry
; Assemble with: nasm -f elf32 entry.S -o entry.o

SECTION .multiboot
align 4
    dd 0x1BADB002        ; multiboot magic
    dd 0x00010003        ; flags (memory info + video)
    dd -(0x1BADB002 + 0x00010003)

SECTION .text
global start
extern kernel_main

start:
    cli
    mov ebp, esp
    call kernel_main
.hang:
    hlt
    jmp .hang
