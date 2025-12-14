// FImgProc.h: interface for the FImgProc class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FIMGPROC_H__8C27E401_EF2E_45F7_BA92_21E39D0CE808__INCLUDED_)
#define AFX_FIMGPROC_H__8C27E401_EF2E_45F7_BA92_21E39D0CE808__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "FImage.h"

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
	int ffalse;		// For support functions
} F_BLOB;

// ----------------------------------------------------------------------

class FImgProc  
{
public:
	FImgProc();
	virtual ~FImgProc();

	// ########## Thresholding ##########
	// Description:	Thresholding in RGB color space
	// Function:	Set pixel to white if its color is within RGB range, otherwise, set to black
	// Return:		Number of white pixels
	int Threshold(FImage&, const F_RGBRANGE&);						// Threshold on target image
	int Threshold(const FImage&, FImage&, const F_RGBRANGE&);		// Read pixel from source image and write to target image

	// Description:	Thresholding in HSV color space
	// Function:	Set pixel to white if its color is within HSV range, otherwise, set to black
	// Return:		Number of white pixels
	int Threshold(FImage&, const F_HSVRANGE&, int);					// Threshold on target image
	int Threshold(const FImage&, FImage&, const F_HSVRANGE&, int);	// Read pixel from source image and write to target image
	// ##################################################

	// ########## Blob analysis ##########
	// Description:	Find blob's position by Floodfill algorithm
	// Function:	If white pixel found, floodfill to find its size in pixel and its boundary
	// Return:		Number of blobs found
	int AnalyseBlob(const FImage&);					// Analysis on target image
	int AnalyseBlob(const FImage&, F_BLOB*, int);	// Analysis on target image with specify buffer & size

	// Description:	Set all border pixels to black to prevent floodfill overlap (should be called before AnalyseBlob)
	BOOL PutFloodfillBorder(FImage&);

	// Description:	Draw color mask of specified blob index
	BOOL PutBlobMask(FImage&, int, F_PIXEL&);

	// Description:	Built-in blob data iteration functions
	void BlobMoveFirst(void);				// Move to the first blob
	int BlobGetNext(F_BLOB&);				// Get next blob's data & return its index, return -1 if no more
	int BlobGetNext(F_BLOB&, int, int);		// Get next blob that its size is in the specified range, return -1 if no more
	int BlobGetNext(F_BLOB&, int, int, int, int ,int);		// For every blobs that its size is in specified range, get blob that is don't far beyond specified radius from specified point
	BOOL BlobGetData(F_BLOB&, int);			// Get blob data
	int BlobGetData(F_BLOB&, int, int);		// Get blob's data that nearest the specified point
	int BlobGetData(F_BLOB&, int, int, int, int);		// For every blobs that its size is in specified range, get blob that is the nearest specified point
	int BlobGetData(F_BLOB&, int, int, int, int ,int);		// For every blobs that its size is in specified range, get blob that is the nearest specified point and don't far beyond specified radius

	// Description: External data manipulation functions for blob iteraion
	void SetBlobData(F_BLOB*, int);	// Set data and its size
	void UnsetBlobData();			// Unset data (Must be called before next Anylysis)

	// Description: Blob iteration support functions
	void BlobMarkFalse(int);	// Mark this blob by index not tobe get again
	// ##################################################

protected:
	// Blob analysis variables
	F_BLOB	*m_blobs;		// Pointer to blob data
	int		*m_imgmap;		// Image map
	int		m_blobcount;	// Blob count
	int		m_curblob;		// Current blob index

	F_BLOB	*m_oldblobs;	// Pointer to old data (for external set)
	int		m_oldblobcount;	// Old blob count (for external set)
	int		m_oldcurblob;	// Old blob index (for external set)
};

#endif // !defined(AFX_FIMGPROC_H__8C27E401_EF2E_45F7_BA92_21E39D0CE808__INCLUDED_)
