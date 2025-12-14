#define EN0   0      /* MODE == encrypt */
#define DE1   1      /* MODE == decrypt */

#include <REG51.H>

typedef struct {
  unsigned long ek[32];
  unsigned long dk[32];
} des_ctx;

void deskey(unsigned char *, short);
void usekey(unsigned long *);
void cpkey(unsigned long *);
void des(unsigned char *, unsigned char *);

static void scrunch(unsigned char *, unsigned long *);
static void unscrun(unsigned long *, unsigned char *);
static void desfunc(unsigned long *, unsigned long *);
static void cookey(unsigned long *);

static unsigned long KnL[32] = { 0L };
static unsigned long KnR[32] = { 0L };
static unsigned long Kn3[32] = { 0L };
static unsigned char Df_Key[24] = {
       0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef,
       0xfe,0xdc,0xba,0x98,0x76,0x54,0x32,0x10,
       0x89,0xab,0xcd,0xef,0x01,0x23,0x45,0x67 };

static unsigned short bytebit[8]    = {
       0200, 0100, 040, 020, 010, 04, 02, 01 };

static unsigned long bigbyte[24] = {
       0x800000L,    0x400000L,     0x200000L,    0x100000L,
       0x80000L,     0x40000L,      0x20000L,     0x10000L,
       0x8000L,      0x4000L,       0x2000L,      0x1000L,
       0x800L,       0x400L,        0x200L,       0x100L,
       0x80L,        0x40L,         0x20L,        0x10L,
       0x8L,         0x4L,          0x2L,         0x1L   };

/* Use the key schedule specified in the Standard (ANSI X3.92-1981). */

static unsigned char pc1[56] = {
       56, 48, 40, 32, 24, 16,  8,   0, 57, 49, 41, 33, 25, 17,
        9,  1, 58, 50, 42, 34, 26,  18, 10,  2, 59, 51, 43, 35,
       62, 54, 46, 38, 30, 22, 14,   6, 61, 53, 45, 37, 29, 21,
       13,  5, 60, 52, 44, 36, 28,  20, 12,  4, 27, 19, 11,  3 };

static unsigned char totrot[16] = {
       1,2,4,6,8,10,12,14,15,17,19,21,23,25,27,28 };

static unsigned char pc2[48] = {
       13, 16, 10, 23,  0,  4,       2, 27, 14,  5, 20,  9,
       22, 18, 11,  3, 25,  7,      15,  6, 26, 19, 12,  1,
       40, 51, 30, 36, 46, 54,      29, 39, 50, 44, 32, 47,
       43, 48, 38, 55, 33, 52,      45, 41, 49, 35, 28, 31 };	      

void deskey(unsigned char *key, short edf)  {

  register int i, j, l, m, n;
  unsigned char pc1m[56], pcr[56];
  unsigned long kn[32];

  for ( j = 0; j < 56; j++ ) {
    l = pc1[j];
    m = l & 07;
    pc1m[j] = (key[l >> 3] & bytebit[m]) ? 1 : 0;
  }
  for( i = 0; i < 16; i++ ) {
    if( edf == DE1 ) m = (15 - i) << 1;
    else             m = i << 1;
    n = m + 1;
    kn[m] = kn[n] = 0L;
    for( j = 0; j < 28; j++ ) {
      l = j + totrot[i];
      if( l < 28 ) pcr[j] = pc1m[l];
      else pcr[j] = pc1m[l - 28];
    }
    for( j = 28; j < 56; j++ ) {
      l = j + totrot[i];
      if( l < 56 ) pcr[j] = pc1m[l];
      else         pcr[j] = pc1m[l - 28];
    }
    for( j = 0; j < 24; j++ ) {
      if( pcr[pc2[j]] )    kn[m] |= bigbyte[j];
      if( pcr[pc2[j+24]] ) kn[n] |= bigbyte[j];
    }
  }
  cookey(kn);
}

static void cookey(unsigned long *raw1)  {
  register unsigned long *cook, *raw0;
  unsigned long dough[32];
  register int i;

  cook = dough;
  for( i = 0; i < 16; i++, raw1++ ) {
    raw0 = raw1++;
    *cook   = (*raw0 & 0x00fc0000L) << 6;
    *cook  |= (*raw0 & 0x00000fc0L) << 10;
    *cook  |= (*raw1 & 0x00fc0000L) >> 10;
    *cook++|= (*raw1 & 0x00000fc0L) >> 6;
    *cook   = (*raw0 & 0x0003f000L) << 12;
    *cook  |= (*raw0 & 0x0000003fL) << 16;
    *cook  |= (*raw1 & 0x0003f000L) >> 4;
    *cook++       |= (*raw1 & 0x0000003fL);
  }
  usekey(dough);
}

void cpkey(unsigned long *into)  {
  register unsigned long *from, *endp;

  from = KnL, endp = &KnL[32];
  while( from < endp ) *into++ = *from++;
}

void usekey(unsigned long *from)  {
  register unsigned long *to, *endp;

  to = KnL;
  endp = &KnL[32];
  while( to < endp ) *to++ = *from++;
}

#if 0
void des(unsigned char *inblock, unsigned char *outblock)  {
  unsigned long work[2];

  scrunch(inblock, work);
  desfunc(work, KnL);
  unscrun(work, outblock);
}
#endif

