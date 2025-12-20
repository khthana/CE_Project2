// ImgProc1.cpp: implementation of the CImgProc class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "ImgProc.h"
#include "ImgProc1.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

double sqr(double x) {
	return (x * x);
}

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CImgProc::CImgProc()
{

}

CImgProc::~CImgProc()
{

}

void CImgProc::HSIThreshold(CImg *source, CImg *dest, HSIRANGE *prHSI)
{
	HSICOLOR pxHSI;
	for (source->InitCount(); !source->EndOfImage(); source->NextCount()) {
		pxHSI = RGB2HSI(source->GetPixel(source->GetCurrentPoint()));
		if (InHSIRange(pxHSI, prHSI)) {	// If inrange set WHITE, otherwise set BLACK
			dest->SetPixel(source->GetCurrentPoint(), CImg::White());
		}
		else {
			dest->SetPixel(source->GetCurrentPoint(), CImg::Black());
		}
		
	}
}

HSICOLOR CImgProc::RGB2HSI(TBCOLOR tbC)	// Convert
{
	HSICOLOR hsiC;
	double theta;
	double RsG, RsB, GsB;
	double minRGB;
	double sumRGB;

	// Find theta
	RsG = tbC.red - tbC.green;
	RsB = tbC.red - tbC.blue;
	GsB = tbC.green - tbC.blue;
	theta = acos(((RsG + RsB) / 2) / sqrt(sqr(RsG) + (RsB * GsB))) * (180 / PI);

	// Determine Hue
	hsiC.hue = (__int16)theta;
	if (tbC.blue > tbC.green)
		hsiC.hue = 360 - hsiC.hue;

	// Find minimum value of R, G, B
	minRGB = tbC.red;
	if (tbC.green < minRGB) minRGB = tbC.green;
	if (tbC.blue < minRGB) minRGB = tbC.blue;

	// Determine Saturation
	sumRGB = (tbC.red + tbC.green + tbC.blue);
	hsiC.sat = (BYTE)(1 - ((3 / sumRGB) * minRGB));

	// Determine Intensity
	hsiC.inten = (BYTE)(sumRGB / 3);

	return hsiC;
}

BOOL CImgProc::InHSIRange(HSICOLOR cHSI, HSIRANGE *prHSI)
{
	if ((cHSI.hue < prHSI->hue1) | (cHSI.hue > prHSI->hue2))
		return FALSE;
	if ((cHSI.sat < prHSI->sat1) | (cHSI.sat > prHSI->sat2))
		return FALSE;
	if ((cHSI.inten < prHSI->inten1) | (cHSI.inten > prHSI->inten2))
		return FALSE;
	return TRUE;
}

void CImgProc::binExpand(CImg *source, CImg *dest)
{
	// !!! Binary image - reads from RED ONLY, writes to R,G,B !!!

	int i;
	CPoint *ptCur;
	UINT sigma;

	for (source->InitCount(); !source->EndOfImage(); source->NextCount()) {
		ptCur = source->GetCurrentPoint();
		if (!source->IsBorder(ptCur)) {
			sigma = 0;
			for (i=1; i<=8; i++)
				sigma += source->GetNeighborPx(ptCur, i).red;
			sigma = sigma / 255;
			if (sigma > 0)
				dest->SetPixel(ptCur, CImg::White());
			else
				dest->SetPixel(ptCur, CImg::Black());
		}
		else
			dest->SetPixel(ptCur, CImg::Black());
	}
}

void CImgProc::RGBThreshold(CImg *source, CImg *dest, RGBRANGE rgRGB)
{
	TBCOLOR pxRGB;
	double sum;
	for (source->InitCount(); !source->EndOfImage(); source->NextCount()) {
		pxRGB = source->GetPixel(source->GetCurrentPoint());
		sum = sqr((double)pxRGB.red - (double)rgRGB.red) + sqr((double)pxRGB.green - (double)rgRGB.green) + sqr((double)pxRGB.blue - (double)rgRGB.blue);
		if (sum <= sqr(rgRGB.tolerance)) {	// If inrange set white, otherwise set black
			dest->SetPixel(source->GetCurrentPoint(), CImg::White());
		}
		else {
			dest->SetPixel(source->GetCurrentPoint(), CImg::Black());
		}
		
	}
}

void CImgProc::binShrink(CImg *source, CImg *dest)
{
	// !!! Binary image - reads from RED ONLY, writes to R,G,B !!!

	int i;
	CPoint *ptCur;
	UINT sigma;

	for (source->InitCount(); !source->EndOfImage(); source->NextCount()) {
		ptCur = source->GetCurrentPoint();
		if (!source->IsBorder(ptCur)) {
			sigma = 0;
			for (i=1; i<=8; i++)
				sigma += source->GetNeighborPx(ptCur, i).red;
			sigma = sigma / 255;
			if (sigma < 8)
				dest->SetPixel(ptCur, CImg::Black());
			else
				dest->SetPixel(ptCur, CImg::White());
		}
		else
			dest->SetPixel(ptCur, CImg::Black());
	}
}

