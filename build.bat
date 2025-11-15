@echo off
setlocal

REM === Adjust these if your toolchain names differ ===
where i686-elf-gcc >nul 2>&1
if %errorlevel%==0 (
  set CC=i686-elf-gcc
  set LD=i686-elf-ld
) else (
  set CC=gcc
  set LD=ld
)

REM === Set NASM path explicitly ===
set NASM="C:\Program Files\NASM\nasm.exe"

if not exist %NASM% (
  echo NASM not found at %NASM%. Please install or fix the path.
  pause
  exit /b 1
)

echo Assembling...
%NASM% -f elf32 entry.S -o entry.o
%NASM% -f elf32 gdt.S -o gdt.o
%NASM% -f elf32 isr.S -o isr.o
%NASM% -f elf32 isr_common.S -o isr_common.o

echo Compiling C kernel...
%CC% -m32 -ffreestanding -O2 -Wall -Wextra -c kernel.c -o kernel.o

echo Linking kernel ELF...
%LD% -m elf_i386 -T linker.ld -o kernel.elf entry.o gdt.o isr.o isr_common.o kernel.o

echo Converting to binary kernel.bin (flat) for QEMU -kernel...
objcopy -O binary kernel.elf kernel.bin

echo Done. Run QEMU with:
echo qemu-system-i386 -kernel kernel.bin -m 512
pause
endlocal