static void scrunch(unsigned char *outof, unsigned long *into)  {
  *into   = (*outof++ & 0xffL) << 24;
  *into  |= (*outof++ & 0xffL) << 16;
  *into  |= (*outof++ & 0xffL) << 8;
  *into++ |= (*outof++ & 0xffL);
  *into   = (*outof++ & 0xffL) << 24;
  *into  |= (*outof++ & 0xffL) << 16;
  *into  |= (*outof++ & 0xffL) << 8;
  *into  |= (*outof   & 0xffL);
}

static void unscrun(unsigned long *outof, unsigned char *into)  {
  *into++ = (*outof >> 24) & 0xffL;
  *into++ = (*outof >> 16) & 0xffL;
  *into++ = (*outof >>  8) & 0xffL;
  *into++ =  *outof++      & 0xffL;
  *into++ = (*outof >> 24) & 0xffL;
  *into++ = (*outof >> 16) & 0xffL;
  *into++ = (*outof >>  8) & 0xffL;
  *into   =  *outof     & 0xffL;
}

static unsigned long SP1[64] = {
  0x01010400L, 0x00000000L, 0x00010000L, 0x01010404L,
  0x01010004L, 0x00010404L, 0x00000004L, 0x00010000L,
  0x00000400L, 0x01010400L, 0x01010404L, 0x00000400L,
  0x01000404L, 0x01010004L, 0x01000000L, 0x00000004L,
  0x00000404L, 0x01000400L, 0x01000400L, 0x00010400L,
  0x00010400L, 0x01010000L, 0x01010000L, 0x01000404L,
  0x00010004L, 0x01000004L, 0x01000004L, 0x00010004L,
  0x00000000L, 0x00000404L, 0x00010404L, 0x01000000L,
  0x00010000L, 0x01010404L, 0x00000004L, 0x01010000L,
  0x01010400L, 0x01000000L, 0x01000000L, 0x00000400L,
  0x01010004L, 0x00010000L, 0x00010400L, 0x01000004L,
  0x00000400L, 0x00000004L, 0x01000404L, 0x00010404L,
  0x01010404L, 0x00010004L, 0x01010000L, 0x01000404L,
  0x01000004L, 0x00000404L, 0x00010404L, 0x01010400L,
  0x00000404L, 0x01000400L, 0x01000400L, 0x00000000L,
  0x00010004L, 0x00010400L, 0x00000000L, 0x01010004L };

static unsigned long SP2[64] = {
  0x80108020L, 0x80008000L, 0x00008000L, 0x00108020L,
  0x00100000L, 0x00000020L, 0x80100020L, 0x80008020L,
  0x80000020L, 0x80108020L, 0x80108000L, 0x80000000L,
  0x80008000L, 0x00100000L, 0x00000020L, 0x80100020L,
  0x00108000L, 0x00100020L, 0x80008020L, 0x00000000L,
  0x80000000L, 0x00008000L, 0x00108020L, 0x80100000L,
  0x00100020L, 0x80000020L, 0x00000000L, 0x00108000L,
  0x00008020L, 0x80108000L, 0x80100000L, 0x00008020L,
  0x00000000L, 0x00108020L, 0x80100020L, 0x00100000L,
  0x80008020L, 0x80100000L, 0x80108000L, 0x00008000L,
  0x80100000L, 0x80008000L, 0x00000020L, 0x80108020L,
  0x00108020L, 0x00000020L, 0x00008000L, 0x80000000L,
  0x00008020L, 0x80108000L, 0x00100000L, 0x80000020L,
  0x00100020L, 0x80008020L, 0x80000020L, 0x00100020L,
  0x00108000L, 0x00000000L, 0x80008000L, 0x00008020L,
  0x80000000L, 0x80100020L, 0x80108020L, 0x00108000L };

static unsigned long SP3[64] = {
  0x00000208L, 0x08020200L, 0x00000000L, 0x08020008L,
  0x08000200L, 0x00000000L, 0x00020208L, 0x08000200L,
  0x00020008L, 0x08000008L, 0x08000008L, 0x00020000L,
  0x08020208L, 0x00020008L, 0x08020000L, 0x00000208L,
  0x08000000L, 0x00000008L, 0x08020200L, 0x00000200L,
  0x00020200L, 0x08020000L, 0x08020008L, 0x00020208L,
  0x08000208L, 0x00020200L, 0x00020000L, 0x08000208L,
  0x00000008L, 0x08020208L, 0x00000200L, 0x08000000L,
  0x08020200L, 0x08000000L, 0x00020008L, 0x00000208L,
  0x00020000L, 0x08020200L, 0x08000200L, 0x00000000L,
  0x00000200L, 0x00020008L, 0x08020208L, 0x08000200L,
  0x08000008L, 0x00000200L, 0x00000000L, 0x08020008L,
  0x08000208L, 0x00020000L, 0x08000000L, 0x08020208L,
  0x00000008L, 0x00020208L, 0x00020200L, 0x08000008L,
  0x08020000L, 0x08000208L, 0x00000208L, 0x08020000L,
  0x00020208L, 0x00000008L, 0x08020008L, 0x00020200L };

