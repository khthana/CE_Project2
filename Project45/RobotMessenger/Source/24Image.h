// Image.h: interface for the C24Image class.
//
//////////////////////////////////////////////////////////////////////

#include <afxwin.h>
#if !defined(AFX_IMAGE_H__EFE38A33_0FC4_4ABB_8F68_CC6B6F9E693D__INCLUDED_)
#define AFX_IMAGE_H__EFE38A33_0FC4_4ABB_8F68_CC6B6F9E693D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define Red         100
#define Green		101
#define Blue		102


struct CColor{
	 BYTE	Bpixel;
	 BYTE	Gpixel;
	 BYTE	Rpixel;
public:
};

class C24Image  
{
protected:
	
//	BYTE * remain;//befor offset
	
	
public:
	
	CColor *datapixel;
	BITMAPFILEHEADER bmfHeader;
	BITMAPINFOHEADER bmiHeader;

	C24Image(const C24Image&);
	C24Image(BITMAPFILEHEADER fileheader,BITMAPINFOHEADER infoheader);
	C24Image(LONG Wd,LONG Ht,WORD bpp=24);
	const C24Image &operator =(const C24Image& Scr);

	//BYTE* GetRem();
	
	bool WriteToFile(CString filename);
	bool GetData(CString filename);	
	bool SetGreen(int x, int y, int colour);
	bool SetRed(int x, int y, int colour);
	bool SetBlue(int x,int y, int colour);
	int GetGreen(int x, int y);
	int GetBlue(int x, int y);
	int GetRed(int x,int y);
	bool SetPixel(int x, int y, BYTE R, BYTE G, BYTE B);
	CColor GetPixel(int x, int y);
	bool SetPixel(int x,int y,CColor color);
	
	C24Image();
	virtual ~C24Image();

};



#endif // !defined(AFX_IMAGE_H__EFE38A33_0FC4_4ABB_8F68_CC6B6F9E693D__INCLUDED_)
