#ifndef _CPTDETECTPRIV
#define _CPTDETECTPRIV

#include "icptdetect.h"


#define LMAX_TERM 27
#define LSCALE 131072
#define M0_A_LAW -159540501
#define M0_Mju_LAW -81494089

#ifdef CALLOG 
const int LOG10_2NM1[LMAX_TERM] =
{
	0, 39456604, 16375970, 7601120,
	3673781, 1807258, 896457, 446464,
	222794, 111288, 55617, 27802,
	13899, 6949, 3474, 1737,
	869, 434, 217, 109,
	54, 27, 14, 7,
	3, 2, 1
};

const int LOG10_2N[] =
{
   0, -39456603, -78913207, -118369810, 
   -157826414, -197283017, -236739621, -276196225, 
   -315652828, -355109432, -394566035, -434022639, 
   -473479243, -512935846, -552392450, -591849053, 
   -631305657, -670762261, -710218864, -749675468, 
   -789132071, -828588675, -868045279, -907501882, 
   -946958486, -986415089, -1025871693, -1065328296, 
   -1104784900, -1144241504, -1183698107, -1223154711
};
#else
extern const int LOG10_2NM1[];
extern const int LOG10_2N[];
#endif

typedef struct CPT_DetectFParam
{
	unsigned int *freq;
	unsigned int freqNum;
	int power;
	unsigned int *threshold;
	int *dBm;
	unsigned int SampCount;
} CPT_DetectFParam;

int kLog10(unsigned int x);
int calc_dBm0(unsigned int avgsq);
int calcCoeff(int freq);

void ResetParam(CPT_DetectParam* dparam);

int DetectFV2(short* data, int SampCount, const int* DetectedFreq,const int* Threshold,const int FreqCount, int* Power,const int* Db);

void ChangeState(CPT_DetectParam *param);
void FoundCPT(CPT_DetectParam *param);

unsigned char DetectSignal(CPT_DetectParam *param);
unsigned char isSilence(int data,int minvalue);

#endif