static unsigned long SP4[64] = {
  0x00802001L, 0x00002081L, 0x00002081L, 0x00000080L,
  0x00802080L, 0x00800081L, 0x00800001L, 0x00002001L,
  0x00000000L, 0x00802000L, 0x00802000L, 0x00802081L,
  0x00000081L, 0x00000000L, 0x00800080L, 0x00800001L,
  0x00000001L, 0x00002000L, 0x00800000L, 0x00802001L,
  0x00000080L, 0x00800000L, 0x00002001L, 0x00002080L,
  0x00800081L, 0x00000001L, 0x00002080L, 0x00800080L,
  0x00002000L, 0x00802080L, 0x00802081L, 0x00000081L,
  0x00800080L, 0x00800001L, 0x00802000L, 0x00802081L,
  0x00000081L, 0x00000000L, 0x00000000L, 0x00802000L,
  0x00002080L, 0x00800080L, 0x00800081L, 0x00000001L,
  0x00802001L, 0x00002081L, 0x00002081L, 0x00000080L,
  0x00802081L, 0x00000081L, 0x00000001L, 0x00002000L,
  0x00800001L, 0x00002001L, 0x00802080L, 0x00800081L,
  0x00002001L, 0x00002080L, 0x00800000L, 0x00802001L,
  0x00000080L, 0x00800000L, 0x00002000L, 0x00802080L };

static unsigned long SP5[64] = {
  0x00000100L, 0x02080100L, 0x02080000L, 0x42000100L,
  0x00080000L, 0x00000100L, 0x40000000L, 0x02080000L,
  0x40080100L, 0x00080000L, 0x02000100L, 0x40080100L,
  0x42000100L, 0x42080000L, 0x00080100L, 0x40000000L,
  0x02000000L, 0x40080000L, 0x40080000L, 0x00000000L,
  0x40000100L, 0x42080100L, 0x42080100L, 0x02000100L,
  0x42080000L, 0x40000100L, 0x00000000L, 0x42000000L,
  0x02080100L, 0x02000000L, 0x42000000L, 0x00080100L,
  0x00080000L, 0x42000100L, 0x00000100L, 0x02000000L,
  0x40000000L, 0x02080000L, 0x42000100L, 0x40080100L,
  0x02000100L, 0x40000000L, 0x42080000L, 0x02080100L,
  0x40080100L, 0x00000100L, 0x02000000L, 0x42080000L,
  0x42080100L, 0x00080100L, 0x42000000L, 0x42080100L,
  0x02080000L, 0x00000000L, 0x40080000L, 0x42000000L,
  0x00080100L, 0x02000100L, 0x40000100L, 0x00080000L,
  0x00000000L, 0x40080000L, 0x02080100L, 0x40000100L };

static unsigned long SP6[64] = {
  0x20000010L, 0x20400000L, 0x00004000L, 0x20404010L,
  0x20400000L, 0x00000010L, 0x20404010L, 0x00400000L,
  0x20004000L, 0x00404010L, 0x00400000L, 0x20000010L,
  0x00400010L, 0x20004000L, 0x20000000L, 0x00004010L,
  0x00000000L, 0x00400010L, 0x20004010L, 0x00004000L,
  0x00404000L, 0x20004010L, 0x00000010L, 0x20400010L,
  0x20400010L, 0x00000000L, 0x00404010L, 0x20404000L,
  0x00004010L, 0x00404000L, 0x20404000L, 0x20000000L,
  0x20004000L, 0x00000010L, 0x20400010L, 0x00404000L,
  0x20404010L, 0x00400000L, 0x00004010L, 0x20000010L,
  0x00400000L, 0x20004000L, 0x20000000L, 0x00004010L,
  0x20000010L, 0x20404010L, 0x00404000L, 0x20400000L,
  0x00404010L, 0x20404000L, 0x00000000L, 0x20400010L,
  0x00000010L, 0x00004000L, 0x20400000L, 0x00404010L,
  0x00004000L, 0x00400010L, 0x20004010L, 0x00000000L,
  0x20404000L, 0x20000000L, 0x00400010L, 0x20004010L };

static unsigned long SP7[64] = {
  0x00200000L, 0x04200002L, 0x04000802L, 0x00000000L,
  0x00000800L, 0x04000802L, 0x00200802L, 0x04200800L,
  0x04200802L, 0x00200000L, 0x00000000L, 0x04000002L,
  0x00000002L, 0x04000000L, 0x04200002L, 0x00000802L,
  0x04000800L, 0x00200802L, 0x00200002L, 0x04000800L,
  0x04000002L, 0x04200000L, 0x04200800L, 0x00200002L,
  0x04200000L, 0x00000800L, 0x00000802L, 0x04200802L,
  0x00200800L, 0x00000002L, 0x04000000L, 0x00200800L,
  0x04000000L, 0x00200800L, 0x00200000L, 0x04000802L,
  0x04000802L, 0x04200002L, 0x04200002L, 0x00000002L,
  0x00200002L, 0x04000000L, 0x04000800L, 0x00200000L,
  0x04200800L, 0x00000802L, 0x00200802L, 0x04200800L,
  0x00000802L, 0x04000002L, 0x04200802L, 0x04200000L,
  0x00200800L, 0x00000000L, 0x00000002L, 0x04200802L,
  0x00000000L, 0x00200802L, 0x04200000L, 0x00000800L,
  0x04000002L, 0x04000800L, 0x00000800L, 0x00200002L };

