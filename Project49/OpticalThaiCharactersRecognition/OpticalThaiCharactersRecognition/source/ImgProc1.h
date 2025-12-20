// ImgProc1.h: interface for the CImgProc class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_IMGPROC1_H__AD65E9BC_62ED_4FAD_BDE7_68AB6F1A647E__INCLUDED_)
#define AFX_IMGPROC1_H__AD65E9BC_62ED_4FAD_BDE7_68AB6F1A647E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <math.h>
#include <afxtempl.h>
#include "Img.h"

#ifndef PI
	#define PI 3.1415926535897932384626433832795
#endif

double sqr(double);

struct HSICOLOR {
	WORD hue;
	BYTE sat;
	BYTE inten;
};

struct HSIRANGE {
	WORD hue1;
	WORD hue2;
	BYTE sat1;
	BYTE sat2;
	BYTE inten1;
	BYTE inten2;
};

struct RGBRANGE {
	BYTE red;
	BYTE green;
	BYTE blue;
	BYTE tolerance;

	RGBRANGE &operator=(RGBRANGE source) {
		red = source.red;
		green = source.green;
		blue = source.blue;
		tolerance = source.tolerance;
		return *this;
	}

	RGBRANGE &operator=(TBCOLOR source) {
		red = source.red;
		green = source.green;
		blue = source.blue;
		return *this;
	}
};

struct SEGMENT {
	CPoint centroid;
	int count;
};

class CImgProc  
{
public:
	static void binSegment(CImg *source, CImg *buf, CArray<SEGMENT, SEGMENT> *);	// Segmentation

	// Binary Image Operations
	static void binNoize(CImg *source, CImg *dest);		// Noise removal
	static void binEdge(CImg *source, CImg *dest);		// Find edges
	static void binShrink(CImg *source, CImg *dest);	// Shrink white color
	static void binExpand(CImg *source, CImg *dest);	// Expand white color
	static void binRemoveSalt(CImg *source, CImg *dest); // Remove salt (white) point
    static void Rgb2Gray(CImg *source,CImg *dest);
	// Thresholding functions
	static void RGBThreshold(CImg *source, CImg *dest, RGBRANGE);	// Thresholding image with RGB range
	static void HSIThreshold(CImg *source, CImg *dest, HSIRANGE *);	// Thresholding image with HSI range

	// Supported functions
	static BOOL InHSIRange(HSICOLOR, HSIRANGE *);	// If specied HSI color in HSI range
	static HSICOLOR RGB2HSI(TBCOLOR);	// Convert RGB to HSI color

	CImgProc();
	virtual ~CImgProc();

protected:
	static void FloodFill(CImg *source, CImg *buf, CArray<CPoint, CPoint> *, int &, CPoint *, CPoint *);
};


class CImgProc2
{
public:
	// Color space conversion
	static void RGB2HSV(BYTE red, BYTE green, BYTE blue, WORD &hue, BYTE &sat, BYTE &value);

	// Thresholding
	static void HSVThreshold(BYTE *source, BYTE *target, int count, 
			WORD hue1, WORD hue2, BYTE sat1, BYTE sat2, BYTE value1, BYTE value2);
	static void HSVThreshold(CImg *source, CImg *dest, HSIRANGE *);

	CImgProc2();
	virtual ~CImgProc2();
};

#endif // !defined(AFX_IMGPROC1_H__AD65E9BC_62ED_4FAD_BDE7_68AB6F1A647E__INCLUDED_)
