/* Implementation is based-on destest.c from libdes
 * to be des_check in ems's xenior project
 * 1. use whole descheck.c to check if libdes work proper
 * 2. inplement interactive check (keyboard input and output 
 *    correspond to input data
 */


#if defined(WIN32) || defined(WIN16) || defined(WINDOWS)
#ifndef MSDOS
#define MSDOS
#endif
#endif

#include <stdio.h>
#include <stdlib.h>
#ifndef MSDOS
#include <unistd.h>
#else
#include <io.h>
#endif
#include <string.h>
#include "libdes/des.h"

#define DEBUG 1
#undef DEBUG

int inhex(unsigned char ch); // verify if input is valid or not 
static char *pt(); 
void swap7(unsigned char* swaped, unsigned char* data7); // swap msb->lsb,... 
void swap8(unsigned char* swaped, unsigned char* data8); // swap msb->lsb,...
void changedata7to8(unsigned char* data7, unsigned char* data8);
// fill parity bit, for now i fix them at '0'
unsigned char change_type(unsigned char mch, unsigned char lch);
// change data from string input to be Hexa-decimal


int inhex(unsigned char ch) {
	if (ch>='0' && ch<='9')
		return 0;
	else if ( ch>='a' && ch<='f')
		return 1;
	else if ( ch>='A' && ch<='F')
		return 2;
	else return -1;
}


// swap[0] mean data(55 downto 48) in my mind.
//  user input will arrange like this
//  data[0],data[1]....
void swap7(unsigned char* swaped, unsigned char* data7) {
	memset(swaped, 0, 7);
	swaped[0] |= (((data7[6] & 0x01)<<7) | ((data7[6] & 0x02)<<5) | \
			((data7[6] & 0x04)<<3) | ((data7[6] & 0x08)<<1) | \
			((data7[6] & 0x10)>>1) | ((data7[6] & 0x20)>>3) | \
			((data7[6] & 0x40)>>5) | ((data7[6] & 0x80)>>7) );
	swaped[1] |= (((data7[5] & 0x01)<<7) | ((data7[5] & 0x02)<<5) | \
			((data7[5] & 0x04)<<3) | ((data7[5] & 0x08)<<1) | \
			((data7[5] & 0x10)>>1) | ((data7[5] & 0x20)>>3) | \
			((data7[5] & 0x40)>>5) | ((data7[5] & 0x80)>>7) );
	swaped[2] |= (((data7[4] & 0x01)<<7) | ((data7[4] & 0x02)<<5) | \
			((data7[4] & 0x04)<<3) | ((data7[4] & 0x08)<<1) | \
			((data7[4] & 0x10)>>1) | ((data7[4] & 0x20)>>3) | \
			((data7[4] & 0x40)>>5) | ((data7[4] & 0x80)>>7) );
	
	swaped[3] |= (((data7[3] & 0x01)<<7) | ((data7[6] & 0x02)<<5) | \
			((data7[4] & 0x04)<<3) | ((data7[6] & 0x08)<<1) | \
			((data7[4] & 0x10)>>1) | ((data7[6] & 0x20)>>5) | \
			((data7[4] & 0x40)>>5) | ((data7[6] & 0x80)>>7) );

	swaped[4] |= (((data7[2] & 0x01)<<7) | ((data7[2] & 0x02)<<5) | \
			((data7[2] & 0x04)<<3) | ((data7[2] & 0x08)<<1) | \
			((data7[2] & 0x10)>>1) | ((data7[2] & 0x20)>>3) | \
			((data7[2] & 0x40)>>5) | ((data7[2] & 0x80)>>7) );
	swaped[5] |= (((data7[1] & 0x01)<<7) | ((data7[1] & 0x02)<<5) | \
			((data7[1] & 0x04)<<3) | ((data7[1] & 0x08)<<1) | \
			((data7[1] & 0x10)>>1) | ((data7[1] & 0x20)>>3) | \
			((data7[1] & 0x40)>>5) | ((data7[1] & 0x80)>>7) );
	swaped[6] |= (((data7[0] & 0x01)<<7) | ((data7[0] & 0x02)<<5) | \
			((data7[0] & 0x04)<<3) | ((data7[0] & 0x08)<<1) | \
			((data7[0] & 0x10)>>1) | ((data7[0] & 0x20)>>3) | \
			((data7[0] & 0x40)>>5) | ((data7[0] & 0x80)>>7) );

	memcpy(data7, swaped, 7);
}


