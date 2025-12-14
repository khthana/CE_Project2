// dibapi.h
//
// This is a part of the Microsoft Foundation Classes C++ library.
// Copyright (C) 1992-1998 Microsoft Corporation
// All rights reserved.
//
// This source code is only intended as a supplement to the
// Microsoft Foundation Classes Reference and related
// electronic documentation provided with the library.
// See these sources for detailed information regarding the
// Microsoft Foundation Classes product.


#ifndef _INC_DIBAPI
#define _INC_DIBAPI

/* Handle to a DIB */
DECLARE_HANDLE(HDIB);

/* DIB constants */
#define PALVERSION   0x300

/* DIB Macros*/

#define IS_WIN30_DIB(lpbi)  ((*(LPDWORD)(lpbi)) == sizeof(BITMAPINFOHEADER))
#define RECTWIDTH(lpRect)     ((lpRect)->right - (lpRect)->left)
#define RECTHEIGHT(lpRect)    ((lpRect)->bottom - (lpRect)->top)

// WIDTHBYTES performs DWORD-aligning of DIB scanlines.  The "bits"
// parameter is the bit count for the scanline (biWidth * biBitCount),
// and this macro returns the number of DWORD-aligned bytes needed
// to hold those bits.

#define WIDTHBYTES(bits)    (((bits) + 31) / 32 * 4)

//Dib Header Marker - used in writing DIBs to files 
#define DIB_HEADER_MARKER   ((WORD) ('M' << 8) | 'B')

/* Function prototypes */
//BOOL      WINAPI  PaintDIB (HDC, LPRECT, HDIB, LPRECT, CPalette* pPal);
BOOL      WINAPI  CreateDIBPalette(HGLOBAL hDIB, CPalette* cPal);
LPSTR     WINAPI  FindDIBBits (LPSTR lpbi);
DWORD     WINAPI  DIBWidth (LPSTR lpDIB);
DWORD     WINAPI  DIBHeight (LPSTR lpDIB);
DWORD     WINAPI  BitCount (LPSTR lpDIB);
WORD      WINAPI  PaletteSize (LPSTR lpbi);
WORD      WINAPI  DIBNumColors (LPSTR lpbi);
HGLOBAL   WINAPI  CopyHandle (HGLOBAL h);

BOOL      WINAPI  SaveDIB (HDIB hDib, CFile& file);
HDIB      WINAPI  ReadDIBFile(CFile& file);
RGBQUAD	  WINAPI GetPixel(HGLOBAL m_hDIB, CPalette* m_palDIB, int x, int y);
void	  WINAPI SetPixel(HGLOBAL m_hDIB, CPalette* m_palDIB, RGBQUAD pixColor,int x, int y);


/* All Function that use to execute image*/
void Binarization1(HGLOBAL hDIB,CPalette* pPalDIB,int x1,int x2,int y1,int y2);
int Binarization2(HGLOBAL hDIB,CPalette* pPalDIB,int x1,int x2,int y1,int y2);
void Binary_Row(HGLOBAL hDIB,CPalette* pPalDIB,CString file_name);
void CreateHistogram(int x1,int x2,int y1,int y2);
void Find_Col(HGLOBAL hDIB,CPalette* pPalDIB);
void Find_Row();
float findAvgGradient(int check);
void findGradient(HGLOBAL hDIB,CPalette* pPalDIB,int x1,int x2,int y1,int y2);
int findThreshold(HGLOBAL hDIB,CPalette* pPalDIB,int x1,int x2,int y1,int y2,int check,int check2);
int Hist_checking(HGLOBAL hDIB,CPalette* pPalDIB,int x1,int x2,int y1,int y2,int threshold);
void Initial_stand();
int Iter_threshold(HGLOBAL hDIB,CPalette* pPalDIB,int x1,int x2,int y1,int y2);
int max4(int p0, int p1, int p2, int p3);
int max6(int p0, int p1, int p2, int p3, int p4, int p5);
int max9(int p0, int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8);
int Output();
int round(float n);
void Sub_Exe(HGLOBAL hDIB,CPalette* pPalDIB) ;
void Total_Row() ;
BOOL LoadBMP(LPCTSTR sBMPFile, HGLOBAL *phDIB, CPalette *pPalDIB,int *bmHeight,int *bmWidth);

#endif //!_INC_DIBAPI
