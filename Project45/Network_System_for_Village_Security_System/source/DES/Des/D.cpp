//#include "stdafx.h"
#include <string.h>

#define DES_ENCRYPT  1
#define DES_DECRYPT  0

unsigned char Key_Schedule[16][48];

/* left shift table for key schedule LS */
static const unsigned char LS[16] = { 1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1 };

/* permuted-choice tables for key schedule PC1, PC2 */
unsigned char PC1[56] = {
  57,49,41,33,25,17, 9, 1,58,50,42,34,26,18,10, 2,
  59,51,43,35,27,19,11, 3,60,52,44,36,63,55,47,39,
  31,23,15, 7,62,54,46,38,30,22,14, 6,61,53,45,37,
  29,21,13, 5,28,20,12, 4 };

unsigned char PC2[48] = {
  14,17,11,24, 1, 5, 3,28,15, 6,21,10,23,19,12, 4,
  26, 8,16, 7,27,20,13, 2,41,52,31,37,47,55,30,40,
  51,45,33,48,44,49,39,56,34,53,46,42,50,36,29,32 };

/* initial permutation IP */
unsigned char IP[64] = {
  58,50,42,34,26,18,10, 2,60,52,44,36,28,20,12, 4,
  62,54,46,38,30,22,14, 6,64,56,48,40,32,24,16, 8,
  57,49,41,33,25,17, 9, 1,59,51,43,35,27,19,11, 3,
  61,53,45,37,29,21,13, 5,63,55,47,39,31,23,15, 7 };

/* bit-selection table E */
unsigned char E[48] = {
  32, 1, 2, 3, 4, 5, 4, 5, 6, 7, 8, 9, 8, 9,10,11,
  12,13,12,13,14,15,16,17,16,17,18,19,20,21,20,21,
  22,23,24,25,24,25,26,27,28,29,28,29,30,31,32, 1 };

/* substitution tables ST */
unsigned char ST[8][64] = {
  14, 4,13, 1, 2,15,11, 8, 3,10, 6,12, 5, 9, 0, 7,
   0,15, 7, 4,14, 2,13, 1,10, 6,12,11, 9, 5, 3, 8,
   4, 1,14, 8,13, 6, 2,11,15,12, 9, 7, 3,10, 5, 0,
  15,12, 8, 2, 4, 9, 1, 7, 5,11, 3,14,10, 0, 6,13,

  15, 1, 8,14, 6,11, 3, 4, 9, 7, 2,13,12, 0, 5,10,
   3,13, 4, 7,15, 2, 8,14,12, 0, 1,10, 6, 9,11, 5,
   0,14, 7,11,10, 4,13, 1, 5, 8,12, 6, 9, 3, 2,15,
  13, 8,10, 1, 3,15, 4, 2,11, 6, 7,12, 0, 5,14, 9,

  10, 0, 9,14, 6, 3,15, 5, 1,13,12, 7,11, 4, 2, 8,
  13, 7, 0, 9, 3, 4, 6,10, 2, 8, 5,14,12,11,15, 1,
  13, 6, 4, 9, 8,15, 3, 0,11, 1, 2,12, 5,10,14, 7,
   1,10,13, 0, 6, 9, 8, 7, 4,15,14, 3,11, 5, 2,12,

   7,13,14, 3, 0, 6, 9,10, 1, 2, 8, 5,11,12, 4,15,
  13, 8,11, 5, 6,15, 0, 3, 4, 7, 2,12, 1,10,14, 9,
  10, 6, 9, 0,12,11, 7,13,15, 1, 3,14, 5, 2, 8, 4,
   3,15, 0, 6,10, 1,13, 8, 9, 4, 5,11,12, 7, 2,14,

   2,12, 4, 1, 7,10,11, 6, 8, 5, 3,15,13, 0,14, 9,
  14,11, 2,12, 4, 7,13, 1, 5, 0,15,10, 3, 9, 8, 6,
   4, 2, 1,11,10,13, 7, 8,15, 9,12, 5, 6, 3, 0,14,
  11, 8,12, 7, 1,14, 2,13, 6,15, 0, 9,10, 4, 5, 3,

  12, 1,10,15, 9, 2, 6, 8, 0,13, 3, 4,14, 7, 5,11,
  10,15, 4, 2, 7,12, 9, 5, 6, 1,13,14, 0,11, 3, 8,
   9,14,15, 5, 2, 8,12, 3, 7, 0, 4,10, 1,13,11, 6,
   4, 3, 2,12, 9, 5,15,10,11,14, 1, 7, 6, 0, 8,13,

   4,11, 2,14,15, 0, 8,13, 3,12, 9, 7, 5,10, 6, 1,
  13, 0,11, 7, 4, 9, 1,10,14, 3, 5,12, 2,15, 8, 6,
   1, 4,11,13,12, 3, 7,14,10,15, 6, 8, 0, 5, 9, 2,
   6,11,13, 8, 1, 4,10, 7, 9, 5, 0,15,14, 2, 3,12,

  13, 2, 8, 4, 6,15,11, 1,10, 9, 3,14, 5, 0,12, 7,
   1,15,13, 8,10, 3, 7, 4,12, 5, 6,11, 0,14, 9, 2,
   7,11, 4, 1, 9,12,14, 2, 0, 6,10,13,15, 3, 5, 8,
   2, 1,14, 7, 4,10, 8,13,15,12, 9, 0, 3, 5, 6,11 };

