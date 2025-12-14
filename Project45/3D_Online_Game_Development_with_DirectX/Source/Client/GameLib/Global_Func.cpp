#include "Global_Func.h"

void TransBlt(HDC destDC,int X,int Y,int Width,int Height,HBITMAP Bitmap,int RValue,int GValue,int BValue)
{
	HDC backdc = CreateCompatibleDC(destDC);
	COLORREF Color;
	SelectObject(backdc, Bitmap);

	for (WORD y=0; y<Height; y++)
	{
		for (WORD x=0; x<Width; x++)
		{
			Color = GetPixel(backdc,x,y);
			COLORREF TransColor = RGB(RValue,GValue,BValue);
			if (Color == TransColor)
			{
			}
			else
			{
				SetPixel(destDC,X+x,Y+y,Color);
			}
		}
	  }
	DeleteObject(backdc);
}

HRGN CreateRegion(HWND hWnd,HBITMAP Bitmap,int Width,int Height,int RValue,int GValue,int BValue)
{
	HRGN hRgn, hTmpRgn;
	COLORREF Color;

	HDC hdc = GetDC(hWnd);
	HDC backdc = CreateCompatibleDC(hdc);
	SelectObject(backdc, Bitmap);

	hRgn = CreateRectRgn(0, 0, Width, Height);

	for (WORD y=0; y<Height; y++)
	{
		for (WORD x=0; x<Width; x++)
		{
			Color = GetPixel(backdc,x,y);
			COLORREF c = RGB(RValue,GValue,BValue);
			if (GetRValue(Color)==RValue && GetGValue(Color)==GValue && GetBValue(Color)==BValue)
			{
				hTmpRgn = CreateRectRgn(x,y,x+1,y+1);
				CombineRgn(hRgn, hRgn, hTmpRgn, RGN_XOR);
				DeleteObject(hTmpRgn);
			}
		}
	  }
	ReleaseDC(hWnd, hdc);

	return hRgn;
}