static unsigned long SP8[64] = {
  0x10001040L, 0x00001000L, 0x00040000L, 0x10041040L,
  0x10000000L, 0x10001040L, 0x00000040L, 0x10000000L,
  0x00040040L, 0x10040000L, 0x10041040L, 0x00041000L,
  0x10041000L, 0x00041040L, 0x00001000L, 0x00000040L,
  0x10040000L, 0x10000040L, 0x10001000L, 0x00001040L,
  0x00041000L, 0x00040040L, 0x10040040L, 0x10041000L,
  0x00001040L, 0x00000000L, 0x00000000L, 0x10040040L,
  0x10000040L, 0x10001000L, 0x00041040L, 0x00040000L,
  0x00041040L, 0x00040000L, 0x10041000L, 0x00001000L,
  0x00000040L, 0x10040040L, 0x00001000L, 0x00041040L,
  0x10001000L, 0x00000040L, 0x10000040L, 0x10040000L,
  0x10040040L, 0x10000000L, 0x00040000L, 0x10001040L,
  0x00000000L, 0x10041040L, 0x00040040L, 0x10000040L,
  0x10040000L, 0x10001000L, 0x10001040L, 0x00000000L,
  0x10041040L, 0x00041000L, 0x00041000L, 0x00001040L,
  0x00001040L, 0x00040040L, 0x10000000L, 0x10041000L };

static void desfunc(unsigned long *block, unsigned long *keys)  {
  register unsigned long fval, work, right, leftt;
  register int round;

  leftt = block[0];
  right = block[1];
  work = ((leftt >> 4) ^ right) & 0x0f0f0f0fL;
  right ^= work;
  leftt ^= (work << 4);
  work = ((leftt >> 16) ^ right) & 0x0000ffffL;
  right ^= work;
  leftt ^= (work << 16);
  work = ((right >> 2) ^ leftt) & 0x33333333L;
  leftt ^= work;
  right ^= (work << 2);
  work = ((right >> 8) ^ leftt) & 0x00ff00ffL;
  leftt ^= work;
  right ^= (work << 8);
  right = ((right << 1) | ((right >> 31) & 1L)) & 0xffffffffL;
  work = (leftt ^ right) & 0xaaaaaaaaL;
  leftt ^= work;
  right ^= work;
  leftt = ((leftt << 1) | ((leftt >> 31) & 1L)) & 0xffffffffL;

  for( round = 0; round < 8; round++ ) {
    work  = (right << 28) | (right >> 4);
    work ^= *keys++;
    fval  = SP7[ work             & 0x3fL];
    fval |= SP5[(work >>  8) & 0x3fL];
    fval |= SP3[(work >> 16) & 0x3fL];
    fval |= SP1[(work >> 24) & 0x3fL];
    work  = right ^ *keys++;
    fval |= SP8[ work             & 0x3fL];
    fval |= SP6[(work >>  8) & 0x3fL];
    fval |= SP4[(work >> 16) & 0x3fL];
    fval |= SP2[(work >> 24) & 0x3fL];
    leftt ^= fval;
    work  = (leftt << 28) | (leftt >> 4);
    work ^= *keys++;
    fval  = SP7[ work             & 0x3fL];
    fval |= SP5[(work >>  8) & 0x3fL];
    fval |= SP3[(work >> 16) & 0x3fL];
    fval |= SP1[(work >> 24) & 0x3fL];
    work  = leftt ^ *keys++;
    fval |= SP8[ work             & 0x3fL];
    fval |= SP6[(work >>  8) & 0x3fL];
    fval |= SP4[(work >> 16) & 0x3fL];
    fval |= SP2[(work >> 24) & 0x3fL];
    right ^= fval;
  }

  right = (right << 31) | (right >> 1);
  work = (leftt ^ right) & 0xaaaaaaaaL;
  leftt ^= work;
  right ^= work;
  leftt = (leftt << 31) | (leftt >> 1);
  work = ((leftt >> 8) ^ right) & 0x00ff00ffL;
  right ^= work;
  leftt ^= (work << 8);
  work = ((leftt >> 2) ^ right) & 0x33333333L;
  right ^= work;
  leftt ^= (work << 2);
  work = ((right >> 16) ^ leftt) & 0x0000ffffL;
  leftt ^= work;
  right ^= (work << 16);
  work = ((right >> 4) ^ leftt) & 0x0f0f0f0fL;
  leftt ^= work;
  right ^= (work << 4);
  *block++ = right;
  *block = leftt;
}

void des_key(des_ctx *dc, unsigned char *key){
  deskey(key,EN0);
  cpkey(dc->ek);
  deskey(key,DE1);
  cpkey(dc->dk);
}
void des_enc(des_ctx *dc, unsigned char *Data, int blocks){
  unsigned long work[2];
  int i;
  unsigned char *cp;

  cp = Data;
  for(i=0;i<blocks;i++){
    scrunch(cp,work);
    desfunc(work,dc->ek);
    unscrun(work,cp);
    cp+=8;
  }
}

