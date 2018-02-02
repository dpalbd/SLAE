#!/usr/bin/python

# Python Complement Encoder 

encoded = ""
encoded2 = ""

shellcode = "\x74\x61\x63\x2f"
shellcode +="\x64\x77\x73\x73"
shellcode +="\x61\x70\x2f\x2f"


print 'Encoded shellcode ...'

for x in bytearray(shellcode) :
	# Complement Encoding 	
	y = ~x

	encoded += '\\x'
	encoded += '%02x' % (y & 0xff)

	encoded2 += '0x'
	encoded2 += '%02x,' %(y & 0xff)


print encoded

print encoded2

print 'Len: %d' % len(bytearray(shellcode))
