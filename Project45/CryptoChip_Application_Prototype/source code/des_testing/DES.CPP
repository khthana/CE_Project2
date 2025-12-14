#include <iostream.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>


//		CRYPTOCHIP APPLICATION PROTOTYPE

//	NOPPADOL	42010159
//	PIYAWAN		42010203




/**********************************************************************/
/*                                                                    */
/*                            DES TABLES                              */
/*                                                                    */
/**********************************************************************/

void Lookup(char k, char output[4], char input[6]);


//	Initial Permutation [ ACTION WITH INPUT ]
/*  IP: Output bit table_DES_IP[i] equals input bit i. */
static int table_DES_IP[64] = {
    39,  7, 47, 15, 55, 23, 63, 31,
    38,  6, 46, 14, 54, 22, 62, 30,
    37,  5, 45, 13, 53, 21, 61, 29,
    36,  4, 44, 12, 52, 20, 60, 28,
    35,  3, 43, 11, 51, 19, 59, 27,
    34,  2, 42, 10, 50, 18, 58, 26,
    33,  1, 41,  9, 49, 17, 57, 25,
    32,  0, 40,  8, 48, 16, 56, 24
};


//	Permuted Choice 1 ( PC-1 ) [ ACTION WITH KEY ]
/*  PC1: Permutation choice 1, used to pre-process the key */
static int table_DES_PC1[56] = {
    27, 19, 11, 31, 39, 47, 55,
    26, 18, 10, 30, 38, 46, 54,
    25, 17,  9, 29, 37, 45, 53,
    24, 16,  8, 28, 36, 44, 52,
    23, 15,  7,  3, 35, 43, 51,
    22, 14,  6,  2, 34, 42, 50,
    21, 13,  5,  1, 33, 41, 49,
    20, 12,  4,  0, 32, 40, 48
};


//	Permuted Choice 2 ( PC-2 ) [ ACTION WITH KEY ]
/*  PC2: Map 56-bit key to a 48-bit key */
static int table_DES_PC2[48] = {
    24, 27, 20,  6, 14, 10,  3, 22,
     0, 17,  7, 12,  8, 23, 11,  5,
    16, 26,  1,  9, 19, 25,  4, 15,
    54, 43, 36, 29, 49, 40, 48, 30,
    52, 44, 37, 33, 46, 35, 50, 41,
    28, 53, 51, 55, 32, 45, 39, 42
};


//	Expansion ( E ) [ ACTION WITH RIGHT-HALVE INPUT ]
/*  E: Expand 32-bit R to 48 bits. */
static int table_DES_E[48] = {
    31,  0,  1,  2,  3,  4,  3,  4,
     5,  6,  7,  8,  7,  8,  9, 10,
    11, 12, 11, 12, 13, 14, 15, 16,
    15, 16, 17, 18, 19, 20, 19, 20,
    21, 22, 23, 24, 23, 24, 25, 26,
    27, 28, 27, 28, 29, 30, 31,  0
};


//	Permutation P [ ACTION WITH OUTPUT ]
/*  P: Permutation of S table outputs */
static int table_DES_P[32] = {
    11, 17,  5, 27, 25, 10, 20,  0,
    13, 21,  3, 28, 29,  7, 18, 24,
    31, 22, 12,  6, 26,  2, 16,  8,
    14, 30,  4, 19,  1,  9, 15, 23
};