// everything work as in swap7{} except
// swaped data will be 8-bytes format
void swap8(unsigned char* swaped, unsigned char* data8) {
	memset(swaped, 0, 8);
	swaped[0] |= (((data8[7] & 0x01)<<7) | ((data8[7] & 0x02)<<5) | \
			((data8[7] & 0x04)<<3) | ((data8[7] & 0x08)<<1) | \
			((data8[7] & 0x10)>>1) | ((data8[7] & 0x20)>>3) | \
			((data8[7] & 0x40)>>5) | ((data8[7] & 0x80)>>7) );
	swaped[1] |= (((data8[6] & 0x01)<<7) | ((data8[6] & 0x02)<<5) | \
			((data8[6] & 0x04)<<3) | ((data8[6] & 0x08)<<1) | \
			((data8[6] & 0x10)>>1) | ((data8[6] & 0x20)>>3) | \
			((data8[6] & 0x40)>>5) | ((data8[6] & 0x80)>>7) );
	swaped[2] |= (((data8[5] & 0x01)<<7) | ((data8[5] & 0x02)<<5) | \
			((data8[5] & 0x04)<<3) | ((data8[5] & 0x08)<<1) | \
			((data8[5] & 0x10)>>1) | ((data8[5] & 0x20)>>3) | \
			((data8[5] & 0x40)>>5) | ((data8[5] & 0x80)>>7) );
	swaped[3] |= (((data8[4] & 0x01)<<7) | ((data8[4] & 0x02)<<5) | \
			((data8[4] & 0x04)<<3) | ((data8[4] & 0x08)<<1) | \
			((data8[4] & 0x10)>>1) | ((data8[4] & 0x20)>>5) | \
			((data8[4] & 0x40)>>5) | ((data8[4] & 0x80)>>7) );
	swaped[4] |= (((data8[3] & 0x01)<<7) | ((data8[3] & 0x02)<<5) | \
			((data8[3] & 0x04)<<3) | ((data8[3] & 0x08)<<1) | \
			((data8[3] & 0x10)>>1) | ((data8[3] & 0x20)>>3) | \
			((data8[3] & 0x40)>>5) | ((data8[3] & 0x80)>>7) );
	swaped[5] |= (((data8[2] & 0x01)<<7) | ((data8[2] & 0x02)<<5) | \
			((data8[2] & 0x04)<<3) | ((data8[2] & 0x08)<<1) | \
			((data8[2] & 0x10)>>1) | ((data8[2] & 0x20)>>3) | \
			((data8[2] & 0x40)>>5) | ((data8[2] & 0x80)>>7) );
	swaped[6] |= (((data8[1] & 0x01)<<7) | ((data8[1] & 0x02)<<5) | \
			((data8[1] & 0x04)<<3) | ((data8[1] & 0x08)<<1) | \
			((data8[1] & 0x10)>>1) | ((data8[1] & 0x20)>>3) | \
			((data8[1] & 0x40)>>5) | ((data8[1] & 0x80)>>7) );
	swaped[7] |= (((data8[0] & 0x01)<<7) | ((data8[0] & 0x02)<<5) | \
			((data8[0] & 0x04)<<3) | ((data8[0] & 0x08)<<1) | \
			((data8[0] & 0x10)>>1) | ((data8[0] & 0x20)>>3) | \
			((data8[0] & 0x40)>>5) | ((data8[0] & 0x80)>>7) );
	memcpy(data8, swaped, 8);
}


// fill '0' into pos() of parity bit
void changedata7to8(unsigned char* data7, unsigned char* data8) {
	data8[0]=data7[0] & 0xfe;
	data8[1]=((data7[0] & 0x01)<<7)|((data7[1] & 0xfc)>>1);
	data8[2]=((data7[1] & 0x03)<<6)|((data7[2] & 0xf8)>>2);
	data8[3]=((data7[2] & 0x07)<<5)|((data7[3] & 0xf0)>>3);
	data8[4]=((data7[3] & 0x0f)<<4)|((data7[4] & 0xe0)>>4);
	data8[5]=((data7[4] & 0x1f)<<3)|((data7[5] & 0xc0)>>5);
	data8[6]=((data7[5] & 0x3f)<<2)|((data7[6] & 0x80)>>6);
	data8[7]=((data7[6] & 0x7f)<<1)|0x00;
}
		
	
// change from char to value of that char
unsigned char change_type(unsigned char mch, unsigned char lch) {
	unsigned char ret=0;
	switch (inhex(mch)) {
	case 0:	ret=((mch-'0')<<4);
		break;
	case 1: ret=(((mch-'a')+0xa)<<4);
		break;
	case 2: ret=(((mch-'A')+0xa)<<4);
		break;
	default: return 0;
	}

	switch (inhex(lch)) {
	case 0: ret+=(lch-'0');
		break;
	case 1: ret+=((lch-'a')+0xa);
		break;
	case 2: ret+=((lch-'A')+0xa);
		break;
	default: return 0;
	}

	return ret;
}
	

