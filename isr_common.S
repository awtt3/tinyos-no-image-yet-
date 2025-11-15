; isr_common.S
; Assemble: nasm -f elf32 isr_common.S -o isr_common.o

global isr_common_stub
global irq_common_stub
extern isr_handler
extern irq_handler

section .text

isr_common_stub:
    cli
    pusha
    push ds
    push es
    pushad
    mov eax, esp           ; pointer to registers (approx)
    add eax, 36            ; adjust to point to our saved regs layout (this is rough; simplified approach)
    push eax
    call isr_handler
    add esp, 4
    popad
    pop es
    pop ds
    popa
    add dword [esp], 0     ; adjust if needed
    sti
    iret

irq_common_stub:
    cli
    pusha
    push ds
    push es
    pushad
    mov eax, esp
    add eax, 36
    push dword 0           ; no error code
    push dword 0           ; irq number not provided here (we'd need separate stubs), simplified
    call irq_handler
    add esp, 8
    popad
    pop es
    pop ds
    popa
    ; send EOI is done in irq_handler
    sti
    iret