void CImgProc::binEdge(CImg *source, CImg *dest)
{
	// !!! Binary image - reads from RED ONLY, writes to R,G,B !!!

	int i;
	CPoint *ptCur;
	UINT sigma;

	for (source->InitCount(); !source->EndOfImage(); source->NextCount()) {
		ptCur = source->GetCurrentPoint();
		if (!source->IsBorder(ptCur)) {
			sigma = 0;
			for (i=1; i<=8; i++)
				sigma += source->GetNeighborPx(ptCur, i).red;
			sigma = sigma / 255;
			if (sigma == 8)
				dest->SetPixel(ptCur, CImg::Black());
			else
				dest->SetPixel(ptCur, source->GetNeighborPx(ptCur, 0));
		}
		else
			dest->SetPixel(ptCur, CImg::Black());
	}
}

void CImgProc::binNoize(CImg *source, CImg *dest)
{
	// !!! Binary image - reads from RED ONLY, writes to R,G,B !!!

	int i;
	CPoint *ptCur;
	UINT sigma;

	for (source->InitCount(); !source->EndOfImage(); source->NextCount()) {
		ptCur = source->GetCurrentPoint();
		if (!source->IsBorder(ptCur)) {
			sigma = 0;
			for (i=1; i<=8; i++)
				sigma += source->GetNeighborPx(ptCur, i).red;
			sigma = sigma / 255;
			if (sigma < 2)
				dest->SetPixel(ptCur, CImg::Black());
			else if (sigma > 6)
				dest->SetPixel(ptCur, CImg::White());
			else
				dest->SetPixel(ptCur, source->GetNeighborPx(ptCur, 0));
		}
		else
			dest->SetPixel(ptCur, CImg::Black());
	}
}

void CImgProc::binRemoveSalt(CImg *source, CImg *dest)
{
	// !!! Binary image - reads from RED ONLY, writes to R,G,B !!!

	int i;
	CPoint *ptCur;
	UINT sigma;

	for (source->InitCount(); !source->EndOfImage(); source->NextCount()) {
		ptCur = source->GetCurrentPoint();
		if (!source->IsBorder(ptCur)) {
			sigma = 0;
			for (i=1; i<=8; i++)
				sigma += source->GetNeighborPx(ptCur, i).red;
			sigma = sigma / 255;
			if (sigma == 0)
				dest->SetPixel(ptCur, CImg::Black());
			else
				dest->SetPixel(ptCur, source->GetNeighborPx(ptCur, 0));
		}
		else
			dest->SetPixel(ptCur, CImg::Black());
	}
}

void CImgProc::Rgb2Gray(CImg *source,CImg *dest)
{
	//int i;
	CPoint *ptCur;
	TBCOLOR temp;
    TBCOLOR graylevel;//UINT sigma;
    BYTE y;
	for(source->InitCount(); !source->EndOfImage(); source->NextCount()) 
	{
		ptCur = source->GetCurrentPoint();
		temp = source->GetPixel(ptCur);
		y = (BYTE)(0.3*temp.red + 0.59*temp.green + 0.11*temp.blue);
		graylevel = CImg::Gray(y);
	    dest->SetPixel(ptCur , graylevel);
	}
}

void CImgProc::binSegment(CImg *source, CImg *buf, CArray<SEGMENT, SEGMENT> *arSeg)
{
	CArray<CPoint, CPoint> qPoint;	// Point queue for floodfill iterative
	int count;	// Number of pixel of that segment
	CPoint ptTopLeft, ptBotRight; // Segment boundary
	SEGMENT seg;

	TBCOLOR black, white;
	black = CImg::Black();
	white = CImg::White();
	buf->ClearImg(black);	// Clear buffer

	for (source->InitCount(); !source->EndOfImage(); source->NextCount()) {	// Iterate image
		if (source->GetPixel(source->GetCurrentPoint()) == white)
			if (buf->GetPixel(source->GetCurrentPoint()) == black) {	// If found new segment
				count = 0;
				ptTopLeft = ptBotRight = *source->GetCurrentPoint();
				qPoint.Add(*source->GetCurrentPoint());	// Enqueue this point
				for (;qPoint.GetSize() > 0;)
					FloodFill(source, buf, &qPoint, count, &ptTopLeft, &ptBotRight);	// Floddfill segment
				seg.count = count;
				seg.centroid = ptBotRight + ptTopLeft;	// Calc for segment's centroid
				seg.centroid.x /= 2;
				seg.centroid.y /= 2;
				if (arSeg->GetSize() > 0) {
					if (seg.count > (*arSeg)[0].count) {
						arSeg->RemoveAll();
						arSeg->Add(seg);	// Replace with higher count segment
					}
				}
				else
					arSeg->Add(seg);	// Add new segment
			}
	}
}