//	Substitution Box [ ACTION WITH OUTPUT ]
/*  S Tables: Introduce nonlinearity and avalanche */
static int table_DES_S[8][64] = {
    /* table S[0] */
	{   13,  1,  2, 15,  8, 13,  4,  8,  6, 10, 15,  3, 11,  7,  1,  4,
	    10, 12,  9,  5,  3,  6, 14, 11,  5,  0,  0, 14, 12,  9,  7,  2,
	     7,  2, 11,  1,  4, 14,  1,  7,  9,  4, 12, 10, 14,  8,  2, 13,
	     0, 15,  6, 12, 10,  9, 13,  0, 15,  3,  3,  5,  5,  6,  8, 11  },
    /* table S[1] */
	{    4, 13, 11,  0,  2, 11, 14,  7, 15,  4,  0,  9,  8,  1, 13, 10,
	     3, 14, 12,  3,  9,  5,  7, 12,  5,  2, 10, 15,  6,  8,  1,  6,
	     1,  6,  4, 11, 11, 13, 13,  8, 12,  1,  3,  4,  7, 10, 14,  7,
	    10,  9, 15,  5,  6,  0,  8, 15,  0, 14,  5,  2,  9,  3,  2, 12  },
    /* table S[2] */
	{   12, 10,  1, 15, 10,  4, 15,  2,  9,  7,  2, 12,  6,  9,  8,  5,
	     0,  6, 13,  1,  3, 13,  4, 14, 14,  0,  7, 11,  5,  3, 11,  8,
	     9,  4, 14,  3, 15,  2,  5, 12,  2,  9,  8,  5, 12, 15,  3, 10,
	     7, 11,  0, 14,  4,  1, 10,  7,  1,  6, 13,  0, 11,  8,  6, 13  },
    /* table S[3] */
	{    2, 14, 12, 11,  4,  2,  1, 12,  7,  4, 10,  7, 11, 13,  6,  1,
	     8,  5,  5,  0,  3, 15, 15, 10, 13,  3,  0,  9, 14,  8,  9,  6,
	     4, 11,  2,  8,  1, 12, 11,  7, 10,  1, 13, 14,  7,  2,  8, 13,
	    15,  6,  9, 15, 12,  0,  5,  9,  6, 10,  3,  4,  0,  5, 14,  3  },
    /* table S[4] */
	{    7, 13, 13,  8, 14, 11,  3,  5,  0,  6,  6, 15,  9,  0, 10,  3,
	     1,  4,  2,  7,  8,  2,  5, 12, 11,  1, 12, 10,  4, 14, 15,  9,
	    10,  3,  6, 15,  9,  0,  0,  6, 12, 10, 11,  1,  7, 13, 13,  8,
	    15,  9,  1,  4,  3,  5, 14, 11,  5, 12,  2,  7,  8,  2,  4, 14  },
    /* table S[5] */
	{   10, 13,  0,  7,  9,  0, 14,  9,  6,  3,  3,  4, 15,  6,  5, 10,
	     1,  2, 13,  8, 12,  5,  7, 14, 11, 12,  4, 11,  2, 15,  8,  1,
	    13,  1,  6, 10,  4, 13,  9,  0,  8,  6, 15,  9,  3,  8,  0,  7,
	    11,  4,  1, 15,  2, 14, 12,  3,  5, 11, 10,  5, 14,  2,  7, 12  },
    /* table S[6] */
	{   15,  3,  1, 13,  8,  4, 14,  7,  6, 15, 11,  2,  3,  8,  4, 14,
	     9, 12,  7,  0,  2,  1, 13, 10, 12,  6,  0,  9,  5, 11, 10,  5,
	     0, 13, 14,  8,  7, 10, 11,  1, 10,  3,  4, 15, 13,  4,  1,  2,
	     5, 11,  8,  6, 12,  7,  6, 12,  9,  0,  3,  5,  2, 14, 15,  9  },
    /* table S[7] */
	{   14,  0,  4, 15, 13,  7,  1,  4,  2, 14, 15,  2, 11, 13,  8,  1,
	     3, 10, 10,  6,  6, 12, 12, 11,  5,  9,  9,  5,  0,  3,  7,  8,
	     4, 15,  1, 12, 14,  8,  8,  2, 13,  4,  6,  9,  2,  1, 11,  7,
	    15,  5, 12, 11,  9,  3,  7, 14,  3, 10, 10,  0,  5,  6,  0, 13  }
};