/* permutation table P */
unsigned char P[32] = {
  16, 7,20,21,29,12,28,17, 1,15,23,26, 5,18,31,10,
   2, 8,24,14,32,27, 3, 9,19,13,30, 6,22,11, 4,25 };

/* final permutation FP */
unsigned char FP[64] = {
  40, 8,48,16,56,24,64,32,39, 7,47,15,55,23,63,31,
  38, 6,46,14,54,22,62,30,37, 5,45,13,53,21,61,29,
  36, 4,44,12,52,20,60,28,35, 3,43,11,51,19,59,27,
  34, 2,42,10,50,18,58,26,33, 1,41, 9,49,17,57,25 };

/* unbit(to, from, len) -- unpack len bytes to bits */
void unbit(unsigned char *to,unsigned char *from,int len)
{
register int j,f;

	while(len--)
	{
		for (j = 8,f = *from++; j--;)
		{
			*to++ =  (f >> j) & 1;
		}
	}
}

/* pkbit(to from, len) -- pack bits to len bytes */
void pkbit(unsigned char *to, unsigned char *from, int len)
{
register int j,t;

	while (len--)
	{
		for (j = 8, t = 0; j--;)
			t |= *from++ << j;
		*to++ = t;
	}
}

/* perm(to, OP, from, bits) -- do permutation */
void perm(unsigned char *to, const unsigned char *op, unsigned char *from, int bits)
{
register int i;

	for (i = 0; i < bits; i++)
		to[i] = from[op[i]-1];
}

/* rot(to, from, len, bits) -- rotate left */
void rot(unsigned char *r, int len, int bits)
{
register int i,t;

	if (len > 1)
	{
		for (i = 0; i<bits; i++)
		{
			t = r[0];
			memmove(&r[0], &r[1], len - 1);
			r[len-1] = t;
		}
	}
}

/* add2(to, from, bits) -- add bits modulo 2 (that is, eor) */
void add2(unsigned char *to, unsigned char *from, int bits)
{
register int i;

	for (i=0; i<bits; i++)
		to[i] ^= from[i];
}

/* subs(o,i,s) -- substitute 6 bits to 4 bits using ST[s] */
void subs(unsigned char *o, unsigned char *i, int s)
{
register int t;

	t = ST[s][
		(i[0] << 5) | (i[5] << 4) | /* 1st and 6th bit, row index */
		(i[1] << 3) | (i[2] << 2) | /* 2nd to 5th bit, col index */
		(i[3] << 1) |  i[4]];
	o[0] = (t >> 3) & 1;
	o[1] = (t >> 2) & 1;
	o[2] = (t >> 1) & 1;
	o[3] =  t & 1;
}

/* des_set_key(key,ks) -- generate a keyschedule */
int des_set_key(unsigned char *key)
{
int i;
unsigned char k[64],cd[56];

	unbit(k, key, 8);
	perm(cd, PC1, k, 56);
	for (i = 0; i < 16; i++)
	{
		rot(&cd[0], 28, LS[i]);
		rot(&cd[28], 28, LS[i]);
		perm(Key_Schedule[i], PC2, cd, 48);
	}
	return 1;
}

/* des_func(in,out,ks) -- des core function */
void des_func(unsigned char in[64], unsigned char out[64], unsigned char b[16][48], int enc)
{
int i,j;
unsigned char lr[64], rsto[32], si[48], so[32];
#define LEFT  lr
#define RIGHT  &lr[32]

	perm(lr, IP, in, 64); /* initial permutation */
	for (i = 0; i < 16; i++)
	{ /* 16 rounds */
		memcpy(rsto, RIGHT,32); /* store right part */
		perm(si, E, RIGHT, 48); /* F-box: permute to subst. input */
		add2(si, b[enc ? i : 15-i], 48); /* add key (enc/dec order) */
		for (j = 0; j < 8; j++) /* 48 to 32 bit substitute */
			subs(&so[j*4],&si[j*6],j);
		perm(RIGHT, P, so, 32); /* permute substitution output: end F*/
		add2(RIGHT, LEFT, 32); /* add left part */
		memcpy(LEFT, rsto, 32); /* old right part will be new left */
	}
	memcpy(LEFT, RIGHT, 32); /* swap left and right part */
	memcpy(RIGHT,rsto, 32);
	perm(out,FP,lr,64); /* final permutation */
}

