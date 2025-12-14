//#include "stdafx.h"

#define DES_ENCRYPT  1
#define DES_DECRYPT  0

void unbit(unsigned char *to,unsigned char *from,int len);
void pkbit(unsigned char *to, unsigned char *from, int len);
void perm(unsigned char *to, const unsigned char *op, unsigned char *from, int bits);
void rot(unsigned char *r, int len, int bits);
void add2(unsigned char *to, unsigned char *from, int bits);
void subs(unsigned char *o, unsigned char *i, int s);
int des_set_key(unsigned char *key);
void des_func(unsigned char in[64], unsigned char out[64], unsigned char b[16][48], int enc);
int des_ecb_encrypt(unsigned char *in, unsigned char *out, int enc);
int des_cbc_encrypt(unsigned char *in, unsigned char *out, int len, unsigned char *iv, int enc);
void des_set_odd_parity(unsigned char *key);
void ascii2hex(unsigned char txt[16], unsigned char hex[8]);
void hex2ascii(unsigned char hex[8], unsigned char txt[16]);
void DesECBEncrypt(unsigned char Key[16], unsigned char In[16], unsigned char Out[16]);
void DesECBDecrypt(unsigned char Key[16], unsigned char In[16], unsigned char Out[16]);
