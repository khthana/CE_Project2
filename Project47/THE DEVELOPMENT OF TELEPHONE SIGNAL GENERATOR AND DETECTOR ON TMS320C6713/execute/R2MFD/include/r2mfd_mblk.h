//
//		r2mfd_mblk.h
//		struct of mem. be used, and konstant be used.
//		written by Yury Ongsuvanov
//		used to define memory block of r2mfd mod.
//

#ifndef MBLKr2mfd

#define MBLKr2mfd

#define R2MF_DETECT_MaxQueueItem 251
// ---

typedef struct
{
	Uns threshold_f;	//to used with fwd-group //fwd 8M	//15M  //5M	//3M
	Uns threshold_g;	//to used with bwd-group //bwd 8M	//15M  //5M	//3M
	Uns threshold_v;	// against signal level
	
	Int coeff_r2mf_fwd[6];
	Int coeff_r2mf_bwd[6];	
	
	Int dBm0_OprMax;		//0dBm=0
	Int dBm0_OprMin;		//-31.50dBm=-3150
	
	Int log_scale;			//2^17
	Int dBm0_A_law;
	Int dBm0_Mju_law;
	
	Int log10_2nm1[27];
	Int log10_2n[32];
	
}R2MFD_KONST;

//---

typedef struct{

	MdInt r2mf_detect_detectionBuffer[R2MF_DETECT_MaxQueueItem];
	MdInt r2mf_detect_sPtr;	//0

}R2MFD_MBLK;

// --
// ---
#define R2MF_DETECT_THRESHOLDf	R2MFD->konst->threshold_f
#define R2MF_DETECT_THRESHOLDg	R2MFD->konst->threshold_g
#define R2MF_DETECT_THRESHOLDv	R2MFD->konst->threshold_v

#define R2MF_DETECT_COEFF_FWD_TAB	R2MFD->konst->coeff_r2mf_fwd
#define R2MF_DETECT_COEFF_BWD_TAB	R2MFD->konst->coeff_r2mf_bwd

#define R2MF_DETECT_DBM0_OPRMAX		R2MFD->konst->dBm0_OprMax
#define R2MF_DETECT_DBM0_OPRMIN		R2MFD->konst->dBm0_OprMin

#define R2MF_DETECT_LSCALE 		R2MFD->konst->log_scale
#define R2MF_DETECT_M0_A_LAW	R2MFD->konst->dBm0_A_law
#define R2MF_DETECT_M0_Mju_LAW	R2MFD->konst->dBm0_Mju_law

#define R2MF_DETECT_LOG_2NM1_TAB	R2MFD->konst->log10_2nm1
#define R2MF_DETECT_LOG_2N_TAB		R2MFD->konst->log10_2n


#endif
// ---

