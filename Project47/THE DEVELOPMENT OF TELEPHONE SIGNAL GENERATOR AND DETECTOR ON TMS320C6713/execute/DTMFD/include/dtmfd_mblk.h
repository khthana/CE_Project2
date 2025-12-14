// dtmfd_mblk.h
// by Yury Ongsuvanov

// ---

#ifndef MBLKdtmfd

#define MBLKdtmfd

#define MaxQueueItem 251	// e.g. 201 defined = 200 usable)
#define MaxStateQueueItem 91
#define MaxLastItem 8

// ---

typedef struct
{
	Uns threshold_f;	//to used with high-group 20M  6M
	Uns threshold_g;	//to used with low-group 8M	//15M  //5M	//3M // 1M  //27 //22
	Uns threshold_v;
	
	MdInt sigOprMin;	// 320 samp = 40mS
	MdInt sigPauseMin;	// 320 samp = 40mS
	MdInt sigVelocity;	// 744 samp = 93mS
	MdInt sigIntMax;	// 80 samp = 10mS	,allowed inturrupt period
	
	Int coeff_dtmf[8];
	
	Int dBm0_OprMax;		//0dBm=0
	Int dBm0_OprMin;		//-25dBm=-2500
	Int dBm0_NonOprMax;		//-25dBm=-2500
	
	Int log_scale;			//2^17
	Int dBm0_A_law;
	Int dBm0_Mju_law;
	
	Int log10_2nm1[27];
	Int log10_2n[32];
	
}DTMFD_KONST;

// ---

typedef struct{
	
	MdInt detectionBuffer[MaxQueueItem];

	MdInt sPtr; //0
	MdInt ePtr; //1
	
	MdInt stateQueue[MaxStateQueueItem];
	MdInt state_sPtr; //0
	MdInt state_ePtr; //1	
	
	MdInt lastItem[MaxLastItem];	
	MdInt lastItem_sPtr; //0
	MdInt lastItem_ePtr; //1
	
	MdInt cntS;	//0, count for non-pause sample
	MdInt cntZ;	//0, count for pause sample
	MdInt cntLastZ; //0
	MdInt cntLastS; //0	
	
} DTMFD_MBLK; //, *dtmfd_handle;


// ---

//---

#define THRESHOLDf	DTMFD->konst->threshold_f
#define THRESHOLDg  DTMFD->konst->threshold_g
#define THRESHOLDv	DTMFD->konst->threshold_v

#define DTMF_SigOprMin 		DTMFD->konst->sigOprMin
#define DTMF_SigPauseMin 	DTMFD->konst->sigPauseMin
#define DTMF_Velocity 		DTMFD->konst->sigVelocity
#define DTMF_IntMax 		DTMFD->konst->sigIntMax

#define DTMF_DETECT_COEFF_TAB	DTMFD->konst->coeff_dtmf

#define DTMF_DETECT_DBM0_OPRMAX		DTMFD->konst->dBm0_OprMax
#define DTMF_DETECT_DBM0_OPRMIN		DTMFD->konst->dBm0_OprMin
#define DTMF_DETECT_DBM0_NONOPRMAX	DTMFD->konst->dBm0_NonOprMax

#define DTMF_DETECT_LSCALE 		DTMFD->konst->log_scale
#define DTMF_DETECT_M0_A_LAW	DTMFD->konst->dBm0_A_law
#define DTMF_DETECT_M0_Mju_LAW	DTMFD->konst->dBm0_Mju_law

#define DTMF_DETECT_LOG_2NM1_TAB	DTMFD->konst->log10_2nm1
#define DTMF_DETECT_LOG_2N_TAB		DTMFD->konst->log10_2n


#endif
//---