//	Final Permutation [ ACTION WITH OUTPUT ]
/*  FP: Output bit table_DES_FP[i] equals input bit i. */
static int table_DES_FP[64] = {
    57, 49, 41, 33, 25, 17,  9,  1,
    59, 51, 43, 35, 27, 19, 11,  3,
    61, 53, 45, 37, 29, 21, 13,  5,
    63, 55, 47, 39, 31, 23, 15,  7,
    56, 48, 40, 32, 24, 16,  8,  0,
    58, 50, 42, 34, 26, 18, 10,  2,
    60, 52, 44, 36, 28, 20, 12,  4,
    62, 54, 46, 38, 30, 22, 14,  6
};


// string to 64 bits
void str2bits(char *str, int numbit, char *bf)
{
	int i, j;

	for (i = 0; (i < strlen(str))&&(i < numbit); i++)
	{
		j = i<<3;

		bf[j] = str[i]&1;
		bf[j+1] = (str[i]&2) >>1;
		bf[j+2] = (str[i]&4) >>2;
		bf[j+3] = (str[i]&8) >>3;
		bf[j+4] = (str[i]&16) >>4;
		bf[j+5] = (str[i]&32) >>5;
		bf[j+6] = (str[i]&64) >>6;
		bf[j+7] = (str[i]&128) >>7;
	}

//	if string not 8, fill 0
	for (; i < numbit; i++)
	{
		j = i<<3;

		bf[j] = 0;
		bf[j+1] = 0;
		bf[j+2] = 0;
		bf[j+3] = 0;
		bf[j+4] = 0;
		bf[j+5] = 0;
		bf[j+6] = 0;
		bf[j+7] = 0;
	}
}

// 64 bits to string 16
void ChangeBit2Str(char *bit, int numstr, char *str)
{
	int i;
	char temp[4] = "0000";

	for (i = numstr-1; i >= 0; i--)
	{
		temp[0] = bit[(i * 4) + 3];
		temp[1] = bit[(i * 4) + 2];
		temp[2] = bit[(i * 4) + 1];
		temp[3] = bit[(i * 4) + 0];

		if (temp[0] == 0 && temp[1] == 0 && temp[2] == 0 && temp[3]== 0)
			str[i] = '0';
		if (temp[0] == 0 && temp[1] == 0 && temp[2] == 0 && temp[3]== 1)
			str[i] = '1';
		if (temp[0] == 0 && temp[1] == 0 && temp[2] == 1 && temp[3]== 0)
			str[i] = '2';
		if (temp[0] == 0 && temp[1] == 0 && temp[2] == 1 && temp[3]== 1)
			str[i] = '3';
		if (temp[0] == 0 && temp[1] == 1 && temp[2] == 0 && temp[3]== 0)
			str[i] = '4';
		if (temp[0] == 0 && temp[1] == 1 && temp[2] == 0 && temp[3]== 1)
			str[i] = '5';
		if (temp[0] == 0 && temp[1] == 1 && temp[2] == 1 && temp[3]== 0)
			str[i] = '6';
		if (temp[0] == 0 && temp[1] == 1 && temp[2] == 1 && temp[3]== 1)
			str[i] = '7';
		if (temp[0] == 1 && temp[1] == 0 && temp[2] == 0 && temp[3]== 0)
			str[i] = '8';
		if (temp[0] == 1 && temp[1] == 0 && temp[2] == 0 && temp[3]== 1)
			str[i] = '9';
		if (temp[0] == 1 && temp[1] == 0 && temp[2] == 1 && temp[3]== 0)
			str[i] = 'A';
		if (temp[0] == 1 && temp[1] == 0 && temp[2] == 1 && temp[3]== 1)
			str[i] = 'B';
		if (temp[0] == 1 && temp[1] == 1 && temp[2] == 0 && temp[3]== 0)
			str[i] = 'C';
		if (temp[0] == 1 && temp[1] == 1 && temp[2] == 0 && temp[3]== 1)
			str[i] = 'D';
		if (temp[0] == 1 && temp[1] == 1 && temp[2] == 1 && temp[3]== 0)
			str[i] = 'E';
		if (temp[0] == 1 && temp[1] == 1 && temp[2] == 1 && temp[3]== 1)
			str[i] = 'F';
	}
}