void des_dec(des_ctx *dc, unsigned char *Data, int blocks){
  unsigned long work[2];
  int i;
  unsigned char *cp;

  cp = Data;
  for(i=0;i<blocks;i++){
    scrunch(cp,work);
    desfunc(work,dc->dk);
    unscrun(work,cp);
    cp+=8;
  }
}

/*****Strat CAN Config*****/

#define TXRTSCTRL 		0x0d
#define BFPCTRL			0x0c
#define CANCTRL			0x0f
#define CNF1 			0x2a
#define CNF2 			0x29
#define CNF3 			0x28

#define RXB0SIDH 		0x61
#define RXB0CTRL 		0x60
#define RXB0SIDL 		0x62
#define RXB0DLC		 	0x65
#define RXB0DB0			0x66

#define RXB1CTRL 		0x70

#define RXF0SIDH 		0x00
#define RXF0SIDL 		0x01

#define RXM0SIDH 		0x20
#define RXM0SIDL 		0x21
#define RXM0EID8 		0x22
#define RXM0EID0 		0x23

#define TXB0CTRL 		0x30
#define TXB0SIDH 		0x31
#define TXB0SIDL 		0x32
#define TXB0DLC			0x35
#define TXB0DB0			0x36

#define CANINTE 		0x2b
#define CANINTF			0x2c

struct CANBuffer{
	unsigned char id;
	unsigned char flag;
	unsigned char str[8];
	unsigned char number;				// Data length code
	unsigned char writeable;
};

struct HighBuffer{
	unsigned char id;
	unsigned char flag;
	unsigned char str[16];
	unsigned char index;
	unsigned char number;				// Data length code
	unsigned char writeable;
};

struct CANBuffer  Rx;					// Rx : Receive Buffer , Tx : Transmit Buffer
struct HighBuffer  Bx[3];					// Bx[0] : Data Receive HighBuffer , Bx[1] : Status Receive HighBuffer , Bx[2] : Transmit HighBuffer 
unsigned char  CANActive;				// Select Bus Activate
unsigned char  DeviceStatus;
unsigned char  status;
unsigned char  SequenceNumber;
unsigned char  ReceiveSequence;
int  OldSequence;

des_ctx dc;
char cp[8];
char key[8] = {0x3f, 0x48, 0xcb, 0xe9, 0x0a, 0x5d, 0x6d, 0xa1};
//char x[8];


/***********************************************************************************************/
/*                          Port map mcs51 to ctrl CAN                        				   */
/*																			  				   */
/*  P1.7	 P1.6    P1.5     P1.4     P1.3     P1.2     P1.1    P1.0          				   */
/* ^RST1    ^RST0    ^CS1     ^CS0     SX1       SX0      SI     SCK                                                  				   */
/***********************************************************************************************/

sbit reset1 = P1^7;
sbit reset0 = P1^6;
sbit CS1   = P1^5;
sbit CS0   = P1^4;
sbit SX1   = P1^3;
sbit SX0   = P1^2;
sbit SI    = P1^1;
sbit SCK   = P1^0;
sbit CERAM = P3^1;

void ShiftOut(unsigned char dbuf)
{
	unsigned char  i, x;
	for(i = 0; i < 8; i++)
	{		
		x = dbuf;
		x &= 0x80;
		switch(x) {						  
			case 0x80: SI = 1; break;
			case 0x00: SI = 0; break;
			default: SI = 1;				// All '1' Error
		}
		SCK = 0;    						// sck=0
		dbuf = dbuf<<1;						// shift data 1 bit
		SCK = 1;	    					// sck=1
	}
}

unsigned char ShiftIn(unsigned char number)
{
	unsigned char  i, x, dbuf = 0;
	for(i = 0; i < 8; i++)
	{
		SCK = 0;							// sck=0
		switch(number) {
			case 0: x = SX0;  break;
			case 1: x = SX1; break;
			default: x = 1; 				// All '1' Error
		}
		SCK = 1;							// sck=1
	    dbuf = dbuf << 1;					// shift data 1 bit
	    dbuf |= x;
	}
	return(dbuf);
}

unsigned char ReadByte(unsigned char addr, unsigned char number)
{
	unsigned char  dbuf;
	switch(number) {
		case 0: CS0 = 0; break;
		case 1: CS1 = 0; break;
		default: CS0 = CS1 = 1;				// All '1' Error
	}
	ShiftOut(0x03);							// send instruction
	ShiftOut(addr);							// send address
	dbuf=ShiftIn(number);					// receive data
	CS0 = CS1 = 1;							// CS=1
	return(dbuf);
}

void WriteByte(unsigned char addr1, unsigned char info, unsigned char number)
{
	switch(number) {
		case 0: CS0 = 0; break;
		case 1: CS1 = 0; break;
		default: CS0 = CS1 = 1;				// All '1' Error
	}
	ShiftOut(0x02);	       					// send instruction
	ShiftOut(addr1);	   					// send address
	ShiftOut(info);  		   				// send data
	CS0 = CS1 = 1;			       			// CS=1
}

void BitModify(unsigned char addr, unsigned char mask, unsigned char info, number)
{
	switch(number) {
		case 0: CS0 = 0; break;
		case 1: CS1 = 0; break;
		default: CS0 = CS1 = 1;				// All '1' Error
	}
	ShiftOut(0x05);							// send instruction
	ShiftOut(addr);							// send address
	ShiftOut(mask);							// send mask
	ShiftOut(info);							// send data
	CS0 = CS1 = 1;     						// CS1=1
}

