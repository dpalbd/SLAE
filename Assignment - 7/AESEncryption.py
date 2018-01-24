#!/usr/bin/python
#Encryption in Python Using AES 128 & Base64
#Acknowledgement # http://www.codekoala.com/posts/aes-encryption-python-using-pycrypto/
#Acknowledgement # https://en.wikipedia.org/wiki/Advanced_Encryption_Standard
#Acknowledgement # https://en.wikipedia.org/wiki/Block_size_(cryptography)
#SLAE-1122

from Crypto.Cipher import AES
import sys
import os
import base64

def aes128(shc):

#the block size for the cipher object; must be 16 per FIPS-197, Ref# https://csrc.nist.gov/csrc/media/publications/fips/197/final/documents/fips-197.pdf 
 BLOCK_SIZE = 16 
 PADDING = '{'
 pad = lambda s: s + (BLOCK_SIZE - len(s) % BLOCK_SIZE) * PADDING
 EncodeAES = lambda c, s: base64.b64encode(c.encrypt(pad(s)))

#Use static key
 secret = 'securitytubeSLAE' 
 cipher = AES.new(secret)
 encoded = EncodeAES(cipher, shc)
 print 'Encrypted Shellcode Using AES 128 & Base64\n\n\n', encoded

shellcode = sys.argv[1] # take the shellcode as input
SLAE = aes128 (shellcode)