// string 16 to 64 bits
void ChangeStr2Bit(char *str, int numstr, char *bit)
{
	int i;

	for (i = numstr-1; i >= 0; i--)
	{
	    switch(str[numstr-1-i])
		{
		    case '0' :  bit[(i*4)+3] = 0;
				bit[(i*4)+2] = 0;
				bit[(i*4)+1] = 0;
				bit[(i*4)+0] = 0;
				break;
		    case '1' :  bit[(i*4)+3] = 0;
				bit[(i*4)+2] = 0;
				bit[(i*4)+1] = 0;
				bit[(i*4)+0] = 1;
				break;
		    case '2' :  bit[(i*4)+3] = 0;
				bit[(i*4)+2] = 0;
				bit[(i*4)+1] = 1;
				bit[(i*4)+0] = 0;
				break;
		    case '3' :  bit[(i*4)+3] = 0;
				bit[(i*4)+2] = 0;
				bit[(i*4)+1] = 1;
				bit[(i*4)+0] = 1;
				break;
		    case '4' :  bit[(i*4)+3] = 0;
				bit[(i*4)+2] = 1;
				bit[(i*4)+1] = 0;
				bit[(i*4)+0] = 0;
				break;
		    case '5' :  bit[(i*4)+3] = 0;
				bit[(i*4)+2] = 1;
				bit[(i*4)+1] = 0;
				bit[(i*4)+0] = 1;
				break;
		    case '6' :  bit[(i*4)+3] = 0;
				bit[(i*4)+2] = 1;
				bit[(i*4)+1] = 1;
				bit[(i*4)+0] = 0;
				break;
		    case '7' :  bit[(i*4)+3] = 0;
				bit[(i*4)+2] = 1;
				bit[(i*4)+1] = 1;
				bit[(i*4)+0] = 1;
				break;
		    case '8' :  bit[(i*4)+3] = 1;
				bit[(i*4)+2] = 0;
				bit[(i*4)+1] = 0;
				bit[(i*4)+0] = 0;
				break;
		    case '9' :  bit[(i*4)+3] = 1;
				bit[(i*4)+2] = 0;
				bit[(i*4)+1] = 0;
				bit[(i*4)+0] = 1;
				break;
		    case 'A' :  bit[(i*4)+3] = 1;
				bit[(i*4)+2] = 0;
				bit[(i*4)+1] = 1;
				bit[(i*4)+0] = 0;
				break;
		    case 'B' :  bit[(i*4)+3] = 1;
				bit[(i*4)+2] = 0;
				bit[(i*4)+1] = 1;
				bit[(i*4)+0] = 1;
				break;
		    case 'C' :  bit[(i*4)+3] = 1;
				bit[(i*4)+2] = 1;
				bit[(i*4)+1] = 0;
				bit[(i*4)+0] = 0;
				break;
		    case 'D' :  bit[(i*4)+3] = 1;
				bit[(i*4)+2] = 1;
				bit[(i*4)+1] = 0;
				bit[(i*4)+0] = 1;
				break;
		    case 'E' :  bit[(i*4)+3] = 1;
				bit[(i*4)+2] = 1;
				bit[(i*4)+1] = 1;
				bit[(i*4)+0] = 0;
				break;
		    case 'F' :  bit[(i*4)+3] = 1;
				bit[(i*4)+2] = 1;
				bit[(i*4)+1] = 1;
				bit[(i*4)+0] = 1;
				break;

		}
	}
}

