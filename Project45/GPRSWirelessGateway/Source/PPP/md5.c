#ifdef  ALLOWCHAP

/*
 ***********************************************************************
 ** md5.c -- the source code for MD5 routines                         **
 ** RSA Data Security, Inc. MD5 Message-Digest Algorithm              **
 ** Created: 2/17/90 RLR                                              **
 ** Revised: 1/91 SRD,AJ,BSK,JT Reference C ver., 7/10 constant corr. **
 ***********************************************************************
 */

/*
 ***********************************************************************
 ** Copyright (C) 1990, RSA Data Security, Inc. All rights reserved.  **
 **                                                                   **
 ** License to copy and use this software is granted provided that    **
 ** it is identified as the "RSA Data Security, Inc. MD5 Message-     **
 ** Digest Algorithm" in all material mentioning or referencing this  **
 ** software or this function.                                        **
 **                                                                   **
 ** License is also granted to make and use derivative works          **
 ** provided that such works are identified as "derived from the RSA  **
 ** Data Security, Inc. MD5 Message-Digest Algorithm" in all          **
 ** material mentioning or referencing the derived work.              **
 **                                                                   **
 ** RSA Data Security, Inc. makes no representations concerning       **
 ** either the merchantability of this software or the suitability    **
 ** of this software for any particular purpose.  It is provided "as  **
 ** is" without express or implied warranty of any kind.              **
 **                                                                   **
 ** These notices must be retained in any copies of any part of this  **
 ** documentation and/or software.                                    **
 ***********************************************************************
 */

#include "md5.h"

/*
 ***********************************************************************
 **  Message-digest routines:                                         **
 **  To form the message digest for a message M                       **
 **    (1) Initialize a context buffer mdContext using MD5Init        **
 **    (2) Call MD5Update on mdContext and M                          **
 **    (3) Call MD5Final on mdContext                                 **
 **  The message digest is now in mdContext->digest[0...15]           **
 ***********************************************************************
 */

/* forward declaration */
static void Transform (UINT4 *, UINT4 *);