/* des_ecb_encrypt(in, out, ks, enc) -- des electronic code book mode */
int des_ecb_encrypt(unsigned char *in, unsigned char *out, int enc)
{
unsigned char o[64];

	unbit(o, (unsigned char *)in, 8);
	des_func((unsigned char *)o, (unsigned char *)o, Key_Schedule, enc);
	pkbit((unsigned char *)out, o, 8);
	return 8;
}

/* des_cbc_encrypt(in, out, len, ks, iv, enc) -- cipher block chaining mode */
int des_cbc_encrypt(unsigned char *in, unsigned char *out, int len, unsigned char *iv, int enc)
{
int i;
unsigned char ivb[64], ob[64], ib[64];

	unbit(ivb, iv, 8);
	for (i = 0; i < len-8; i+=8)
	{
		unbit(ib, (unsigned char *)in++, 8);
		if(enc)
			add2(ib, ivb, 64);
		des_func(ib, ob, Key_Schedule,enc);
		if(enc)
		{
			memcpy(ivb, ob, 64);
		}
		else
		{
			add2(ob, ivb, 64);
			memcpy(ivb, ib, 64);
		}
		pkbit((unsigned char *)out++, ob, 8);
	}
	memset(ib, 0, sizeof(ib)); /* pad with zeroes */
	unbit(ib,(unsigned char *)in,len-i);
	if(enc)
		add2(ib, ivb, 64);
	des_func(ib, ob, Key_Schedule,enc);
	if(enc)
	{
		pkbit((unsigned char *)iv, ob, 64);
	}
	else
	{
		add2(ob, ivb, 64);
		pkbit((unsigned char *)iv, ib, 64);
	}
	pkbit((unsigned char *)out, ob, 8);
	return (i+8);
}

void des_set_odd_parity(unsigned char *key)
{
int i;
unsigned char c;

	for (i = 0; i < 8; i++)
	{
		c = key[i] & 0xfe;
		c = (c >> 4) ^ (c & 0x0f);
		c = (c >> 2) ^ (c & 3);
		key[i] = (key[i] & 0xfe) | ((c >> 1) ^ (c & 1)) ^ 1 ;
	}
}

//---------------------------------------------------------------------------
//
// Edit by Lert S.Tang
/*
void DesECBEncrypt(unsigned char *Key, unsigned char *In, unsigned char *Out)
{
	des_set_key(Key);
	des_ecb_encrypt(In, Out, DES_ENCRYPT);
}

void DesECBDecrypt(unsigned char *Key, unsigned char *In, unsigned char *Out)
{
	des_set_key(Key);
	des_ecb_encrypt(In, Out, DES_DECRYPT);
}
*/
void ascii2hex(unsigned char txt[16], unsigned char hex[8])
{
int i,j;
char tmp,Tmp[100];

	for(i=0; i<16; i++)
	{
		j = i>>1;
		if((txt[i] >= '0') && (txt[i] <= '9'))
		{
			tmp = '0';
		}
		else
		{
			if((txt[i] >= 'A') && (txt[i] <= 'F'))
			{
				tmp = 0x37;
			}
			else
			{
				len = 0;
				break;
			}
		}
		if((j<<1) == i)
			hex[j] = ((txt[i] - tmp)<<4);
		else
			hex[j] |= txt[i] - tmp;
	}
}

void hex2ascii(unsigned char hex[8], unsigned char txt[16])
{
unsigned char text;
unsigned char tmp;

	for(int i=0; i<8; i++)
	{
		text  = (hex[i]&0xf0)>>4;
		if(text<10)
		{	txt[i<<1] = (text + '0');	}
		else
		{
			if(text<16)
			{	txt[i<<1] = (text-10 + 'A');	}
		}
		text  = hex[i]&0x0f;
		if(text<10)
		{	txt[(i<<1)-1] = (text + '0');	}
		else
		{	if(text<16)
			{	txt[(i<<1)-1] = (text-10 + 'A');	}
		}
	}
}

void DesECBEncrypt(unsigned char Key[16], unsigned char In[16], unsigned char Out[16])
{
unsigned char
	des_set_key(Key);
	des_ecb_encrypt(In, Out, DES_ENCRYPT);
}

void DesECBDecrypt(unsigned char Key[16], unsigned char In[16], unsigned char Out[16])
{
	des_set_key(Key);
	des_ecb_encrypt(In, Out, DES_DECRYPT);
}