// string 16 to string 8
void Change16Str2Str8(char *strout, char *out)
{
	int i;
	char temp[2] = "00";
/*
	printf ("\nStrout : ");
	for (i = 15; i >= 0; i--)
		printf ("%c",strout [i]);
*/
	for (i = 7; i >= 0; i--)
	{
		temp[0] = strout[(i * 2) + 1];
		temp[1] = strout[(i * 2) + 0];

		if (temp[0] == '3' && temp[1] == '0')
			out[i] = '0';
		if (temp[0] == '3' && temp[1] == '1')
			out[i] = '1';
		if (temp[0] == '3' && temp[1] == '2')
			out[i] = '2';
		if (temp[0] == '3' && temp[1] == '3')
			out[i] = '3';
		if (temp[0] == '3' && temp[1] == '4')
			out[i] = '4';
		if (temp[0] == '3' && temp[1] == '5')
			out[i] = '5';
		if (temp[0] == '3' && temp[1] == '6')
			out[i] = '6';
		if (temp[0] == '3' && temp[1] == '7')
			out[i] = '7';
		if (temp[0] == '3' && temp[1] == '8')
			out[i] = '8';
		if (temp[0] == '3' && temp[1] == '9')
			out[i] = '9';
		if (temp[0] == '4' && temp[1] == '1')
			out[i] = 'A';
		if (temp[0] == '4' && temp[1] == '2')
			out[i] = 'B';
		if (temp[0] == '4' && temp[1] == '3')
			out[i] = 'C';
		if (temp[0] == '4' && temp[1] == '4')
			out[i] = 'D';
		if (temp[0] == '4' && temp[1] == '5')
			out[i] = 'E';
		if (temp[0] == '4' && temp[1] == '6')
			out[i] = 'F';
		if (temp[0] == '4' && temp[1] == '7')
			out[i] = 'G';
		if (temp[0] == '4' && temp[1] == '8')
			out[i] = 'H';
		if (temp[0] == '4' && temp[1] == '9')
			out[i] = 'I';
		if (temp[0] == '4' && temp[1] == 'A')
			out[i] = 'J';
		if (temp[0] == '4' && temp[1] == 'B')
			out[i] = 'K';
		if (temp[0] == '4' && temp[1] == 'C')
			out[i] = 'L';
		if (temp[0] == '4' && temp[1] == 'D')
			out[i] = 'M';
		if (temp[0] == '4' && temp[1] == 'E')
			out[i] = 'N';
		if (temp[0] == '4' && temp[1] == 'F')
			out[i] = 'O';
		if (temp[0] == '5' && temp[1] == '0')
			out[i] = 'P';
		if (temp[0] == '5' && temp[1] == '1')
			out[i] = 'Q';
		if (temp[0] == '5' && temp[1] == '2')
			out[i] = 'R';
		if (temp[0] == '5' && temp[1] == '3')
			out[i] = 'S';
		if (temp[0] == '5' && temp[1] == '4')
			out[i] = 'T';
		if (temp[0] == '5' && temp[1] == '5')
			out[i] = 'U';
		if (temp[0] == '5' && temp[1] == '6')
			out[i] = 'V';
		if (temp[0] == '5' && temp[1] == '7')
			out[i] = 'W';
		if (temp[0] == '5' && temp[1] == '8')
			out[i] = 'X';
		if (temp[0] == '5' && temp[1] == '9')
			out[i] = 'Y';
		if (temp[0] == '5' && temp[1] == 'A')
			out[i] = 'Z';
		if (temp[0] == '6' && temp[1] == '1')
			out[i] = 'a';
		if (temp[0] == '6' && temp[1] == '2')
			out[i] = 'b';
		if (temp[0] == '6' && temp[1] == '3')
			out[i] = 'c';
		if (temp[0] == '6' && temp[1] == '4')
			out[i] = 'd';
		if (temp[0] == '6' && temp[1] == '5')
			out[i] = 'e';
		if (temp[0] == '6' && temp[1] == '6')
			out[i] = 'f';
		if (temp[0] == '6' && temp[1] == '7')
			out[i] = 'g';
		if (temp[0] == '6' && temp[1] == '8')
			out[i] = 'h';
		if (temp[0] == '6' && temp[1] == '9')
			out[i] = 'i';
		if (temp[0] == '6' && temp[1] == 'A')
			out[i] = 'j';
		if (temp[0] == '6' && temp[1] == 'B')
			out[i] = 'k';
		if (temp[0] == '6' && temp[1] == 'C')
			out[i] = 'l';
		if (temp[0] == '6' && temp[1] == 'D')
			out[i] = 'm';
		if (temp[0] == '6' && temp[1] == 'E')
			out[i] = 'n';
		if (temp[0] == '6' && temp[1] == 'F')
			out[i] = 'o';
		if (temp[0] == '7' && temp[1] == '0')
			out[i] = 'p';
		if (temp[0] == '7' && temp[1] == '1')
			out[i] = 'q';
		if (temp[0] == '7' && temp[1] == '2')
			out[i] = 'r';
		if (temp[0] == '7' && temp[1] == '3')
			out[i] = 's';
		if (temp[0] == '7' && temp[1] == '4')
			out[i] = 't';
		if (temp[0] == '7' && temp[1] == '5')
			out[i] = 'u';
		if (temp[0] == '7' && temp[1] == '6')
			out[i] = 'v';
		if (temp[0] == '7' && temp[1] == '7')
			out[i] = 'w';
		if (temp[0] == '7' && temp[1] == '8')
			out[i] = 'x';
		if (temp[0] == '7' && temp[1] == '9')
			out[i] = 'y';
		if (temp[0] == '7' && temp[1] == 'A')
			out[i] = 'z';
	}
}