void RequestToSend(unsigned char info, unsigned char number)
{
	switch(number) {
		case 0: CS0 = 0; break;
		case 1: CS1 = 0; break;
		default: CS0 = CS1 = 1;				// All '1' Error
	}
	ShiftOut(info);							// send instruction
	CS0 = CS1 = 1;	               			// CS1=1
}

unsigned char ReadStatus(unsigned char number)
{
	unsigned char  dbuf;
	switch(number) {
		case 0: CS0 = 0; break;
		case 1: CS1 = 0; break;
		default: CS0 = CS1 = 1;				// All '1' Error
	}
	ShiftOut(0xa0);							// send instruction
	dbuf = ShiftIn(number);					// receive data
	dbuf = ShiftIn(number);					// receive data again
	CS0 = CS1 = 1;							// CS=1
	return(dbuf);
}

void Delay(unsigned int count)
{
	unsigned char  i;
	while (count) {
		for (i = 1; i <= 113; i++);
		count--;
	}
}

void resetCAN0() {
	reset0 = 0; 
	Delay(5); 
	reset0 = 1;
}

void resetCAN1() {
	reset1 = 0; 
	Delay(5); 
	reset1 = 1;
}

void initCAN(unsigned char number) {
	WriteByte(CANCTRL, 0x80, number);					// 8 is set configuration mode,
    WriteByte(CNF1, 0x04, number);						// Baud rate prescaler
    WriteByte(CNF2, 0xf1, number);
    WriteByte(CNF3, 0x05, number);
	WriteByte(CANINTE, 0x01, number);					// Receive Buffer 0 Full Interrupt Enable
    WriteByte(TXRTSCTRL, 0x00, number);					// Pin control and status register : read as 0 when pin is in request to send mode, digital input
    WriteByte(RXB0CTRL, 0x04, number);					// Receive all valid message using either standard or extended identifies that meet fillter criteria, No remote tranfer request receive, roll over enable, acceptance filter 0
    WriteByte(RXB1CTRL, 0x00, number);					// Receive all valid message using either standard or extended identifies that meet fillter criteria, No remote tranfer request receive, acceptance filter 0
    WriteByte(RXF0SIDH, 0x82, number);					// Set acceptance filter n standard identifier high to all '1' s
    WriteByte(RXF0SIDL, 0xe0, number);					// Set acceptance filter n standard identifier low to all '1' s
    WriteByte(RXM0SIDH, 0xff, number);					// Set acceptance filter mask n standard identifier high all '0' s so filter must not match every bit
    WriteByte(RXM0SIDL, 0x00, number);					// Set acceptance filter mask n standard identifier low all '0' s so filter must not match every bit
    WriteByte(RXM0EID8, 0x00, number);					// Set acceptance filter mask n extended identifier high all '0' s so filter must not match every bit
    WriteByte(RXM0EID0, 0x00, number);					// Set acceptance filter mask n extended identifier low all '0' s so filter must not match every bit
    WriteByte(TXB0CTRL, 0x03, number);					// Transmit buffer n control register : Highest message priority
    WriteByte(CANCTRL, 0x00, number);					// 0x00 : Normal Mode, 0x40 : Loop back Mode
}

void OutInvPortService(unsigned char select, unsigned char dataitem) {
	unsigned char P0TMP, P2TMP;
	P0TMP = P0;
	P2TMP = P2;
	CERAM = 0;
	P2 = select;
	P0 = ~dataitem;
	CERAM = 1;
	P0 = P0TMP;
	P2 = P2TMP;
}

void StatusReportService(unsigned char type, unsigned char description) {

	unsigned int checksum;
	unsigned char i;

	Bx[2].id = 0x02;								// ID = 2
	Bx[2].flag = 0x40;								// Status Protocol
	Bx[2].str[3] = type;
	Bx[2].str[4] = description;
	checksum = 0;
	checksum += Bx[2].str[3];
	checksum += Bx[2].str[4];
	checksum ^= 0x0ffff;
	checksum += 1;
	Bx[2].str[0] = ++SequenceNumber;
	Bx[2].str[1] = (checksum / 256);				// Checksum
	Bx[2].str[2] = (checksum % 256);
	for (i = 5; i < 8; i++) {
		Bx[2].str[i] = 0;
	}
	Bx[2].number = 8;								// Send only 8 Byte
	
	for (i = 0; i < 8; i++) {
		cp[i] = Bx[2].str[i];
	}

	des_enc(&dc,cp,1);								// Encryp Data

	for(i = 0; i < 8; i++) {
		Bx[2].str[i] = cp[i];
	}

	Bx[2].writeable = 0;
}

