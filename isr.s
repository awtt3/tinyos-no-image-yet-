; isr.s -- generate 0..47 stubs and a common ISR handler reference
; Assemble: nasm -f elf32 isr.s -o isr.o

global isr_stub_table
extern isr_common_stub
extern irq_common_stub

section .text

%assign i 0
%rep 48
    global isr_stub_%i
%assign i i+1
%endrep

%assign i 0
%rep 32
isr_stub_%i:
    cli
    push dword 0
    push dword %i
    jmp isr_common_stub
%assign i i+1
%endrep

; IRQs 32..47
%assign i 32
%rep 16
isr_stub_%i:
    cli
    push dword 0
    push dword %i
    jmp irq_common_stub
%assign i i+1
%endrep