/////////////////////////////   Doing About Key	//////////////////
static void KeyAction(char roundKey[56], char key[56])
{
	int i;

// key 56 bits => Permutation 1
	for (i = 0; i < 56; i++) {
		roundKey[table_DES_PC1[i]] = key[i];
	}

}

/////////////////////////////   Initial Permutation	//////////
void InitP(char input[64], char L[32], char R[32])
{	int i;
	int IP[64];

// Exchange bit position.
	for (i = 63; i >= 0; i--)
		IP[table_DES_IP[i]] = input[i];

// Split input into L and R.
	// Bits 63..32 go in L, bits 31..0 go in R.
	for (i = 63; i >= 0; i--)
		if (i >= 32)
			L[i-32] = IP[i];
		else
			R[i] = IP[i];

}

/////////////////////////////   Expansion	//////////////////
void Expansion(char Expand[48], char R[32])
{	int i;

// Expand the 32-bit R[i-1] into 48 bits.
	for (i=0; i < 48; i++)
		Expand[i] = R[table_DES_E[i]];

}

void Exchange_LR(char L[32], char R[32])
{	int i;

// Exchange L and R
	// L = R and R = L
	for (i=0; i < 32; i++)
		L[i] ^= R[i] ^= L[i] ^= R[i];

}

/////////////////////////////   Doing About Key	//////////////////
void Permute2(char PC1[56], char PC2[48])
{	int i;

// key 56 bits => Permutation 2
	for (i = 0; i < 48; i++) {
		PC2[i] = PC1[table_DES_PC2[i]];
	}


}

/////////////////////////////   Function	//////////////////
void FunctionF(char *Expand, char *PC2, char *outF)
{	int i,k;
	char outlook[32];

// Exclusive-or the Expanded data and key(PC1 and PC2 already).
	for (i=0; i < 48; i++)
		Expand[i] ^= PC2[i];

// Substitution Box : 48-bit data -> 32-bit data.
	for (k=0; k < 8; k++)
		Lookup(k, outlook+4*k, Expand+6*k);

// Permutation
	for (i=0; i < 32; i++)
		outF[table_DES_P[i]] = outlook[i];

}

/*
 *  Look up a 6-bit input in S table k and store the result as a 4-bit output.
 */
