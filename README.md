⚙️ Features
🖥 VGA Text Driver

Writes directly to 0xB8000

kprint() for strings

kputhex() for hex output

🧠 Simple Memory Allocator

Bump allocator begin at 7MB

kmalloc(size) returns raw memory

🛡 GDT (Global Descriptor Table)

Null, code, and data segments

Assembly GDT flush (lgdt)

⚡ IDT + Interrupt Handling

Full 256-entry IDT

CPU exceptions (ISR 0–31)

Hardware IRQs (32–47)

C isr_handler() debug output

🔁 PIC Remapping

Master PIC → 0x20

Slave PIC → 0x28

⏱ 100Hz PIT Timer

Ticks counted in IRQ0

Prints [TICK] every 100 ticks

⌨ Keyboard Support

Reads raw scancodes from port 0x60

Prints hex key codes

💬 Tiny Shell

Shows > prompt

Accepts characters

Echoes input

Has help command

🧰 Build Requirements (Windows)

You must have:

NASM

GCC or i686-elf-gcc

LD or i686-elf-ld

(Optional) mkisofs for ISO building

Build

Run:

build.bat


This outputs tinyos.bin.

📀 Creating a Bootable ISO


▶️ Running TinyOS
QEMU (best choice)
qemu-system-i386 -kernel tinyos.bin


If you have the ISO:

qemu-system-i386 -cdrom tinyos.iso

VirtualBox

Create new VM → “Other / Unknown (32-bit)”

Attach tinyos.iso as optical disk

Boot

🛣 Roadmap

ASCII keyboard driver

Better shell (commands, clear screen, help menu)

Paging + memory manager

ELF executable loading

System calls

Usermode

Filesystem

Multitasking (task switching)


🙌 Credits

Built using:

OSDev Wiki

NASM

GCC

QEMU

Intel Manuals

Community OSDev tutorials
