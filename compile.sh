#!/bin/bash
echo Compiling src/$1.asm to build/$1.o with nasm -f elf64
nasm -f elf64 src/$1.asm -o build/$1.o
echo Linking build/$1.o to executable in bin/$1 
ld build/$1.o -o bin/$1