static unsigned char PADDING[64] = {
  0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

/* F, G, H and I are basic MD5 functions */
#define F(x, y, z) (((x) & (y)) | ((~x) & (z)))
#define G(x, y, z) (((x) & (z)) | ((y) & (~z)))
#define H(x, y, z) ((x) ^ (y) ^ (z))
#define I(x, y, z) ((y) ^ ((x) | (~z)))

/* ROTATE_LEFT rotates x left n bits */
/*
#define ROTATE_LEFT(x, n) (((x) << (n)) | ((x) >> (32-(n))))
*/
UINT4 _fastcall rolc(UINT4 v, int n);
#define ROTATE_LEFT(x, n) rolc(x, n)

/* FF, GG, HH, and II transformations for rounds 1, 2, 3, and 4 */
/* Rotation is separate from addition to prevent recomputation */
#define FF(a, b, c, d, x, s, ac) \
  {(a) += F ((b), (c), (d)) + (x) + (UINT4)(ac); \
   (a) = ROTATE_LEFT ((a), (s)); \
   (a) += (b); \
  }
#define GG(a, b, c, d, x, s, ac) \
  {(a) += G ((b), (c), (d)) + (x) + (UINT4)(ac); \
   (a) = ROTATE_LEFT ((a), (s)); \
   (a) += (b); \
  }
#define HH(a, b, c, d, x, s, ac) \
  {(a) += H ((b), (c), (d)) + (x) + (UINT4)(ac); \
   (a) = ROTATE_LEFT ((a), (s)); \
   (a) += (b); \
  }
#define II(a, b, c, d, x, s, ac) \
  {(a) += I ((b), (c), (d)) + (x) + (UINT4)(ac); \
   (a) = ROTATE_LEFT ((a), (s)); \
   (a) += (b); \
  }

#define UL(x)	x##LU

/* The routine MD5Init initializes the message-digest context
   mdContext. All fields are set to zero.
 */
void MD5Init(MD5_CTX *mdContext)
{
  mdContext->i[0] = mdContext->i[1] = (UINT4)0;

  /* Load magic initialization constants.
   */
  mdContext->buf[0] = UL(0x67452301);
  mdContext->buf[1] = UL(0xefcdab89);
  mdContext->buf[2] = UL(0x98badcfe);
  mdContext->buf[3] = UL(0x10325476);
}

/* The routine MD5Update updates the message-digest context to
   account for the presence of each of the characters inBuf[0..inLen-1]
   in the message whose digest is being computed.
 */
void MD5Update(MD5_CTX *mdContext, unsigned char *inBuf, unsigned int inLen)
{
  UINT4 in[16];
  int mdi;
  unsigned int i, ii;

  /* compute number of bytes mod 64 */
  mdi = (int)((mdContext->i[0] >> 3) & 0x3F);

  /* update number of bits */
  if ((mdContext->i[0] + ((UINT4)inLen << 3)) < mdContext->i[0])
    mdContext->i[1]++;

  mdContext->i[0] += ((UINT4)inLen << 3);
  mdContext->i[1] += ((UINT4)inLen >> 29);

  while (inLen--) {
    /* add new character to buffer, increment mdi */
    mdContext->in[mdi++] = *inBuf++;

    /* transform if necessary */
    if (mdi == 0x40) {
      for (i = 0, ii = 0; i < 16; i++, ii += 4)
	in[i] = *((UINT4 *)&(mdContext->in[ii]));

      Transform (mdContext->buf, in);
      mdi = 0;
    }
  }
}

/* The routine MD5Final terminates the message-digest computation and
   ends with the desired message digest in mdContext->digest[0...15].
 */
void MD5Final(MD5_CTX *mdContext)
{
  UINT4 in[16];
  int mdi;
  unsigned int i, ii;
  unsigned int padLen;

  /* save number of bits */
  in[14] = mdContext->i[0];
  in[15] = mdContext->i[1];

  /* compute number of bytes mod 64 */
  mdi = (int)((mdContext->i[0] >> 3) & 0x3F);

  /* pad out to 56 mod 64 */
  padLen = (mdi < 56) ? (56 - mdi) : (120 - mdi);
  MD5Update (mdContext, PADDING, padLen);

  /* append length in bits and transform */
  for (i = 0, ii = 0; i < 14; i++, ii += 4)
    in[i] = *((UINT4 *)&(mdContext->in[ii]));

  Transform (mdContext->buf, in);

  /* store buffer in digest */
  for (i = 0, ii = 0; i < 4; i++, ii += 4) {
    *((UINT4 *)&(mdContext->digest[ii])) = mdContext->buf[i];
  }
}

typedef struct {
    UINT4 *p1, *p2, *p3, *p4;
    unsigned char inidx, Sval;
    UINT4 num;
} STEPD;

static UINT4 a, b, c, d;

#define S11 7
#define S12 12
#define S13 17
#define S14 22

STEPD FFdesc[] = {
  { &a, &b, &c, &d,  0, S11, UL(3614090360) }, /*  1 */
  { &d, &a, &b, &c,  1, S12, UL(3905402710) }, /*  2 */
  { &c, &d, &a, &b,  2, S13, UL( 606105819) }, /*  3 */
  { &b, &c, &d, &a,  3, S14, UL(3250441966) }, /*  4 */
  { &a, &b, &c, &d,  4, S11, UL(4118548399) }, /*  5 */
  { &d, &a, &b, &c,  5, S12, UL(1200080426) }, /*  6 */
  { &c, &d, &a, &b,  6, S13, UL(2821735955) }, /*  7 */
  { &b, &c, &d, &a,  7, S14, UL(4249261313) }, /*  8 */
  { &a, &b, &c, &d,  8, S11, UL(1770035416) }, /*  9 */
  { &d, &a, &b, &c,  9, S12, UL(2336552879) }, /* 10 */
  { &c, &d, &a, &b, 10, S13, UL(4294925233) }, /* 11 */
  { &b, &c, &d, &a, 11, S14, UL(2304563134) }, /* 12 */
  { &a, &b, &c, &d, 12, S11, UL(1804603682) }, /* 13 */
  { &d, &a, &b, &c, 13, S12, UL(4254626195) }, /* 14 */
  { &c, &d, &a, &b, 14, S13, UL(2792965006) }, /* 15 */
  { &b, &c, &d, &a, 15, S14, UL(1236535329) }  /* 16 */
};

#define S21 5
#define S22 9
#define S23 14
#define S24 20

STEPD GGdesc[] = {
  { &a, &b, &c, &d,  1, S21, UL(4129170786) }, /* 17 */
  { &d, &a, &b, &c,  6, S22, UL(3225465664) }, /* 18 */
  { &c, &d, &a, &b, 11, S23, UL( 643717713) }, /* 19 */
  { &b, &c, &d, &a,  0, S24, UL(3921069994) }, /* 20 */
  { &a, &b, &c, &d,  5, S21, UL(3593408605) }, /* 21 */
  { &d, &a, &b, &c, 10, S22, UL(  38016083) }, /* 22 */
  { &c, &d, &a, &b, 15, S23, UL(3634488961) }, /* 23 */
  { &b, &c, &d, &a,  4, S24, UL(3889429448) }, /* 24 */
  { &a, &b, &c, &d,  9, S21, UL( 568446438) }, /* 25 */
  { &d, &a, &b, &c, 14, S22, UL(3275163606) }, /* 26 */
  { &c, &d, &a, &b,  3, S23, UL(4107603335) }, /* 27 */
  { &b, &c, &d, &a,  8, S24, UL(1163531501) }, /* 28 */
  { &a, &b, &c, &d, 13, S21, UL(2850285829) }, /* 29 */
  { &d, &a, &b, &c,  2, S22, UL(4243563512) }, /* 30 */
  { &c, &d, &a, &b,  7, S23, UL(1735328473) }, /* 31 */
  { &b, &c, &d, &a, 12, S24, UL(2368359562) }  /* 32 */
};

#define S31 4
#define S32 11
#define S33 16
#define S34 23

STEPD HHdesc[] = {
  { &a, &b, &c, &d,  5, S31, UL(4294588738) }, /* 33 */
  { &d, &a, &b, &c,  8, S32, UL(2272392833) }, /* 34 */
  { &c, &d, &a, &b, 11, S33, UL(1839030562) }, /* 35 */
  { &b, &c, &d, &a, 14, S34, UL(4259657740) }, /* 36 */
  { &a, &b, &c, &d,  1, S31, UL(2763975236) }, /* 37 */
  { &d, &a, &b, &c,  4, S32, UL(1272893353) }, /* 38 */
  { &c, &d, &a, &b,  7, S33, UL(4139469664) }, /* 39 */
  { &b, &c, &d, &a, 10, S34, UL(3200236656) }, /* 40 */
  { &a, &b, &c, &d, 13, S31, UL( 681279174) }, /* 41 */
  { &d, &a, &b, &c,  0, S32, UL(3936430074) }, /* 42 */
  { &c, &d, &a, &b,  3, S33, UL(3572445317) }, /* 43 */
  { &b, &c, &d, &a,  6, S34, UL(  76029189) }, /* 44 */
  { &a, &b, &c, &d,  9, S31, UL(3654602809) }, /* 45 */
  { &d, &a, &b, &c, 12, S32, UL(3873151461) }, /* 46 */
  { &c, &d, &a, &b, 15, S33, UL( 530742520) }, /* 47 */
  { &b, &c, &d, &a,  2, S34, UL(3299628645) }  /* 48 */
};

#define S41 6
#define S42 10
#define S43 15
#define S44 21

STEPD IIdesc[] = {
  { &a, &b, &c, &d,  0, S41, UL(4096336452) }, /* 49 */
  { &d, &a, &b, &c,  7, S42, UL(1126891415) }, /* 50 */
  { &c, &d, &a, &b, 14, S43, UL(2878612391) }, /* 51 */
  { &b, &c, &d, &a,  5, S44, UL(4237533241) }, /* 52 */
  { &a, &b, &c, &d, 12, S41, UL(1700485571) }, /* 53 */
  { &d, &a, &b, &c,  3, S42, UL(2399980690) }, /* 54 */
  { &c, &d, &a, &b, 10, S43, UL(4293915773) }, /* 55 */
  { &b, &c, &d, &a,  1, S44, UL(2240044497) }, /* 56 */
  { &a, &b, &c, &d,  8, S41, UL(1873313359) }, /* 57 */
  { &d, &a, &b, &c, 15, S42, UL(4264355552) }, /* 58 */
  { &c, &d, &a, &b,  6, S43, UL(2734768916) }, /* 59 */
  { &b, &c, &d, &a, 13, S44, UL(1309151649) }, /* 60 */
  { &a, &b, &c, &d,  4, S41, UL(4149444226) }, /* 61 */
  { &d, &a, &b, &c, 11, S42, UL(3174756917) }, /* 62 */
  { &c, &d, &a, &b,  2, S43, UL( 718787259) }, /* 63 */
  { &b, &c, &d, &a,  9, S44, UL(3951481745) }  /* 64 */
};

/* Basic MD5 step. Transforms buf based on in.
 */
static void Transform(UINT4 *buf, UINT4 *in)
{
  int i;
  STEPD *sp;
  UINT4 *p1, *p2, *p3, *p4;

  a = buf[0]; b = buf[1]; c = buf[2]; d = buf[3];

  /* Round 1 */
  for ( i = 0, sp = FFdesc ; i < 16 ; ++i, ++sp ) {
    p1 = sp->p1; p2 = sp->p2; p3 = sp->p3; p4 = sp->p4;
    FF ( *p1, *p2, *p3, *p4, in[sp->inidx], sp->Sval, sp->num);
  }

  /* Round 2 */
  for ( i = 0, sp = GGdesc ; i < 16 ; ++i, ++sp ) {
    p1 = sp->p1; p2 = sp->p2; p3 = sp->p3; p4 = sp->p4;
    GG ( *p1, *p2, *p3, *p4, in[sp->inidx], sp->Sval, sp->num);
  }

  /* Round 3 */
  for ( i = 0, sp = HHdesc ; i < 16 ; ++i, ++sp ) {
    p1 = sp->p1; p2 = sp->p2; p3 = sp->p3; p4 = sp->p4;
    HH ( *p1, *p2, *p3, *p4, in[sp->inidx], sp->Sval, sp->num);
  }

  /* Round 4 */
  for ( i = 0, sp = IIdesc ; i < 16 ; ++i, ++sp ) {
    p1 = sp->p1; p2 = sp->p2; p3 = sp->p3; p4 = sp->p4;
    II ( *p1, *p2, *p3, *p4, in[sp->inidx], sp->Sval, sp->num);
  }

  buf[0] += a;
  buf[1] += b;
  buf[2] += c;
  buf[3] += d;
}

/*
 ***********************************************************************
 ** End of md5.c                                                      **
 ******************************** (cut) ********************************
 */

#endif  /* ALLOWCHAP */