void Lookup(char k, char output[4], char input[6]) {
	int inputValue, outputValue;
	int i;

	/* Convert the input bits into an integer */
	inputValue = input[0] + 2*input[1] + 4*input[2] + 8*input[3] + 16*input[4] + 32*input[5];

	/* Do the S table lookup */
	outputValue = table_DES_S[k][inputValue];

	/* Convert the result into binary form */
	output[0] = (outputValue & 1) ? 1 : 0;
	output[1] = (outputValue & 2) ? 1 : 0;
	output[2] = (outputValue & 4) ? 1 : 0;
	output[3] = (outputValue & 8) ? 1 : 0;
}

/////////////////////////////   Final Permutation	//////////
void FinalP(char output[64], char L[32], char R[32])
{	int i;
	int temp[64];

// temp = LR
	for (i = 63; i >= 0; i--)
		if (i >= 32)
			temp[i] = L[i-32];
		else
			temp[i] = R[i];

// output => final permutation
	for (i = 63; i >= 0; i--)
		output[table_DES_FP[i]] = temp[i];

}

/////////////////////////////   Doing About Key	//////////////////
// Shift Key Left
void ShiftKeyLeft(char Key[56]) {
	char temp1, temp2;
	int i;

	temp1 = Key[55];
	temp2 = Key[27];

	for (i = 27; i >= 1; i--) {
		Key[i] = Key[i-1];
		Key[i+28] = Key[i+28-1];
	}

	Key[0] = temp2;
	Key[28] = temp1;
}

/////////////////////////////   Doing About Key	//////////////////
// Shift Key Right
void ShiftKeyRight(char Key[56]) {
	char temp1, temp2;
	int i;

	temp1 = Key[0];
	temp2 = Key[28];

	for (i = 0; i < 27; i++) {
		Key[i] = Key[i+1];
		Key[i+28] = Key[i+28+1];
	}

	Key[27] = temp1;
	Key[55] = temp2;
}

/////////////////////////////   Encryption	//////////////////
//////////////////////////////////////////////////////////////////
void Encryption(char input[64], char key[56], char output[64])
{
	char PC1[56], PC2[48];		// Key after Permutation 1 and 2.
	char L[32], R[32];
	char round, i;
	char Expand[48];
	char outF[32];


/////////////////////////////   KEY	//////////////////////////
// Permuted Choice 1
	KeyAction(PC1, key);

/////////////////////////////	INPUT	//////////////////////////

// Initial Permutation.
	InitP(input, L, R);

//	LOOP
	for (round = 0; round < 16; round++)
	{
		ShiftKeyLeft(PC1);

		if (round != 0 && round != 1 && round != 8 && round != 15)
			ShiftKeyLeft(PC1);

// Expand the 32-bit R[i-1] into 48 bits.
		Expansion(Expand, R);

// Permuted Choice 2
		Permute2(PC1, PC2);

// Function F is doing Exclusive-OR, Substitution Box and Permutation
//	R[i] = L[i-1] EX-OR F(R[i-1], Key);
		FunctionF(Expand, PC2, outF);


		for (i = 0; i < 32; i++)
			L[i] ^= outF[i];

// Exchange L and R
		Exchange_LR(L, R);

	}
// 	END LOOP

// Exchange L and R
	Exchange_LR(L, R);

// Final Permutation
	FinalP(output, L, R);
}