void init() {
	unsigned char  i, j;

	OutInvPortService(0x10, 0x00);
	OutInvPortService(0x20, 0x00);
	OutInvPortService(0x30, 0x00);
	Delay(500);
	OutInvPortService(0x10, 0xff);
	Delay(500);
	OutInvPortService(0x10, 0x00);
	OutInvPortService(0x20, 0xff);
	Delay(500);
	OutInvPortService(0x20, 0x00);
	OutInvPortService(0x30, 0xff);
	Delay(500);
	OutInvPortService(0x30, 0x00);						
	OutInvPortService(0x10, 0xbf);				       	// 11011111b  // Code 0 : Normal

	resetCAN0();
	resetCAN1();
	initCAN(0);
	initCAN(1);
	
	CANActive = 0;
	SequenceNumber = -1;
	ReceiveSequence = 0;
	OldSequence = -1;
	
	Rx.id = 0;											// initial All Buffer
	Rx.flag = 0;
	Rx.number = 0;
	Rx.writeable = 1;
	for(i = 0; i<8; i++) {
		Rx.str[i] = 0;
	}

	for(i = 0; i < 3; i++) {
		Bx[i].id = 0;
		Bx[i].flag = 0;
		Bx[i].index = 0;
		Bx[i].number = 0;
		Bx[i].writeable = 1;							// 1 : can write (can't read), 0 : can read (can't write)
		for(j = 0; j<16; j++)
			Bx[i].str[j] = 0;
	}

	DeviceStatus = 0x03;								// CAN 0 Active

	StatusReportService(0x00, DeviceStatus);			// Status Protocol
}

unsigned char TryChecksum(struct HighBuffer Bx) {
	
	unsigned char  i;
	unsigned int checksum;

	checksum = 0;

	if ((Bx.flag & 0x40) == 0x00) {
		checksum += Bx.str[0];
		checksum += (Bx.str[1] * 256);
		for (i = 2; i < 16; i++) {
			checksum += Bx.str[i];
		}	
	}
	else {
		checksum += (Bx.str[0] * 256);
		for (i = 1; i < 16; i++) {
			checksum += Bx.str[i];
		}	
	}
	
	if (checksum == 0x00)
		return 1;
	else 
		return 0;
}

void TrySequence(unsigned char seqnum) {
	if ((seqnum - ReceiveSequence) == 1) {
		ReceiveSequence = seqnum;
	}
	else {
		OutInvPortService(0x10, 0x86);						         // Code 1 : Bad Sequence number
		Delay(100);
		ReceiveSequence = seqnum;	
	}
}

unsigned char InsertData(struct CANBuffer Rx) {
	unsigned char i, type, insertOK;
	
	insertOK = 1;

	if ((Rx.flag & 0x40) == 0x00){
		type = 0;
	}
	else {
		type = 1;
	}

	if (Bx[type].writeable == 1) {									// is Data Receive HighLayer Empty ?
		Bx[type].id = Rx.id;
		Bx[type].flag = Rx.flag;
		for(i = 1; i < Rx.number; i++) {                            // Don't care Sequence Number
			if (Bx[type].index > 15) {
				Bx[type].index = 0;									// Clear Data in Bx[x]
				insertOK = 0;
				OutInvPortService(0x10, 0xdb);						// Buffer Overflow Code : 2 // 10111011
				Delay(100);
				break;
			}
			Bx[type].str[Bx[type].index] = Rx.str[i];
			++Bx[type].index;
		}
		if (insertOK == 1) {

			OutInvPortService(0x10, 0xbf);					    	// Code 0 : Normal	

			if ((Rx.flag & 0x80) == 0x00) {							// is More Frame flag = 0
				Bx[type].writeable = 0;
			}

			for (i = Bx[type].index; i < 16; i++) {
				Bx[type].str[i] = 0;
			}

		}
		return 1;										         	// Insert Complete clear RX Flag after this
	}
	else {
		return 0;													// Insert not Complete. don't clear RX Flag
	}
}

void CANReception(unsigned char number) {

	unsigned char  i, j, rxnum;
	unsigned char  chipselect;

	for (j = 0; j < 2; j++) {
		if (j == 0) { 
			chipselect = 0; 										// RX0
		}
		else { 
			chipselect = 0x10;										// RX1
		}

		status = ReadStatus(number); 
		OutInvPortService(0x20, status);
		OutInvPortService(0x30, ReadByte(CANINTF, number));
		for (rxnum = 1; rxnum < 3; rxnum++) {
			if((status & rxnum) == rxnum) 										//if rx 0, 1 had been recived data
			{
				Rx.id = ReadByte(RXB0SIDH + chipselect, number);				//read SIDH as ID
				Rx.flag = ReadByte(RXB0SIDL + chipselect, number);
				Rx.flag &= 0xe0;
				Rx.number = ReadByte(RXB0DLC + chipselect, number);
				Rx.number &= 0x0f;
				if (Rx.number == 8) {

					for(i = 0; i < Rx.number; i++)			
					{
						Rx.str[i] = ReadByte(RXB0DB0 + i + chipselect, number);	//Get data
					}
					
					for (i = 0; i < 8; i++) {
						cp[i] = Rx.str[i];
					}

					des_dec(&dc,cp,1);								            // Decryp Data

					for(i = 0; i < 8; i++)			
					{
						Rx.str[i] = cp[i];
					}

					TrySequence(Rx.str[0]);

					if ((number == 0) && (CANActive == 1)) {
						CANActive = 0;
						DeviceStatus = 0x03;
						OutInvPortService(0x10, 0xdb);   						// Code : 2 CAN 1 Active
						Delay(100);
					}
					
					if ((number == 1) && (CANActive == 0)) {
						CANActive = 1;
						DeviceStatus = 0x05;
						OutInvPortService(0x10, 0xcf);   						// Code : 3	CAN 0 Active
						Delay(100);
					}
		
					if (InsertData(Rx) == 1) {
						BitModify(CANINTF, rxnum, 0, CANActive);	
					}
				}

				else {
					OutInvPortService(0x10, 0xed);								// Error Code 5 : Damage Frame
					BitModify(CANINTF, rxnum, 0, number);
					Delay(100);
				}
			}
		}
	}
}

