// GImage.h: interface for the C2Image class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_GIMAGE_H__E6AD0CF1_435E_4279_8C7B_7A1281071030__INCLUDED_)
#define AFX_GIMAGE_H__E6AD0CF1_435E_4279_8C7B_7A1281071030__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Image.h: interface for the C2Image class.
//
//////////////////////////////////////////////////////////////////////

#include <afxwin.h>

class C2Image  
{
protected:
	
//	BYTE * remain;//befor offset
	
	
public:
	BYTE GetPixel(CPoint pt);
	
	BITMAPFILEHEADER bmfHeader;
	BITMAPINFOHEADER bmiHeader;
	RGBQUAD *Palette;
	BYTE *datapixel;
	

	C2Image(const C2Image&);
	C2Image(BITMAPFILEHEADER fileheader,BITMAPINFOHEADER infoheader);
	C2Image(LONG Wd,LONG Ht);
	const C2Image &operator =(const C2Image& Scr);

	//BYTE* GetRem();
	
	bool WriteToFile(CString filename);
	bool GetData(CString filename);	
	bool SetPixel(int x, int y, BYTE color);
	BYTE GetPixel(int x, int y);
	void Setdata( LONG Wd,LONG Ht);

	
	C2Image();
	virtual ~C2Image();

};




#endif // !defined(AFX_GIMAGE_H__E6AD0CF1_435E_4279_8C7B_7A1281071030__INCLUDED_)
