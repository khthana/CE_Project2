// GImage.h: interface for the CGImage class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_GIMAGE_H__E6AD0CF1_435E_4279_8C7B_7A1281071030__INCLUDED_)
#define AFX_GIMAGE_H__E6AD0CF1_435E_4279_8C7B_7A1281071030__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Image.h: interface for the CGImage class.
//
//////////////////////////////////////////////////////////////////////

#include <afxwin.h>

class CGImage  
{
protected:
	
//	BYTE * remain;//befor offset
	
	
public:
	
	BITMAPFILEHEADER bmfHeader;
	BITMAPINFOHEADER bmiHeader;
	RGBQUAD *Palette;
	BYTE *datapixel;
	

	CGImage(const CGImage&);
	CGImage(BITMAPFILEHEADER fileheader,BITMAPINFOHEADER infoheader,RGBQUAD);
	CGImage(LONG Wd,LONG Ht,int color=2,WORD bpp=8);
	const CGImage &operator =(const CGImage& Scr);

	//BYTE* GetRem();
	
	bool WriteToFile(CString filename);
	bool GetData(CString filename);	
	bool SetPixel(int x, int y, BYTE color);
	BYTE GetPixel(int x, int y);
	BYTE GetPixel(CPoint pt);
	void Setdata(LONG Wd,LONG Ht,int color=2,WORD bpp=8);

	
	CGImage();
	virtual ~CGImage();

};




#endif // !defined(AFX_GIMAGE_H__E6AD0CF1_435E_4279_8C7B_7A1281071030__INCLUDED_)