void TryDo() {

	if (Bx[0].writeable == 0) {									
		Bx[0].writeable = 1;
		Bx[0].index = 0;
		if (TryChecksum(Bx[0]) == 1) {
			StatusReportService(0x02, ReceiveSequence);			// Send Acknowledge Frame 
		}
		else {													// Data Error -> Report Error use Status Protocol Type 1
			OutInvPortService(0x10, 0xff);						// 11100110 Code 8 : Checksum Error
			Delay(100);
			StatusReportService(0x01, ReceiveSequence);			// Status protocol, Type 1
		} 
	}
}

void TryStatus() {
	
	if (Bx[1].writeable == 0) {									// is Status Frame ?
		Bx[1].writeable = 1;
		Bx[1].index = 0;
		if (TryChecksum(Bx[1]) == 1) {							
			if (Bx[1].str[2] == 0x01) {							// is Status Type 1 : Data Error
				OutInvPortService(0x10, 0xe6);					// 11100110 Code 4 : Data Error
				Delay(100);
			}
			else if (Bx[1].str[2] == 0x03) {					// Status Protocol, Type 3 : Request Status
				StatusReportService(0x00, DeviceStatus);
			}
			else if (Bx[1].str[2] == 0x04) {					// Type 4 : Chang Bus
				if (Bx[1].str[2] > -1 && Bx[1].str[2] < 2) {
					CANActive = Bx[1].str[3];
					if (Bx[1].str[3] == 0x00) {
						DeviceStatus = 0x03;
					}
					else if (Bx[1].str[3] == 0x01) {
						DeviceStatus = 0x05;
					}
				}
			}
		}
		else {													// Data Error -> Report Error use Status Protocol Type 1
			OutInvPortService(0x10, 0xff);						// 11100110 Code 8 : Checksum Error
			Delay(100);
			StatusReportService(0x01, ReceiveSequence);		    // Status Protocol, Type 1
		} 
	}
}

void CANTransmission() {
	
	unsigned char  i,count;

	count = 0;
	
	status = ReadStatus(CANActive); 
	OutInvPortService(0x20, status);
	OutInvPortService(0x30, ReadByte(CANINTF, CANActive));
																			// Send data 8 Byte at 100 Kbit used time = 1.11 mSec	
	while((ReadStatus(CANActive) & 0x04) == 0x04) {							// loop for Tx buffer is Empty  // used 0.51649 mSec
		++count;
		if (count > 200) {													// if Can't Send Data within 100 ms
			if (CANActive == 0) {
				DeviceStatus = 0x05;										
				CANActive = 1;												// CAN 1 Activate assume CAN 0 fail
				OutInvPortService(0x10, 0xdb);   							// Code : 2 CAN 1 Active
				StatusReportService(0x04, 0x01);
				resetCAN0();
				initCAN(0);
				break;
			}
			else if ((CANActive == 1)){
				DeviceStatus = 0x03;
				CANActive = 0;
				OutInvPortService(0x10, 0xcf);   							// Code : 3	CAN 0 Active
				StatusReportService(0x04, 0x00);
				resetCAN1();
				initCAN(1);
				break;
			}
		}
	}

	status = ReadStatus(CANActive); 
	OutInvPortService(0x20, status);
	OutInvPortService(0x30, ReadByte(CANINTF, CANActive));

	if ((status & 0x08) == 0x08) {
		BitModify(CANINTF, 0x04, 0, CANActive);
	}

	if (Bx[2].writeable == 0){												// if Transmit HighBuffer got message to send
		WriteByte(TXB0SIDH, 0x02, CANActive);							    // Alway use ID 2
		WriteByte(TXB0SIDL, 0x7f & Bx[2].flag, CANActive);					// flag is no more frame + protocol
	 	WriteByte(TXB0DLC, 8, CANActive);                                   // Alway Send 8 Byte
		for(i = 0; i < 8; i++) {
			WriteByte(TXB0DB0 + i, Bx[2].str[i], CANActive);
		}
		RequestToSend(0x81, CANActive);
		if ((Bx[2].flag & 0x40) == 0x00) {
			OldSequence = SequenceNumber;
		}
		Bx[2].writeable = 1;
		Bx[2].index = 0;
	}
}

void main()
{

	des_key(&dc,key);

	init();

	while(1)
	{
		CANReception(0);
		CANReception(1);
		TryDo();
		TryStatus();
		CANTransmission();
	}
}

/*
Code 0 : 0xbf : 10111111
Code 1 : 0x86 : 10000110
Code 2 : 0xdb : 11011011
Code 3 : 0xcf : 11001111
Code 4 : 0xe6 : 11100110
Code 5 : 0xed : 11101101
Code 6 : 0xfd : 11111101
Code 7 : 0x87 : 10000111
Code 8 : 0xff : 11111111
code 9 : 0xef : 11101111
*/
