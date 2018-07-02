#!/bin/bash

cd ./src
nasm -f elf32 ./multiboot.asm -o ./multiboot.o
gcc -m32 -c ./SOKernel_Main.c -o ./SOKernel_Main.o
ld -m elf_i386 -T ./link.ld -o ./Lorena-legacy ./multiboot.o ./SOKernel_Main.o
mv ./Lorena-legacy ../sys/Lorena-legacy
cd ..
cd ..
grub-mkrescue --product-name=Lorena-legacy --product-version=legacy-old -o Lorena-legacy.iso legacy
cd ./src
rm -rf ./*.o
