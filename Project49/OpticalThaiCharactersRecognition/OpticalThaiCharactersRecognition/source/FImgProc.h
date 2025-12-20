// FImgProc.h: interface for the FImgProc class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FIMGPROC_H__8C27E401_EF2E_45F7_BA92_21E39D0CE808__INCLUDED_)
#define AFX_FIMGPROC_H__8C27E401_EF2E_45F7_BA92_21E39D0CE808__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "FImage.h"
//#include "Settings.h"
#include "MyNeuralNetwork.h"

typedef struct	// RGB color range
{
	BYTE red_min;
	BYTE red_max;
	BYTE green_min;
	BYTE green_max;
	BYTE blue_min;
	BYTE blue_max;
} F_RGBRANGE;

typedef struct	// HSV color range
{
	int hue_min;	// HUE = 0 to 359
	int hue_max;
	int sat_min;	// SAT = 0 to 255
	int sat_max;
	int val_min;	// VAL = 0 to 255
	int val_max;
} F_HSVRANGE;

typedef struct // Blob's data
{
	int size;		// Size of blob
	int xmin;		// Left
	int ymin;		// Top
	int xmax;		// Right
	int ymax;		// Bottom
	int l;
} F_BLOB;

typedef struct
{
	int wid;
	int hei;
	BYTE **dat;
} C_INPUT;


typedef struct
{
	float ratio; //this mean the ratio of w/h
	float **dd;
	int recognumber;
} D_INPUT;
// ----------------------------------------------------------------------

class FImgProc  
{
public:
	FImgProc();
	virtual ~FImgProc();

	// Thresholding
	void initial(void);
	void cutoffblob(void);

	int Threshold_normal(const FImage &Source, FImage &Target, BYTE Range);						// Set pixel to white if its color within RGB range, otherwise set to black
	int Threshold(const FImage&, FImage&, BYTE);		// Read from source and write to target
	void LineConsider(const FImage &,int *);
	void levelconsider(int *row,int h);
	int isOverlap(int xmin1,int ymin1,int xmax1,int ymax1,int xmin2,int ymin2,int xmax2,int ymax2);
	//void blobextract(FImage& source);
	void blobextract(FImage& source);
	int normalize(F_PIXEL **b,int nWidth,int nHeight,int oWidth,int oHeight,int **d,int idn,BOOL bBilinear);
	//void extract(F_BLOB blob,FImage& Source,int id);
	void extract(F_BLOB blob,FImage& Source,int id,int zuck);
	void l_e_v_e_l(FImage& source,int thresh);
	void validblob();
	int Threshold(FImage&, const F_HSVRANGE&, int);					// Set pixel to white if its color(+HueOffset) within HSV range, otherwise set to black
	int Threshold(const FImage&, FImage&, const F_HSVRANGE&, int);	// Read from source and write to target
	int general_all_of_process(const FImage&,FImage&,int,int,int,int&,CPoint&,int,int,int,int,const F_HSVRANGE&,const F_HSVRANGE&,const F_HSVRANGE&);
	void cross_validate(float ***_dat,int nn);

	// Blob analysis
	int AnalyseBlob__1(/*const FImage &Source*/int big[60][60]);
	int AnalyseBlob(const FImage&);	// Get position and size of every blobs on image
	bool PutFloodfillBorder(FImage&);	// Put border on the edge of image to prevent overlapping in floodfill operation
	bool PutFloodfillRegion(FImage &Target,int X1,int Y1,int X2,int Y2);
	void BlobMoveFirst(void);	// Move blob pointer to the first
	BOOL BlobGetNext(F_BLOB &);	// Get current blob's data, return false if no more
	BOOL BlobGetNext(F_BLOB &, int, int);	// Get next blob that satisfy condition, return flase if no more
	int Trai(float **passing,int train,int italic);
//int FImgProc::Trai(float **passing,int train,)

	void assignrecog(int *com);
	void blob_reforming(void);
	void findinthelevel(int levelrow,int levelnum);
	void shellSort(int *numbers,int *numbers_2,int array_size);
	void gen_text(void);
	BYTE get_character(int recnumber);
	void settraining(int toset);
	void stoptraining(void);
	void starttrain(int ar);
	int train_1(int nn,float ***b_dat,int ar);  //nn mean number of file
	void cleanmem(void);
	int getfinallevel(int **fff);


protected:
	//////NeuralNetwork	TheBrain;
	FILE *fp;
	F_BLOB	*m_blobs;
	int		m_blobcount;	// Blob count
	int		m_curblob;		// Current blob index
	C_INPUT *m_charinp;
	D_INPUT *m_dinp;
	int m_charcount;
	int m_curchar;
	int *ro;
	int *rowid;
	int *wideofline;
	int *LEVEL;
	int *blobseq;
	int **finallevel;
	int m_linecount;
	int numberofline;
	int cou__;
	int training;
};

#endif // !defined(AFX_FIMGPROC_H__8C27E401_EF2E_45F7_BA92_21E39D0CE808__INCLUDED_)
