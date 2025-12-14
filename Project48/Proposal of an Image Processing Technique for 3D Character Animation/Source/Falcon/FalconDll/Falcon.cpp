// Falcon.cpp : Defines the entry point for the DLL application.
//

#include "stdafx.h"
#include "FImage.h"
#include "FImgProc.h"
#include "FImgDraw.h"
#include "Math.h"

// Global variables
int ImgWidth, ImgHeight;
FImgProc imgproc;

BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
    return TRUE;
}

void WINAPI FAL_SetImageDimension(int Width, int Height)
{
	ImgWidth = Width;
	ImgHeight = Height;
}

int WINAPI FAL_RGBThreshold(void *Source, void *Target, F_RGBRANGE &RgbRng)
{
	FImage imgSource((F_PIXEL*)Source, ImgWidth, ImgHeight);
	FImage imgTarget((F_PIXEL*)Target, ImgWidth, ImgHeight);

	return imgproc.Threshold(imgSource, imgTarget, RgbRng);
}


int WINAPI FAL_HSVThreshold(void *Source, void *Target, F_HSVRANGE &HsvRng, int HueOffset)
{
	FImage imgSource((F_PIXEL*)Source, ImgWidth, ImgHeight);
	FImage imgTarget((F_PIXEL*)Target, ImgWidth, ImgHeight);

	return imgproc.Threshold(imgSource, imgTarget, HsvRng, HueOffset);
}

BOOL WINAPI FAL_PutFloodfillBorder(void *Target)
{
	FImage imgTarget((F_PIXEL*)Target, ImgWidth, ImgHeight);

	return imgproc.PutFloodfillBorder(imgTarget);
}

int WINAPI FAL_AnalyseBlob1(void *Source)
{
	FImage imgSource((F_PIXEL*)Source, ImgWidth, ImgHeight);

	return imgproc.AnalyseBlob(imgSource);
}

int WINAPI FAL_AnalyseBlob2(void *Source, F_BLOB *blobs, int blob_count)
{
	FImage imgSource((F_PIXEL*)Source, ImgWidth, ImgHeight);

	return imgproc.AnalyseBlob(imgSource, blobs, blob_count);
}

void WINAPI FAL_BlobMoveFirst()
{
	imgproc.BlobMoveFirst();
}

int WINAPI FAL_BlobGetNextS(F_BLOB &Blob, int SizeMin, int SizeMax)
{
	return imgproc.BlobGetNext(Blob, SizeMin, SizeMax);
}

BOOL WINAPI FAL_BlobGetData(F_BLOB &Blob, int Index)
{
	return imgproc.BlobGetData(Blob, Index);
}

int WINAPI FAL_BlobGetDataSNR(F_BLOB& Blob, int SizeMin, int SizeMax, int x, int y, int radius)
{
	return imgproc.BlobGetData(Blob, SizeMin, SizeMax, x, y, radius);
}

int WINAPI FAL_BlobGetNextSR(F_BLOB& Blob, int SizeMin, int SizeMax, int x, int y, int radius)
{
	return imgproc.BlobGetNext(Blob, SizeMin, SizeMax, x, y, radius);
}

int WINAPI FAL_BlobGetNextS(FBLOB& Blob, int SizeMin, int SizeMax)
{
	return imgproc.BlobGetNext(Blob, SizeMin, SizeMax);
}

BOOL WINAPI FAL_PutBlobMask(void *Target, int Index, F_PIXEL &Color)
{
	FImage imgTarget((F_PIXEL*)Target, ImgWidth, ImgHeight);
	
	return imgproc.PutBlobMask(imgTarget, Index, Color);
}

void WINAPI FAL_BlobMarkFalse(int Index)
{
	imgproc.BlobMarkFalse(Index);
}

void WINAPI RGBtoHSV( float r, float g, float b, float &h, float &s, float &v )
{
	float min, max, delta;

	// Find max & min value using binary tree
	if (r > g)
		if (g > b) { max = r; min = b; }
		else
			if (r > b) { max = r; min = g; }
			else { max = b; min = g; }
	else
		if (g > b)
			if (r > b) { max  = g; min = b; }
			else { max = g; min = r; }
		else { max = b; min = r; }

	v = max;				// v
	delta = max - min;
	if( max != 0 )
		s = delta / max;		// s
	else {
		// r = g = b = 0		// s = 0, v is undefined
		s = 0;
		h = -1;
		return;
	}
	if( r == max )
		h = ( g - b ) / delta;		// between yellow & magenta
	else if( g == max )
		h = 2 + ( b - r ) / delta;	// between cyan & yellow
	else
		h = 4 + ( r - g ) / delta;	// between magenta & cyan
	h *= 60;				// degrees
	if( h < 0 )
		h += 360;
}

void WINAPI HSVtoRGB( float &r, float &g, float &b, float h, float s, float v )
{
	int i;
	float f, p, q, t;
	if( s == 0 ) {
		// achromatic (grey)
		r = g = b = v;
		return;
	}
	h /= 60;			// sector 0 to 5
	i = (int)floor( h );
	f = h - i;			// factorial part of h
	p = v * ( 1 - s );
	q = v * ( 1 - s * f );
	t = v * ( 1 - s * ( 1 - f ) );
	switch( i ) {
		case 0:
			r = v;
			g = t;
			b = p;
			break;
		case 1:
			r = q;
			g = v;
			b = p;
			break;
		case 2:
			r = p;
			g = v;
			b = t;
			break;
		case 3:
			r = p;
			g = q;
			b = v;
			break;
		case 4:
			r = t;
			g = p;
			b = v;
			break;
		default:		// case 5:
			r = v;
			g = p;
			b = q;
			break;
	}
}

void WINAPI FAL_SetBlobData(F_BLOB *blobs, int blob_count)
{
	imgproc.SetBlobData(blobs, blob_count);
}

void WINAPI FAL_UnsetBlobData()
{
	imgproc.UnsetBlobData();
}


void WINAPI FAL_DrawCrosshair(void *Target, int ptx, int pty, int size, F_PIXEL &color)
{
	FImage imgTarget((F_PIXEL*)Target, ImgWidth, ImgHeight);

	FImgDraw::DrawCrosshair(imgTarget, ptx, pty, size, color);
}

void WINAPI FAL_CopyImage(void *Source, void *Target)
{
	FImage imgSource((F_PIXEL*)Source, ImgWidth, ImgHeight);
	FImage imgTarget((F_PIXEL*)Target, ImgWidth, ImgHeight);

	imgSource.CopyTo(imgTarget);
}