/////////////////////////////   Decryption	//////////////////
//////////////////////////////////////////////////////////////////
void Decryption(char *input, char *key, char *output)
{
	char PC1[56], PC2[48];		// Key after Permutation 1 and 2.
	char L[32], R[32];
	char round, i;
	char Expand[48];
	char outF[32];


/////////////////////////////   KEY	//////////////////////////
// Permuted Choice 1
	KeyAction(PC1, key);

/////////////////////////////	INPUT	//////////////////////////

// Initial Permutation.
	InitP(input, L, R);

//	LOOP
	for (round = 0; round < 16; round++)
	{

// Expand the 32-bit R[i-1] into 48 bits.
		Expansion(Expand, R);

		Permute2(PC1, PC2);

// Function F is doing Exclusive-OR, Substitution Box and Permutation
//	R[i] = L[i-1] EX-OR F(R[i-1], Key);
		FunctionF(Expand, PC2, outF);

// Exchange L and R
		for (i = 0; i < 32; i++)
			L[i] ^= outF[i];

// Exchange L and R
		Exchange_LR(L, R);

		ShiftKeyRight(PC1);

		if (round != 0 && round != 7 && round != 14 && round != 15)
			ShiftKeyRight(PC1);


	}
// 	END LOOP

// Exchange L and R
	Exchange_LR(L, R);

// Final Permutation
	FinalP(output, L, R);

}


int main(int argc, char *argv[])
{
//	clrscr();

	char key[56];
	char input[64];
	char output[64];
	char strout[16], out[16];
	int i;

	int LenInput,LenKey;

	LenInput = strlen(argv[2]);
	LenKey = strlen(argv[3]);

	printf("\nInput : ");
	for(i = 0; i < LenInput; i++)
		printf("%c", argv[2][i]);
	printf("\n");

	printf("Key   : ");
	for(i = 0; i < LenKey; i++)
		printf("%c", argv[3][i]);
	printf("\n");

	if (argc == 4)
	{
		for (i =0 ;i < sizeof(output); output[i++] = 0);
		for (i =0 ;i < sizeof(input); input[i++] = 0);
		for (i =0 ;i < sizeof(key); key[i++] =0);

		if ( *argv[1] == 'E' || *argv[1] == 'e' ||
		     *argv[1] == 'D' || *argv[1] == 'd'	)
		{
		// Encryption
		   if (*argv[1] == 'E' || *argv[1] == 'e')
		   {

			if (LenInput !=8 || LenKey > 7)
			{
				printf("\nINPUT SHOULD BE 8 CHARACTERS\n");
				printf("KEY SHOULD NOT BE MORE THAN 7 CHARACTERS\n");
				return 0;
			}
			else
			{
				printf("\n//////////		ENCRYPTION\n");
				str2bits(argv[3], sizeof(key)/8, key);

				str2bits(argv[2], sizeof(input)/8, input);

				Encryption(input, key, output);
/*
				printf("\nOutput : ");
				for(i = 63; i >= 0; i--)
					printf ("%d",output[i]);
				printf("\n");
*/
				ChangeBit2Str(output, sizeof(out), out);

				printf("\nCiphertext : ");
				for(i = 15; i >= 0; i--)
					printf("%c", out[i]);
				printf("\n");
			}
		   }
		// Decryption
		   else
		   {
			if (LenKey > 7 || LenInput != 16)
			{
				printf("\nINPUT SHOULD BE 16 CHARACTERS\n");
				printf("KEY SHOULD NOT BE MORE THAN 7 CHARACTERS\n");
				return 0;
			}
			else
			{
				printf("\n//////////		DECRYPTION\n");

				ChangeStr2Bit(argv[2], LenInput, input);
/*
				printf("Input : ");
				for(i = 63; i >= 0; i--)
					printf ("%d",input[i]);
				printf("\n");
*/
				str2bits(argv[3], sizeof(key)/8, key);

				Decryption(input, key, output);
/*
				printf("\nOutput : ");
				for(i = 63; i >= 0; i--)
					printf ("%d",output[i]);
				printf("\n");
*/
				ChangeBit2Str(output, sizeof(strout), strout);
/*
				printf ("Plaintext : ");
				for (i = 15; i >= 0; i--)
					printf ("%c",strout [i]);
*/
				Change16Str2Str8(strout, out);

				printf ("\nPlaintext : ");
				for (i = 0; i < 8; i++)
					printf ("%c",out [i]);

			}
		   }
		}
		else
			printf("No action in %c symbol\n",*argv[1]);

	}

	return 0;
}




