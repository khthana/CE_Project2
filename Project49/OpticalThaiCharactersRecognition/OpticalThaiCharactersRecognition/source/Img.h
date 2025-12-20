// Img.h: interface for the CImg class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_IMG_H__B1762EC0_9AD3_4289_8B71_7F81E3D2121D__INCLUDED_)
#define AFX_IMG_H__B1762EC0_9AD3_4289_8B71_7F81E3D2121D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

//#include "VideoOCX.h"

/*typedef*/ 
struct TBCOLOR 
{
	BYTE blue;
	BYTE green;
	BYTE red;

	TBCOLOR() {}

	TBCOLOR(BYTE r, BYTE g, BYTE b) {
		red = r;
		green = g;
		blue = b;
	}

	TBCOLOR &operator=(TBCOLOR source) {
		red = source.red;
		green = source.green;
		blue = source.blue;
		return *this;
	}

	BOOL operator== (TBCOLOR source) {
		return ((red==source.red) & (green == source.green) & (blue == source.blue));
	}
};

class CImg  
{
public:
    void PutMark(const CPoint *,const CPoint *,TBCOLOR);
	// Neighbor pixels
	void GetNeighborPt(const CPoint *, int, CPoint *ptRet) const;	// Get neighbor point
	void SetNeighborPx(const CPoint *, int, TBCOLOR);	// Set neighbor pixel
	TBCOLOR GetNeighborPx(const CPoint *, int) const;	// Get neighbor pixel

	virtual BOOL IsBorder(const CPoint *);	// Check if specified pixel is at border of image
	void ClearImg(TBCOLOR);		// Fill whole image pixel with specified color
	long GetImgHandle(void);	// Get VideoOCX image handle

	// Static function
	static TBCOLOR White(void);
	static TBCOLOR Black(void);
	static TBCOLOR Gray(BYTE);

	// Itearation functions
	CPoint * GetCurrentPoint(void);	// Get current point of iteration
	virtual void NextCount(void);	// Advanced to next pixel for iteration
	virtual BOOL EndOfImage(void);	// Determine if end of image of iteration
	void InitCount(void);			// Start counter for pixel iteration

	void SetPixel(const CPoint *, TBCOLOR);	// Get color of pixel
	TBCOLOR GetPixel(const CPoint *) const;	// Set pixel of given color

	BYTE * GetDataPointer();
	int GetWidth();
	int GetHeight();

//	virtual BOOL CreateImage(CVideoOCX *, const CSize *);	// Allocate image buffer on CVideoOCX
//	BOOL ReleaseImage(CVideoOCX *);	// Deallocate image buffer on CVideoOCX
	CImg(TBCOLOR *, CSize *);
	CImg();
	virtual ~CImg();

protected:
	BOOL IsOutofBound(const CPoint *) const;		// Determine if a point is out of bound
	virtual UINT GetIndex(const CPoint *) const;	// Get actual image data array index

	long m_hImage;		// VideoOCX image handle
	CSize m_ImgSize;	// Size of image
public:
	TBCOLOR *m_pImgDat;	// Pointer to image data

	// Iteration variables
	CPoint m_Count;
};

#endif // !defined(AFX_IMG_H__B1762EC0_9AD3_4289_8B71_7F81E3D2121D__INCLUDED_)