// This is controller of testing....
int destest() {
	int i, j, err=0, no_part=0;
	int mode=0; // I have 2 modes; 
		// mode 0 for 8 chars for both plain, key data
		// mode 1 for 16 chars plain data and 16|14 chars for key.
	unsigned char kdata[20] = "initdesk";
	unsigned char pdata[20] = "abcd12345";
	unsigned char pdata8[8], kdata8[8];
	unsigned char skdata7[7], spdata8[8], scdata8[8];
	unsigned char cdata[8];
	des_cblock min, mout, moutin;
	des_key_schedule mks;
	
	printf("Key data is   : ");
	gets(kdata);
	printf("Plain data is : ");
	gets(pdata);	
	if (strlen(pdata)==8 && strlen(kdata)==8) {
		mode=0;
	}
	else if (strlen(pdata)==16 && (strlen(kdata)==16) || strlen(kdata)==14) {
		mode=1;
	}
	else {
		mode=2;
		printf("Input Error k_length=%d, p_length=%d\n",strlen(kdata), strlen(pdata));
	}
	
	while (mode>=0 && mode <2) {
	if (mode==0)
	// i have mode 0 for data that is in human readble format
	{
		memcpy(pdata8, pdata, 8);
		memcpy(kdata8, kdata, 8);
	}
	else if (mode==1)
	{
		for (i=0; i<8; i++) {
			// we have to change data from string to be 
			// hexa-decimal
			pdata8[i]=change_type(pdata[2*i], pdata[2*i+1]);
			kdata8[i]=change_type(kdata[2*i], kdata[2*i+1]);
		}
		if (strlen(kdata)==14) {
			no_part=1;
			// swap 64-bits plain data 
			 swap8(spdata8, pdata8);
			 memcpy(pdata8, spdata8, 8);
// this is my first tried, swap bits, then add parity '0'
			 memcpy(kdata, kdata8,7);
			 swap7(kdata8, kdata);
			 changedata7to8(kdata, kdata8);

// this is my second tried, add parity bit before swap.
//			 changedata7to8(kdata, kdata8);
//			 swap8(kdata8, kdata);


		}
#ifdef DEBUG
//		printf("PKC : p=%s, k=%s, c=%s\n", pt(kdata8), pt(pdata8), pt(out));
#endif

	}
	else {
		printf("Input Error\n");
		err=1;
		break;
	}

	if(j=des_key_sched((C_Block *)kdata8, mks) != 0) {
		printf("Key error: %d\n", j);
		err=1;
	}

	memcpy(min, pdata8, 8);
	memset(mout, 0, 8);
	memset(moutin, 0, 8);

	// ENCRYPTION....
	des_ecb_encrypt((C_Block *)min, (C_Block *)mout, mks, DES_ENCRYPT);
	des_ecb_encrypt((C_Block *)mout, (C_Block *)moutin, mks, DES_DECRYPT);
#ifdef DEBUG
	printf("PKC : p=%s, k=%s, c=%s\n", pt(min), pt(mks), pt(mout));
#endif
	if (no_part) {
		printf("KEY in 8 byte format is\"%s\"\n", pt(kdata8));
		swap8(scdata8, mout);
		printf("Cipher(mode[%d] data is \"%s\".\n", mode, pt(scdata8));
	} else 
		printf("Cipher(mode[%d] data is \"%s\".\n", mode, pt(mout));

	// receive input 
	printf("=======Press AnyKey to continue=============\n");
	getchar();
	printf("Key data is   : ");
	gets(kdata);
	printf("Plain data is : ");
	gets(pdata);
	no_part=0;
	if (strlen(pdata)==8 && strlen(kdata)==8) 
		mode=0;
	else if (strlen(pdata)==16 && ((strlen(kdata)==16 || strlen(kdata)==14))) 
		mode=1;
	else {
		mode=2;
		printf("Input Error\n");
	}
	}
	return err;
}

int main(argc,argv)
int argc;
char *argv[];
	{
	int i,j,err=0;

	j=destest();
	if (j==1)
 		err = j;
	exit(err);
	return(0);
	}

static char *pt(p)
unsigned char *p;
	{
	static char bufs[10][20];
	static int bnum=0;
	char *ret;
	int i;
	static char *f="0123456789ABCDEF";

	ret= &(bufs[bnum++][0]);
	bnum%=10;
	for (i=0; i<8; i++)
		{
		ret[i*2]=f[(p[i]>>4)&0xf];
		ret[i*2+1]=f[p[i]&0xf];
		}
	ret[16]='\0';
	return(ret);
	}
