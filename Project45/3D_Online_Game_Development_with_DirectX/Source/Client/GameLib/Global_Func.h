#ifndef _GLOBAL_FUNC_H_
#define _GLOBAL_FUNC_H_

#include <windows.h>
#include <windowsx.h>

void TransBlt(HDC destDC,int X,int Y,int Width,int Height,HBITMAP Bitmap,int RValue,int GValue,int BValue);

HRGN CreateRegion(HWND hWnd,HBITMAP Bitmap,int Width,int Height,int RValue,int GValue,int BValue);

#endif