void CImgProc::FloodFill(CImg *source, CImg *buf, CArray<CPoint, CPoint> *qPoint, int &count, CPoint *ptTopLeft, CPoint *ptBotRight)
{
	CPoint ptCur = qPoint->GetAt(0);

	if (qPoint->GetSize() == 0) return;	// No point to flooding

	buf->SetPixel(&ptCur, CImg::White());	// Mark this point
	qPoint->RemoveAt(0);	// Dequeue this point
	count++;				// Count up

	// Check and update segment boundary
	if  (ptCur.x < ptTopLeft->x) ptTopLeft->x = ptCur.x;
	if  (ptCur.y < ptTopLeft->y) ptTopLeft->y = ptCur.y;
	if  (ptCur.x > ptBotRight->x) ptBotRight->x = ptCur.x;
	if  (ptCur.y > ptBotRight->y) ptBotRight->y = ptCur.y;

	// Check for enqueue neighbor pixels
	TBCOLOR black, white, gray;
	black = CImg::Black();
	white = CImg::White();
	gray = CImg::Gray(128);
	CPoint ptMark;
	for (int i=1; i<9; i++)
		if (source->GetNeighborPx(&ptCur, i) == white)
			if (buf->GetNeighborPx(&ptCur, i) == black) {
				buf->SetNeighborPx(&ptCur, i, gray);		// Mark
				buf->GetNeighborPt(&ptCur, i, &ptMark);
				qPoint->Add(ptMark);	// enqueue new pixel
			}
}

// ############################################################################################

CImgProc2::CImgProc2()
{

}

CImgProc2::~CImgProc2()
{

}

void CImgProc2::RGB2HSV(BYTE red, BYTE green, BYTE blue, WORD &hue, BYTE &sat, BYTE &value)
{
	float min, max, delta, h;
	float fr = (float)red / 255;
	float fg = (float)green / 255;
	float fb = (float)blue / 255;

	max = min = fr;
	if (fg > max) max = fg;
	if (fb > max) max = fb;
	if (fg < min) min = fg;
	if (fb < min) min = fb;

	value = (BYTE)(max * 255);				// v
	delta = max - min;
	if( max != 0 )
		sat = (BYTE)((delta / max) * 255);		// s
	else {
		// r = g = b = 0		// s = 0, h is undefined
		sat = 0;
		hue = 0;
		return;
	}
	if( fr == max )
		h = ( fg - fb ) / delta;		// between yellow & magenta
	else if( fg == max )
		h = 2 + ( fb - fr ) / delta;	// between cyan & yellow
	else
		h = 4 + ( fr - fg ) / delta;	// between magenta & cyan
	h *= 60;				// degrees
	if( h < 0 )
		h += 360;
	hue = (WORD)h;
}

void CImgProc2::HSVThreshold(CImg *source, CImg *dest, HSIRANGE *range)
{
	HSVThreshold(source->GetDataPointer(), dest->GetDataPointer(), source->GetWidth() * source->GetHeight(), 
		range->hue1, range->hue2, range->sat1, range->sat2, range->inten1, range->inten2);
}

void CImgProc2::HSVThreshold(BYTE *source, BYTE *target, int count, 
	WORD hue1, WORD hue2, BYTE sat1, BYTE sat2, BYTE value1, BYTE value2)
{
	BYTE *sr, *sg, *sb;
	BYTE *tr, *tg, *tb;
	WORD hue;
	BYTE sat, value;
	float min, max, delta, h;
	float fr, fg, fb;

	sb = &source[0];
	sg = &source[1];
	sr = &source[2];
	tb = &target[0];
	tg = &target[1];
	tr = &target[2];
	for (int i=0; i<count; i++)
	{
		// Convert from [0,255] to [0,1]
		fb = (float)(*sb) / 255;
		fg = (float)(*sg) / 255;
		fr = (float)(*sr) / 255;

		max = min = fr;
		if (fg > max) max = fg;
		if (fb > max) max = fb;
		if (fg < min) min = fg;
		if (fb < min) min = fb;

		// Get value
		value = (BYTE)(max * 255);
		if ((value1 > value) || (value > value2)) 
		{ 
			*tr = *tg = *tb = 0;
		}
		else 
		{
			// Get saturation
			delta = max - min;
			if( max != 0 )
				sat = (BYTE)((delta / max) * 255);
			else {
				sat = 0;
				hue = 0;
				return;
			}
			if ((sat1 > sat) || (sat > sat2))
			{
				*tr = *tg = *tb = 0;
			}
			else 
			{
				// Get hue
				if( fr == max )
					h = ( fg - fb ) / delta;		// between yellow & magenta
				else if( fg == max )
					h = 2 + ( fb - fr ) / delta;	// between cyan & yellow
				else
					h = 4 + ( fr - fg ) / delta;	// between magenta & cyan
				h *= 60;
				if( h < 0 )
					h += 360;
				hue = (WORD)h;
				if ((hue1 > hue) || (hue > hue2))
				{
					*tr = *tg = *tb = 0;
				}
				else 
				{
					*tr = *tg = *tb = 255;
				}
			}
		}

		// Next pixel
		sb += 3;
		sg += 3;
		sr += 3;
		tb += 3;
		tg += 3;
		tr += 3;
	}
}