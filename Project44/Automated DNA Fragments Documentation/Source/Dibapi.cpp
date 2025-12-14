//  dibapi.cpp
//
//  Source file for Device-Independent Bitmap (DIB) API.  Provides
//  the following functions:
//
//  PaintDIB()          - Painting routine for a DIB
//  CreateDIBPalette()  - Creates a palette from a DIB
//  FindDIBBits()       - Returns a pointer to the DIB bits
//  DIBWidth()          - Gets the width of the DIB
//  DIBHeight()         - Gets the height of the DIB
//  PaletteSize()       - Gets the size required to store the DIB's palette
//  DIBNumColors()      - Calculates the number of colors
//                        in the DIB's color table
//  CopyHandle()        - Makes a copy of the given global memory block
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

#include "stdafx.h"
#include "dibapi.h"
#include <io.h>
#include <errno.h>


/*************************************************************************
 *
 * PaintDIB()
 *
 * Parameters:
 *
 * HDC hDC          - DC to do output to
 *
 * LPRECT lpDCRect  - rectangle on DC to do output to
 *
 * HDIB hDIB        - handle to global memory with a DIB spec
 *                    in it followed by the DIB bits
 *
 * LPRECT lpDIBRect - rectangle of DIB to output into lpDCRect
 *
 * CPalette* pPal   - pointer to CPalette containing DIB's palette
 *
 * Return Value:
 *
 * BOOL             - TRUE if DIB was drawn, FALSE otherwise
 *
 * Description:
 *   Painting routine for a DIB.  Calls StretchDIBits() or
 *   SetDIBitsToDevice() to paint the DIB.  The DIB is
 *   output to the specified DC, at the coordinates given
 *   in lpDCRect.  The area of the DIB to be output is
 *   given by lpDIBRect.
 *
 ************************************************************************/
/*
BOOL WINAPI PaintDIB(HDC     hDC,
					LPRECT  lpDCRect,
					HDIB    hDIB,
					LPRECT  lpDIBRect,
					CPalette* pPal)
{
	LPSTR    lpDIBHdr;            // Pointer to BITMAPINFOHEADER
	LPSTR    lpDIBBits;           // Pointer to DIB bits
	BOOL     bSuccess=FALSE;      // Success/fail flag
	HPALETTE hPal=NULL;           // Our DIB's palette
	HPALETTE hOldPal=NULL;        // Previous palette

	// Check for valid DIB handle
	if (hDIB == NULL)
		return FALSE;

	// Lock down the DIB, and get a pointer to the beginning of the bit
	// buffer
	//
	lpDIBHdr  = (LPSTR) ::GlobalLock((HGLOBAL) hDIB);
	lpDIBBits = ::FindDIBBits(lpDIBHdr);

	// Get the DIB's palette, then select it into DC
	if (pPal != NULL)
	{
		hPal = (HPALETTE) pPal->m_hObject;

		// Select as background since we have
		// already realized in forground if needed
		hOldPal = ::SelectPalette(hDC, hPal, TRUE);
	}

	// Make sure to use the stretching mode best for color pictures
	::SetStretchBltMode(hDC, COLORONCOLOR);

	// Determine whether to call StretchDIBits() or SetDIBitsToDevice()
	if ((RECTWIDTH(lpDCRect)  == RECTWIDTH(lpDIBRect)) &&
	   (RECTHEIGHT(lpDCRect) == RECTHEIGHT(lpDIBRect)))
		bSuccess = ::SetDIBitsToDevice(hDC,                    // hDC
								   lpDCRect->left,             // DestX
								   lpDCRect->top,              // DestY
								   RECTWIDTH(lpDCRect),        // nDestWidth
								   RECTHEIGHT(lpDCRect),       // nDestHeight
								   lpDIBRect->left,            // SrcX
								   (int)DIBHeight(lpDIBHdr) -
									  lpDIBRect->top -
									  RECTHEIGHT(lpDIBRect),   // SrcY
								   0,                          // nStartScan
								   (WORD)DIBHeight(lpDIBHdr),  // nNumScans
								   lpDIBBits,                  // lpBits
								   (LPBITMAPINFO)lpDIBHdr,     // lpBitsInfo
								   DIB_RGB_COLORS);            // wUsage
   else
	  bSuccess = ::StretchDIBits(hDC,                          // hDC
							   lpDCRect->left,                 // DestX
							   lpDCRect->top,                  // DestY
							   RECTWIDTH(lpDCRect),            // nDestWidth
							   RECTHEIGHT(lpDCRect),           // nDestHeight
							   lpDIBRect->left,                // SrcX
							   lpDIBRect->top,                 // SrcY
							   RECTWIDTH(lpDIBRect),           // wSrcWidth
							   RECTHEIGHT(lpDIBRect),          // wSrcHeight
							   lpDIBBits,                      // lpBits
							   (LPBITMAPINFO)lpDIBHdr,         // lpBitsInfo
							   DIB_RGB_COLORS,                 // wUsage
							   SRCCOPY);                       // dwROP

   ::GlobalUnlock((HGLOBAL) hDIB);

	// Reselect old palette
	if (hOldPal != NULL)
	{
		::SelectPalette(hDC, hOldPal, TRUE);
	}

   return bSuccess;
}
*/

/*************************************************************************
 *
 * CreateDIBPalette()
 *
 * Parameter:
 *
 * HDIB hDIB        - specifies the DIB
 *
 * Return Value:
 *
 * HPALETTE         - specifies the palette
 *
 * Description:
 *
 * This function creates a palette from a DIB by allocating memory for the
 * logical palette, reading and storing the colors from the DIB's color table
 * into the logical palette, creating a palette from this logical palette,
 * and then returning the palette's handle. This allows the DIB to be
 * displayed using the best possible colors (important for DIBs with 256 or
 * more colors).
 *
 ************************************************************************/


BOOL WINAPI CreateDIBPalette(HGLOBAL hDIB, CPalette* pPal)
{
	LPLOGPALETTE lpPal;      // pointer to a logical palette
	HANDLE hLogPal;          // handle to a logical palette
	HPALETTE hPal = NULL;    // handle to a palette
	int i;                   // loop index
	WORD wNumColors;         // number of colors in color table
	LPSTR lpbi;              // pointer to packed-DIB
	LPBITMAPINFO lpbmi;      // pointer to BITMAPINFO structure (Win3.0)
	LPBITMAPCOREINFO lpbmc;  // pointer to BITMAPCOREINFO structure (old)
	BOOL bWinStyleDIB;       // flag which signifies whether this is a Win3.0 DIB
	BOOL bResult = FALSE;

	/* if handle to DIB is invalid, return FALSE */

	if (hDIB == NULL)
	  return FALSE;

   lpbi = (LPSTR) ::GlobalLock((HGLOBAL) hDIB);

   /* get pointer to BITMAPINFO (Win 3.0) */
   lpbmi = (LPBITMAPINFO)lpbi;

   /* get pointer to BITMAPCOREINFO (old 1.x) */
   lpbmc = (LPBITMAPCOREINFO)lpbi;

   /* get the number of colors in the DIB */
   wNumColors = ::DIBNumColors(lpbi);

   if (wNumColors != 0)
   {
		/* allocate memory block for logical palette */
		hLogPal = ::GlobalAlloc(GHND, sizeof(LOGPALETTE)
									+ sizeof(PALETTEENTRY)
									* wNumColors);

		/* if not enough memory, clean up and return NULL */
		if (hLogPal == 0)
		{
			::GlobalUnlock((HGLOBAL) hDIB);
			return FALSE;
		}

		lpPal = (LPLOGPALETTE) ::GlobalLock((HGLOBAL) hLogPal);

		/* set version and number of palette entries */
		lpPal->palVersion = PALVERSION;
		lpPal->palNumEntries = (WORD)wNumColors;

		/* is this a Win 3.0 DIB? */
		bWinStyleDIB = IS_WIN30_DIB(lpbi);
		for (i = 0; i < (int)wNumColors; i++)
		{
			if (bWinStyleDIB)
			{
				lpPal->palPalEntry[i].peRed = lpbmi->bmiColors[i].rgbRed;
				lpPal->palPalEntry[i].peGreen = lpbmi->bmiColors[i].rgbGreen;
				lpPal->palPalEntry[i].peBlue = lpbmi->bmiColors[i].rgbBlue;
				lpPal->palPalEntry[i].peFlags = 0;
			}
			else
			{
				lpPal->palPalEntry[i].peRed = lpbmc->bmciColors[i].rgbtRed;
				lpPal->palPalEntry[i].peGreen = lpbmc->bmciColors[i].rgbtGreen;
				lpPal->palPalEntry[i].peBlue = lpbmc->bmciColors[i].rgbtBlue;
				lpPal->palPalEntry[i].peFlags = 0;
			}
		}

		/* create the palette and get handle to it */
		bResult = pPal->CreatePalette(lpPal);
		::GlobalUnlock((HGLOBAL) hLogPal);
		::GlobalFree((HGLOBAL) hLogPal);
	}

	::GlobalUnlock((HGLOBAL) hDIB);

	return bResult;
}

/*************************************************************************
 *
 * FindDIBBits()
 *
 * Parameter:
 *
 * LPSTR lpbi       - pointer to packed-DIB memory block
 *
 * Return Value:
 *
 * LPSTR            - pointer to the DIB bits
 *
 * Description:
 *
 * This function calculates the address of the DIB's bits and returns a
 * pointer to the DIB bits.
 *
 ************************************************************************/


LPSTR WINAPI FindDIBBits(LPSTR lpbi)
{
	return (lpbi + *(LPDWORD)lpbi + ::PaletteSize(lpbi));
}


/*************************************************************************
 *
 * DIBWidth()
 *
 * Parameter:
 *
 * LPSTR lpbi       - pointer to packed-DIB memory block
 *
 * Return Value:
 *
 * DWORD            - width of the DIB
 *
 * Description:
 *
 * This function gets the width of the DIB from the BITMAPINFOHEADER
 * width field if it is a Windows 3.0-style DIB or from the BITMAPCOREHEADER
 * width field if it is an other-style DIB.
 *
 ************************************************************************/


DWORD WINAPI DIBWidth(LPSTR lpDIB)
{
	LPBITMAPINFOHEADER lpbmi;  // pointer to a Win 3.0-style DIB
	LPBITMAPCOREHEADER lpbmc;  // pointer to an other-style DIB

	/* point to the header (whether Win 3.0 and old) */

	lpbmi = (LPBITMAPINFOHEADER)lpDIB;
	lpbmc = (LPBITMAPCOREHEADER)lpDIB;

	/* return the DIB width if it is a Win 3.0 DIB */
	if (IS_WIN30_DIB(lpDIB))
		return lpbmi->biWidth;
	else  /* it is an other-style DIB, so return its width */
		return (DWORD)lpbmc->bcWidth;
}


/*************************************************************************
 *
 * DIBHeight()
 *
 * Parameter:
 *
 * LPSTR lpbi       - pointer to packed-DIB memory block
 *
 * Return Value:
 *
 * DWORD            - height of the DIB
 *
 * Description:
 *
 * This function gets the height of the DIB from the BITMAPINFOHEADER
 * height field if it is a Windows 3.0-style DIB or from the BITMAPCOREHEADER
 * height field if it is an other-style DIB.
 *
 ************************************************************************/


DWORD WINAPI DIBHeight(LPSTR lpDIB)
{
	LPBITMAPINFOHEADER lpbmi;  // pointer to a Win 3.0-style DIB
	LPBITMAPCOREHEADER lpbmc;  // pointer to an other-style DIB

	/* point to the header (whether old or Win 3.0 */

	lpbmi = (LPBITMAPINFOHEADER)lpDIB;
	lpbmc = (LPBITMAPCOREHEADER)lpDIB;

	/* return the DIB height if it is a Win 3.0 DIB */
	if (IS_WIN30_DIB(lpDIB))
		return lpbmi->biHeight;
	else  /* it is an other-style DIB, so return its height */
		return (DWORD)lpbmc->bcHeight;
}


/*************************************************************************
 *
 * DIBWidth()
 *
 * Parameter:
 *
 * LPSTR lpbi       - pointer to packed-DIB memory block
 *
 * Return Value:
 *
 * DWORD            - width of the DIB
 *
 * Description:
 *
 * This function gets the width of the DIB from the BITMAPINFOHEADER
 * width field if it is a Windows 3.0-style DIB or from the BITMAPCOREHEADER
 * width field if it is an other-style DIB.
 *
 ************************************************************************/


DWORD WINAPI BitCount(LPSTR lpDIB)
{
	LPBITMAPINFOHEADER lpbmi;  // pointer to a Win 3.0-style DIB
	LPBITMAPCOREHEADER lpbmc;  // pointer to an other-style DIB

	/* point to the header (whether Win 3.0 and old) */

	lpbmi = (LPBITMAPINFOHEADER)lpDIB;
	lpbmc = (LPBITMAPCOREHEADER)lpDIB;

	/* return the DIB width if it is a Win 3.0 DIB */
	if (IS_WIN30_DIB(lpDIB))
		//wBitCount = ((LPBITMAPINFOHEADER)lpbi)->biBitCount;
		return lpbmi->biBitCount;
	else  /* it is an other-style DIB, so return its width */
		return (DWORD)lpbmc->bcBitCount;
}

/*************************************************************************
 *
 * PaletteSize()
 *
 * Parameter:
 *
 * LPSTR lpbi       - pointer to packed-DIB memory block
 *
 * Return Value:
 *
 * WORD             - size of the color palette of the DIB
 *
 * Description:
 *
 * This function gets the size required to store the DIB's palette by
 * multiplying the number of colors by the size of an RGBQUAD (for a
 * Windows 3.0-style DIB) or by the size of an RGBTRIPLE (for an other-
 * style DIB).
 *
 ************************************************************************/


WORD WINAPI PaletteSize(LPSTR lpbi)
{
   /* calculate the size required by the palette */
   if (IS_WIN30_DIB (lpbi))
	  return (WORD)(::DIBNumColors(lpbi) * sizeof(RGBQUAD));
   else
	  return (WORD)(::DIBNumColors(lpbi) * sizeof(RGBTRIPLE));
}


/*************************************************************************
 *
 * DIBNumColors()
 *
 * Parameter:
 *
 * LPSTR lpbi       - pointer to packed-DIB memory block
 *
 * Return Value:
 *
 * WORD             - number of colors in the color table
 *
 * Description:
 *
 * This function calculates the number of colors in the DIB's color table
 * by finding the bits per pixel for the DIB (whether Win3.0 or other-style
 * DIB). If bits per pixel is 1: colors=2, if 4: colors=16, if 8: colors=256,
 * if 24, no colors in color table.
 *
 ************************************************************************/


WORD WINAPI DIBNumColors(LPSTR lpbi)
{
	WORD wBitCount;  // DIB bit count

	/*  If this is a Windows-style DIB, the number of colors in the
	 *  color table can be less than the number of bits per pixel
	 *  allows for (i.e. lpbi->biClrUsed can be set to some value).
	 *  If this is the case, return the appropriate value.
	 */

	if (IS_WIN30_DIB(lpbi))
	{
		DWORD dwClrUsed;

		dwClrUsed = ((LPBITMAPINFOHEADER)lpbi)->biClrUsed;
		if (dwClrUsed != 0)
			return (WORD)dwClrUsed;
	}

	/*  Calculate the number of colors in the color table based on
	 *  the number of bits per pixel for the DIB.
	 */
	if (IS_WIN30_DIB(lpbi))
		wBitCount = ((LPBITMAPINFOHEADER)lpbi)->biBitCount;
	else
		wBitCount = ((LPBITMAPCOREHEADER)lpbi)->bcBitCount;

	/* return number of colors based on bits per pixel */
	switch (wBitCount)
	{
		case 1:
			return 2;

		case 4:
			return 16;

		case 8:
			return 256;

		default:
			return 0;
	}
}


//////////////////////////////////////////////////////////////////////////
//// Clipboard support

//---------------------------------------------------------------------
//
// Function:   CopyHandle (from SDK DibView sample clipbrd.c)
//
// Purpose:    Makes a copy of the given global memory block.  Returns
//             a handle to the new memory block (NULL on error).
//
//             Routine stolen verbatim out of ShowDIB.
//
// Parms:      h == Handle to global memory to duplicate.
//
// Returns:    Handle to new global memory block.
//
//---------------------------------------------------------------------

HGLOBAL WINAPI CopyHandle (HGLOBAL h)
{
	if (h == NULL)
		return NULL;

	DWORD dwLen = ::GlobalSize((HGLOBAL) h);
	HGLOBAL hCopy = ::GlobalAlloc(GHND, dwLen);

	if (hCopy != NULL)
	{
		void* lpCopy = ::GlobalLock((HGLOBAL) hCopy);
		void* lp     = ::GlobalLock((HGLOBAL) h);
		memcpy(lpCopy, lp, dwLen);
		::GlobalUnlock(hCopy);
		::GlobalUnlock(h);
	}

	return hCopy;
}

/////////////////////////////////////////////////////////////////////
RGBQUAD WINAPI GetPixel(HGLOBAL m_hDIB, CPalette *m_palDIB, int x, int y)
{
  static RGBQUAD pixColor = {0, 0, 0, 0};
  UINT RowByteCount;


//
// WARNING:   This function currently only supports 4, 8 and // 24 bpp bitmaps!!
//1
// This member function gets the RGB color of the pixel at // location
// x,y.  Where x = 0 is at the left of the image, x // increases to the right
// y = 0 at the top of the image, y increases to the bottom

// If the x,y spot is out of bounds, BLACK is returned
	
// Test for valid Bitmap and inbounds request
	LPSTR lpDIB = (LPSTR) ::GlobalLock((HGLOBAL) m_hDIB);
	
	if(x >= (int)::DIBWidth(lpDIB) || y >= (int)::DIBHeight(lpDIB) )
  {
    pixColor.rgbBlue = pixColor.rgbGreen = pixColor.rgbRed = 0;
    return pixColor;
  }


// Get starting address of pixel data and color table
	LPSTR lpDIBBits;

	lpDIBBits = ::FindDIBBits(lpDIB);

	BYTE * dibits = (BYTE *) lpDIBBits;//m_lpImage;
	LPRGBQUAD pDibQuad = (LPRGBQUAD) m_palDIB;//m_lpvColorTable;

// Now extract the color data

	int temp = (int)::BitCount(lpDIB);
	//char ch[31];
//	AfxMessageBox(_itoa(temp,ch,10));
	
	ULONG width = ::DIBWidth(lpDIB);
	ULONG height = 	::DIBHeight(lpDIB);
	::GlobalUnlock((HGLOBAL) m_hDIB);

	switch(temp)//(m_lpBMIH->biBitCount)
  {
	case 24:
// Calculate the number of bytes in a row
    RowByteCount = ((((width * 3) -1) / 4) + 1) * 4;
// Move to the correct row (correct for bottom up DIB //storage)
    dibits += (height-1 - y) * RowByteCount;
// Move to the correct pixel address
    dibits += x * 3;
// Load up pixColor
    pixColor.rgbBlue = dibits[0];
    pixColor.rgbGreen = dibits[1];
    pixColor.rgbRed = dibits[2];
    break;
	case 8:
// Calculate the number of bytes in a row
    RowByteCount = (((width -1) / 4) + 1) * 4;
// Move to the correct row (correct for bottom up DIB //storage)
    dibits += (height-1 - y) * RowByteCount;
// Move to the correct pixel address
    dibits += x;
    //pDibQuad += dibits[0];
    pixColor.rgbBlue = dibits[0];
    pixColor.rgbGreen = dibits[0];
    pixColor.rgbRed = dibits[0];
/*
    pixColor.rgbBlue = pDibQuad->rgbBlue;
    pixColor.rgbGreen = pDibQuad->rgbGreen;
    pixColor.rgbRed = pDibQuad->rgbRed;
*/
    break;
  case 4:
// Calculate the number of bytes in a row
    RowByteCount = ((((width >> 1)-1) / 4) + 1) * 4;
// Move to the correct row (correct for bottom up DIB //storage)
    dibits += (height - y) * RowByteCount;
// Move to the correct pixel address
    dibits += (x >> 1);
    if(x%2) pDibQuad += dibits[0] & 0x0f;
    else pDibQuad += (dibits[0] & 0xf0) >> 4;
    pixColor.rgbBlue = pDibQuad->rgbBlue;
    pixColor.rgbGreen = pDibQuad->rgbGreen;
    pixColor.rgbRed = pDibQuad->rgbRed;
    break;
  default:
    AfxMessageBox("This BMP format is not supported!", 
      MB_ICONSTOP | MB_OK);
    pixColor.rgbBlue = pixColor.rgbGreen = pixColor.rgbRed = 0;
    break;
  }
	
  return pixColor;
}

/////////////////////////////////////////////////////////////
void  WINAPI SetPixel(HGLOBAL m_hDIB, CPalette* m_palDIB, RGBQUAD pixColor,int x, int y)
{
  
  UINT RowByteCount;

//
// WARNING:   This function currently only supports 4, 8 and // 24 bpp bitmaps!!
//1
// This member function sets the RGB color of the pixel at // location
// x,y.  Where x = 0 is at the left of the image, x // increases to the right
// y = 0 at the top of the image, y increases to the bottom

// If the x,y spot is out of bounds, do nothing;
	
// Test for valid Bitmap and inbounds request
	LPSTR lpDIB = (LPSTR) ::GlobalLock((HGLOBAL) m_hDIB);
	
	if(x > (int)::DIBWidth(lpDIB) || y > (int)::DIBHeight(lpDIB) )
  {
    return;
  }


// Get starting address of pixel data and color table
	LPSTR lpDIBBits;

	lpDIBBits = ::FindDIBBits(lpDIB);

	BYTE * dibits = (BYTE *) lpDIBBits;//m_lpImage;
	LPRGBQUAD pDibQuad = (LPRGBQUAD) m_palDIB;//m_lpvColorTable;

// Now extract the color data

	int temp = (int)::BitCount(lpDIB);
	//char ch[31];
//	AfxMessageBox(_itoa(temp,ch,10));
	
	ULONG width = ::DIBWidth(lpDIB);
	ULONG height = 	::DIBHeight(lpDIB);
	::GlobalUnlock((HGLOBAL) m_hDIB);

	switch(temp)//(m_lpBMIH->biBitCount)
  {
	case 24:
// Calculate the number of bytes in a row
    RowByteCount = ((((width * 3) -1) / 4) + 1) * 4;
// Move to the correct row (correct for bottom up DIB //storage)
    dibits += (height-1 - y) * RowByteCount;
// Move to the correct pixel address
    dibits += x * 3;
// Load up pixColor
    dibits[0] = pixColor.rgbBlue;
    dibits[1] = pixColor.rgbGreen;
    dibits[2] = pixColor.rgbRed;
    break;
	case 8:
// Calculate the number of bytes in a row
    RowByteCount = (((width -1) / 4) + 1) * 4;
// Move to the correct row (correct for bottom up DIB //storage)
    dibits += (height-1- y) * RowByteCount;
// Move to the correct pixel address
    dibits += x;
    //pDibQuad += dibits[0];
    dibits[0] = pixColor.rgbBlue;
/*
    pDibQuad->rgbBlue = pixColor.rgbBlue;
    pDibQuad->rgbGreen = pixColor.rgbGreen;
    pDibQuad->rgbRed = pixColor.rgbRed;
*/
    break;
  case 4:
// Calculate the number of bytes in a row
    RowByteCount = ((((width >> 1)-1) / 4) + 1) * 4;
// Move to the correct row (correct for bottom up DIB //storage)
    dibits += (height - y) * RowByteCount;
// Move to the correct pixel address
    dibits += (x >> 1);
    if(x%2) pDibQuad += dibits[0] & 0x0f;
    else pDibQuad += (dibits[0] & 0xf0) >> 4;
    pDibQuad->rgbBlue = pixColor.rgbBlue;
    pDibQuad->rgbGreen = pixColor.rgbGreen;
    pDibQuad->rgbRed = pixColor.rgbRed;
    break;
  default:
    AfxMessageBox("This BMP format is not supported!", 
      MB_ICONSTOP | MB_OK);
    break;
  }
}

void Binarization1(HGLOBAL hDIB,CPalette* pPalDIB,int x1,int x2,int y1,int y2)
{
	int i,j,color;
	bool c=false;
	extern int threshold;
	extern int stand[1000][1000];
		

	for (j=y1;j<=y2;j++)
		for (i=x1;i<=x2;i++)
		{
			color=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
			if (color >= threshold) stand[i][j]=255;
			else stand[i][j]=0;
		}

}

int Binarization2(HGLOBAL hDIB,CPalette* pPalDIB,int x1,int x2,int y1,int y2)
{
	int i,j,color,count=0;
	extern int threshold;
	/*x1 = pDoc->start_point.x;
	x2 = pDoc->end_point.x;
	y1 = pDoc->start_point.y;
	y2 = pDoc->end_point.y;*/
	RGBQUAD pixColor = {0,0,0,0};
	for (j=y1;j<=y2;j++)
		for (i=x1;i<=x2;i++)
		{
			color=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
			if (color </*=*/ threshold)
			{
				pixColor.rgbBlue = 0;
				pixColor.rgbGreen = 0;
				pixColor.rgbRed = 0;
				pixColor.rgbReserved = 0;
			}
			
			else
			{
				count++;
				pixColor.rgbBlue = 255;
				pixColor.rgbGreen = 255;
				pixColor.rgbRed = 255;
				pixColor.rgbReserved = 0;
				
			}
			
			SetPixel(hDIB,pPalDIB,pixColor,i,j);
			
			
		}
	return count;
}

void Binary_Row(HGLOBAL hDIB,CPalette* pPalDIB,CString file_name)
{
	FILE *fp;
	extern int output[50][50];
	extern int pc[100];
	extern int ur[50][50];
	extern int dr[50][50];
	extern int tr[50];
	extern int u,l,tc,threshold,full_threshold,success;

	int i,j,x1=0,x2=0,y1=0,y2=0,count,max,New_threshold=0;
	int size;
	for (i=0;i<50;i++)
		for (j=0;j<50;j++)
			output[i][j]=-1;


		for (i=0;i<=tc-1;i++)        //PC Keep Number of Column line
		{
			for (j=0;j<=tr[i];j++)
			{
				x1=pc[i]+l;
				x2=pc[i+1]+l-1; //because it is same pixel
				y1=ur[i][j]+u;
				y2=dr[i][j]+u-1;
				threshold = ::Iter_threshold(hDIB,pPalDIB,x1,x2,y1,y2); 
				New_threshold = ::Hist_checking(hDIB,pPalDIB,x1,x2,y1,y2,threshold);
				full_threshold=::findThreshold(hDIB,pPalDIB,x1,x2,y1,y2,1,2);
				threshold = New_threshold;
				if (threshold < full_threshold) threshold=full_threshold;

			
				//threshold=threshold;
				count=::Binarization2(hDIB,pPalDIB,x1,x2,y1,y2);
				size=(x2-x1)*(y2-y1);
				if (count>=size*0.1) output[i][j]=1;
				else if ((count>=size*0.05)&&(count<size*0.1)) output[i][j]=9;
				else output[i][j]=0;
			
				//::Find_Row();
			

			}
		}
	int pos;
	pos = file_name.Find(".",0);
	file_name.Delete(pos+1,3);
	file_name+="xls";
	//AfxMessageBox(file_name);
	
	max=Output();
//	max=tr[0];
	fp = fopen(file_name, "w");
	if (fp == NULL)
	{
		//AfxMessageBox("Can't open file "+file_name);
		return;
	}
/*	if(fp == 0)											// Now we should have valid file pointer, but we need to make sure.
	{													// If fp equals 0 it means fopen() couldn't create the file.  This could be because we don't have any memory or space left.
		printf("ERROR: Could not create Stats.txt!\n");	// Print out an error message.  This is very important, especially when getting into huge projects.
														// There is so many times where I have spent wasted time trying to find out why my program was crashing.
		return;											// Return is like a 'break' but it's for functions, not loops.  Just because we have a "void main()" , doesn't mean we can return in it.
	}													// We just can't return something to it.  Return will quit from the current funciton, in this case it's main.  So the program is now ended.
*/
	for (j =0;j<=max;j++)
	{
		for(i = 0; i < tc ; i++)							// Here we want to loop and write each character out to the file.  We want to go until i is less than the length (array indices start at zero)
		
		{
			char c;
			if (output[i][j]==1) c='1';
			else if (output[i][j]==0) c='0';
			else if (output[i][j]==9) c='9';
		
			//fput(output[i][j], fp);							// Like fgetc(), fputc() "puts", or writes a character to a file.
			fputc(c,fp);// So, after this for loop finished, our final should have "Player: Adol" in it.  Check and see!
			fputc('\t',fp);
		}
		fputc('\n',fp);

	}
	fclose(fp);
	success = success+1;
	//Text_Draw(pDoc->hDIB,pDoc->pPalDIB);

	//Print_col(pDoc-> hDIB);
	//Print_cr(pDoc-> hDIB);
}

//create histogram for execute threshold
void CreateHistogram(int x1,int x2,int y1,int y2)
{
	extern int H[256];
	extern int grad[1000][700];
	int i,j,k;
	for (k=0;k<256;k++)
		H[k]=0;
	for (j = y1; j <= y2; j++)
		for (i = x1; i <= x2; i++)
		{
			if (grad[i][j]>=0)
				H[grad[i][j]]=H[grad[i][j]]+1;
		}
}

void Find_Col(HGLOBAL hDIB,CPalette* pPalDIB)
{
//	RGBQUAD pixColor = {0,0,0,0};
	extern int l,r,u,d,tc;
	extern int col[1000];
	extern int stand[1000][1000];
	extern int pc[100];

	int ccol=0,crow=0,temp=0;
	int i,j;
	int lc[50],rc[50],lo[50],dis[50];
	bool check=false;
	for (i=0;i<999;i++)
	{
		col[i]=9;
	}

	for (i=0;i<50;i++)
	{
		lc[i]=0;
		rc[i]=0;
		lo[i]=0;
	   dis[i]=0;
	}
	
	for (i=l;i<=r;i++)
	{
		for (j=u;j<=d;j++)
		{
			//temp = ::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j).rgbBlue;
			temp=stand[i][j];
			if((temp == 255)&& (!check))
			{
				col[ccol]=1;
				check=true;
			}
			else if ((temp == 0) && (!check))
			{
				col[ccol]=0;
				check=false;
			}
		}
		ccol++;
		check=false;
	}
	ccol--;



//************** Find mean of object*************
	
	


//*************** Find middle point *************

	int sum=0,count=0,k=0;
	tc=0;
	//int temp2=0;

	bool pass1=false,pass2=true;

	for(i=0;i<=ccol;i++)
	{
		if ((col[i]==0)&&(col[i-1]==0)&&(col[i+1]==1)&&(col[i+2]==1)&&(col[i+3]==1)&&(col[i+4]==1)&&(col[i+5]==1)&&(col[i+6]==1)&&(col[i+7]==1)&&(!pass1))
		{
			lc[k]=i-1;
			pass1=true;
			pass2=false;
		}
		else if ((col[i]==1)&&(col[i-1]==1)&&(col[i-2]==1)&&(col[i-3]==1)&&(col[i-4]==1)&&(col[i-5]==1)&&(col[i+1]==0)&&(col[i+2]==0)&&(!pass2))
		{
			rc[k]=i+2;
			k++;
			pass1=false;
			pass2=true;
		}

	}

	tc=k-1; 

//**************Find Lenght Object ******************

	int tail,a,b;
	k=0;
	for(i=0;i<=tc;i++)
	{
		if ((rc[i]-lc[i]>10)&&(rc[i]-lc[i]<30))
		{
			lo[k]=rc[i]-lc[i];
			k++;
		}
	}


        // Sort //
	int temp1=0,temp2=0;
	for(a=0;a<=tc;a++)
		for(b=a;b<=tc;b++)
		{
			if (lo[a]>lo[b])
			{
				temp1=lo[b];
				temp2=lo[a];
				lo[b]=temp2;
				lo[a]=temp1;
			}
		}

        // Find Mean //

	int mean=0;
	a  = tc/2;
	b  = tc%2;
	a  = a+b;
	mean = lo[a];

//************Find Space between Column*************
	k=0;
	int md=0;
	for (i=0;i<tc;i++)
	{
		temp1=lc[i+1]-rc[i];
		if (temp1 <= 10) 
		{
			dis[k]=temp1;
			k++;
		}
	}
	tail=k-1;

       // Sort//

	for(a=0;a<=tail;a++)
		for(b=a;b<=tail;b++)
		{
			if (dis[a]>dis[b])
			{
				temp1=dis[b];
				temp2=dis[a];
				dis[b]=temp2;
				dis[a]=temp1;
			}
		}
	  	
	  a = tail/2;
	  b = tail%2;
	  a = a+b;
	  b = dis[a];
	 md = b/2;
	  a = b%2;
	 md = md+a;


	//************ Operation ******************

	check=false;
	int distanct=mean+b,space=b,x,y;
	a=0,b=tc+1,temp1=0,temp2=0;
	
	for (i=0;i<=tc;i++)				// Check Column Forward to right
	{
		if (i!=tc)
		if (lc[i+1]-rc[i]>mean)			// Check space
		{
			temp1=rc[i]+space;
			lc[b]=temp1;

			temp2=rc[i]+distanct;
			rc[b]=temp2;
			tc=b;
			b++;
		

			for (x=0;x<=tc;x++)			// Sort New Data
				for (y=x;y<=tc;y++)
				{
					if (lc[x]>lc[y])
					{
						temp1=lc[y];
						temp2=lc[x];
						lc[y]=temp2;
						lc[x]=temp1;

						temp1=rc[y];
						temp2=rc[x];
						rc[y]=temp2;
						rc[x]=temp1;
					}
				}
		}

		if (rc[i]-lc[i]>distanct)		//Check Object
		{
			temp1=lc[i]+mean;
			rc[i]=temp1;
			i--;
		}

		if (rc[i]-lc[i]<mean)
		{
			temp1=lc[i]+mean;
			rc[i]=temp1;
			
		}
	}

	
	
	while (lc[0]-distanct>=0)			//Check Column Reverse
	{
		temp1=lc[0]-space;
		temp2=lc[0]-distanct;
		lc[b]=temp2;
		rc[b]=temp1;
		tc=b;
		b++;

		for (x=0;x<=tc;x++)
			for (y=x;y<=tc;y++)
				{
					if (lc[x]>lc[y])
					{
						temp1=lc[y];
						temp2=lc[x];
						lc[y]=temp2;
						lc[x]=temp1;

						temp1=rc[y];
						temp2=rc[x];
						rc[y]=temp2;
						rc[x]=temp1;
					}
				}
	}

	while (rc[tc]+distanct<ccol-3)			//Check Column Forword Start at tc
	{
		temp1=rc[tc]+space;
		temp2=rc[tc]+distanct;
		lc[tc+1]=temp1;
		rc[tc+1]=temp2;
		tc++;
		
	}




	k=1;
	pc[0]=lc[0]-1;
	
	for (i=0;i<=tc-1;i++)
	{
		pc[k]=(lc[i+1]+rc[i])/2;
		k++;
	}
	
	pc[k]=rc[tc]+1;
	if (ccol-rc[tc] > mean) 
	{
		k++;
		pc[k]=ccol-1;
	}
	tc=k;	

}

void Find_Row()
{
	extern ur[50][50] , dr[50][50];
	extern int l,u,d,tc;
	extern int pc[100], stand[1000][1000];
	extern int tr[50],row[1000];
	
	//***************** Find Row***************

int k=0,temp=0,count=0,i,j,crow=0;
bool check=false;

int temp1;

for (i=0;i<50;i++)
	for (j=0;j<50;j++)
	{
		ur[i][j]=-1;
		dr[i][j]=-1;
	}




	for (k=0;k<=tc-1;k++)
	{
		for (i=u;i<=d;i++)
		{
			for (j=l+pc[k];j<l+pc[k+1];j++)
		{
			//temp = ::GetPixel(pDoc->hDIB,pDoc->pPalDIB,j,i).rgbBlue;
			temp=stand[j][i];
		
			int a;count=0;
			

			if((temp == 255)&& (!check))
			{
				for(a=l+pc[k];a<l+pc[k+1];a++)
				{
					temp1=stand[a][i];
					if (temp1 == 255) count++;
				}
				
				//temp2=(int)(count/(pc[k+1]-pc[k]));
				if (count >= (0.2*(pc[k+1]-pc[k]))) row[crow]=1;
				else row[crow]=0;

				check=true;

				
			}
			else if ((temp == 0) && (!check))
			{
				row[crow]=0;
				check=false;
			}
		
		}
		crow++;
		check=false;
	}
	crow--;

	int a=0;count=0;
	bool pass1=false,pass2=true;

	for(i=0;i<=crow;i++)
	{
		if (/*(row[i-1]==0)&&*/(row[i]==0)&&(row[i+1]==1)&&(row[i+2]==1)&&(!pass1))
		{
			ur[k][a]=i-1;
			pass1=true;
			pass2=false;
		}
		else if ((row[i-1]==1)&&(row[i]==1)&&(row[i+1]==0)/*&&(row[i+2]==0)*/&&(!pass2))
		{
			dr[k][a]=i+2;
			a++;
			pass1=false;
			pass2=true;
		}

	}
	
	crow=0;
	tr[k]=a-1;              // TR is array of number of row in each column
							// Max of tr is number of column or tc-1
}

}

float findAvgGradient(int check)
{
	extern int H[256];
	int i,n;
	float sum = 0;
	float average;
	n=0;
	sum=0;
  if (check==1)
  {
	for (i=0;i<256;i++)
	{
		if(H[i]>0)
		{
			n=n+1;
			sum=sum+i;
		}
	}
	
		average = sum/n;
  }
  else 
  {
	for(i=15;i<256;i++)
	{
		if(H[i]>0)
		{
			n=n+1;
			sum=sum+i;
		}
	}
		
	if (n==0) average=255;
	else average = sum/n;
  }
	
	return average;
}

//find gradient of every pixel
void findGradient(HGLOBAL hDIB,CPalette* pPalDIB,int x1,int x2,int y1,int y2)
{
	extern int grad[1000][700];
	//int (*grad)[/*pDoc->bmHeight*/5];
	//grad = new int[5/*pDoc->bmWidth*/][/*pDoc->bmHeight*/5];
	//cp[0][0][0]=15;
	//cp[0][0][1]=20;
	//char str[5];
	//wsprintf(str,"%d",cp[0][0][0]);
	//AfxMessageBox(str);
	//delete grad;
	int p[9];
	int i,j;

/*	for (i=0;i<1000;i++)
		for (j=0;j<700;j++)
			grad[i][j]=0;

	/*x1 = pDoc->start_point.x;
	x2 = pDoc->end_point.x;
	y1 = pDoc->start_point.y; 
	y2 = pDoc->end_point.y;*/
	for (j = y1; j <= y2; j++)
	{	for (i = x1; i <= x2; i++)
		{
			if (i==x1)
			{
				if (j==y1)
				{	
					p[0]=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(hDIB,pPalDIB,i+1,j).rgbBlue;
					p[2]=::GetPixel(hDIB,pPalDIB,i,j+1).rgbBlue;
					p[3]=::GetPixel(hDIB,pPalDIB,i+1,j+1).rgbBlue;
					grad[i][j]=::max4(p[0],p[1],p[2],p[3]);
				}
				else if (j==y2)
				{
					p[0]=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(hDIB,pPalDIB,i,j-1).rgbBlue;
					p[2]=::GetPixel(hDIB,pPalDIB,i+1,j-1).rgbBlue;
					p[3]=::GetPixel(hDIB,pPalDIB,i+1,j).rgbBlue;
					grad[i][j]=::max4(p[0],p[1],p[2],p[3]);
				}
				else
				{	
					p[0]=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(hDIB,pPalDIB,i,j-1).rgbBlue;
					p[2]=::GetPixel(hDIB,pPalDIB,i+1,j-1).rgbBlue;
					p[3]=::GetPixel(hDIB,pPalDIB,i+1,j).rgbBlue;
					p[4]=::GetPixel(hDIB,pPalDIB,i,j+1).rgbBlue;
					p[5]=::GetPixel(hDIB,pPalDIB,i+1,j+1).rgbBlue;
					grad[i][j]=::max6(p[0],p[1],p[2],p[3],p[4],p[5]);
				}
			}
			else if(j==y1)
			{
				if(i==x2)
				{
					p[0]=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(hDIB,pPalDIB,i-1,j).rgbBlue;
					p[2]=::GetPixel(hDIB,pPalDIB,i-1,j+1).rgbBlue;
					p[3]=::GetPixel(hDIB,pPalDIB,i,j+1).rgbBlue;
					grad[i][j]=::max4(p[0],p[1],p[2],p[3]);					
				}
				else
				{
					p[0]=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(hDIB,pPalDIB,i-1,j).rgbBlue;
					p[2]=::GetPixel(hDIB,pPalDIB,i+1,j).rgbBlue;
					p[3]=::GetPixel(hDIB,pPalDIB,i-1,j+1).rgbBlue;
					p[4]=::GetPixel(hDIB,pPalDIB,i,j+1).rgbBlue;
					p[5]=::GetPixel(hDIB,pPalDIB,i+1,j+1).rgbBlue;
					grad[i][j]=::max6(p[0],p[1],p[2],p[3],p[4],p[5]);
				}
			}
			else if(i == x2)
			{
				if(j==y2)
				{
					p[0]=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(hDIB,pPalDIB,i-1,j-1).rgbBlue;
					p[2]=::GetPixel(hDIB,pPalDIB,i,j-1).rgbBlue;
					p[3]=::GetPixel(hDIB,pPalDIB,i-1,j).rgbBlue;
					grad[i][j]=::max4(p[0],p[1],p[2],p[3]);					
				}
				else
				{
					p[0]=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(hDIB,pPalDIB,i-1,j-1).rgbBlue;
					p[2]=::GetPixel(hDIB,pPalDIB,i,j-1).rgbBlue;
					p[3]=::GetPixel(hDIB,pPalDIB,i-1,j).rgbBlue;
					p[4]=::GetPixel(hDIB,pPalDIB,i-1,j+1).rgbBlue;
					p[5]=::GetPixel(hDIB,pPalDIB,i,j+1).rgbBlue;
					grad[i][j]=::max6(p[0],p[1],p[2],p[3],p[4],p[5]);
				}
			}
			else if(j == y2)
			{
					p[0]=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(hDIB,pPalDIB,i-1,j-1).rgbBlue;
					p[2]=::GetPixel(hDIB,pPalDIB,i,j-1).rgbBlue;
					p[3]=::GetPixel(hDIB,pPalDIB,i+1,j-1).rgbBlue;
					p[4]=::GetPixel(hDIB,pPalDIB,i-1,j).rgbBlue;
					p[5]=::GetPixel(hDIB,pPalDIB,i+1,j).rgbBlue;
					grad[i][j]=::max6(p[0],p[1],p[2],p[3],p[4],p[5]);
			}
			else
			{
					p[0]=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(hDIB,pPalDIB,i-1,j-1).rgbBlue;
					p[2]=::GetPixel(hDIB,pPalDIB,i,j-1).rgbBlue;
					p[3]=::GetPixel(hDIB,pPalDIB,i+1,j-1).rgbBlue;
					p[4]=::GetPixel(hDIB,pPalDIB,i-1,j).rgbBlue;
					p[5]=::GetPixel(hDIB,pPalDIB,i+1,j).rgbBlue;
					p[6]=::GetPixel(hDIB,pPalDIB,i-1,j+1).rgbBlue;
					p[7]=::GetPixel(hDIB,pPalDIB,i,j+1).rgbBlue;
					p[8]=::GetPixel(hDIB,pPalDIB,i+1,j+1).rgbBlue;
					grad[i][j]=::max9(p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8]);
			}
			int k;
			for (k=0;k<9;k++)
			{
				p[k]=0;
			}
		}
	}
}

int max4(int p0, int p1, int p2, int p3)
{
	int max=0;
	int pp[3];
	int i=0;
	/*pp[0]=p1-p0;
	pp[1]=p2-p0;
	pp[2]=p3-p0;*/
	pp[0]=p0-p1;
	pp[1]=p0-p2;
	pp[2]=p0-p3;
	for(i=0;i<3;i++)
	{
		if(max<pp[i])
			max=pp[i];
	}
	return max;
}

int max6(int p0, int p1, int p2, int p3, int p4, int p5)
{
	int max=0;
	int pp[5];
	int i;
	/*pp[0]=p1-p0;
	pp[1]=p2-p0;
	pp[2]=p3-p0;
	pp[3]=p4-p0;
	pp[4]=p5-p0;*/
	pp[0]=p0-p1;
	pp[1]=p0-p2;
	pp[2]=p0-p3;
	pp[3]=p0-p4;
	pp[4]=p0-p5;
	for(i=0;i<5;i++)
	{
		if(max<pp[i])
			max=pp[i];
	}
	return max;
}

int max9(int p0, int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8)
{
	int max=0;
	int pp[8];
	int i;
	/*pp[0]=p1-p0;
	pp[1]=p2-p0;
	pp[2]=p3-p0;
	pp[3]=p4-p0;
	pp[4]=p5-p0;
	pp[5]=p6-p0;
	pp[6]=p7-p0;
	pp[7]=p8-p0;*/
	pp[0]=p0-p1;
	pp[1]=p0-p2;
	pp[2]=p0-p3;
	pp[3]=p0-p4;
	pp[4]=p0-p5;
	pp[5]=p0-p6;
	pp[6]=p0-p7;
	pp[7]=p0-p8;
	for(i=0;i<8;i++)
	{
		if(max<pp[i])
			max=pp[i];
	}
	return max;
}

int findThreshold(HGLOBAL hDIB,CPalette* pPalDIB,int x1,int x2,int y1,int y2,int check,int check2)
{
	extern int grad[1000][700];
	int i,j;
	int bright=0,Avgbright=0;
	/*x1 = pDoc->start_point.x;
	x2 = pDoc->end_point.x;
	y1 = pDoc->start_point.y;
	y2 = pDoc->end_point.y;*/
	//Avgbright = AvgBright(x1,x2,y1,y2);

	::findGradient(hDIB,pPalDIB,x1,x2,y1,y2);
	::CreateHistogram(x1,x2,y1,y2);
	float avg;
	int max=0;
	int min=255;
	avg = ::findAvgGradient(check2);
	for (j=y1;j<=y2;j++)
		for (i=x1;i<=x2;i++)
		{
			if ((float)grad[i][j]>avg)
			{
				bright = ::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
				if (bright > max)
					max = bright;
				if (bright <= min)
					min = bright;
			}
		}
/*	for (j=y1;j<=y2;j++)
		for (i=x1;i<=x2;i++)
			grad[i][j]=0;
*/
	//if ((avg >=5 ) && (avg <10)) return min+10;else
		
	//if ((avg >=5 ) && (avg <10)&&(Avgbright<=40)) return min+10;
	//else if ((avg >=5 ) && (avg <10)&&(Avgbright>40)) return max;else 
	float num=0;
	if ((min==255)&&(max==0)) 
	{
		min=0;
		max=255;
	}
	num=(float)(max-min);
	
//	if (num > 10 ) return min+(num*0.75);
//	else return max+5;
	if (check==1)
	{
		if ((avg >= 10) && (avg < 20)) return min+(int)(num*0.55);
		else if ((avg >= 20) && (avg < 50)) return min+(int)(num*0.35);
		else if ((avg >= 50) && (avg < 255))return min+(int)(num*0.15);
		else return max;
	//return (min+(int)(num*0.15));
	}
	else if (check==2)
	return (min+(int)(num*0.3));
	else return (min+(int)(num*0.5));
}

int Hist_checking(HGLOBAL hDIB,CPalette* pPalDIB,int x1,int x2,int y1,int y2,int threshold)
{
	extern int His[256];
	int i,j,k,bright,new_thres=0;
	bool check=true;
	

	for (k=0;k<256;k++)
		His[k]=0;
	for (j = y1; j <= y2; j++)
		for (i = x1; i <= x2; i++)
		{
			bright=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
			if (bright>=0)
				His[bright]=His[bright]+1;
		}

/*
	for (i=threshold;i<255;i++)
	{
		if ((His[i]!=0) && (His[i+1]==0) && check) 
		{
			new_thres = i+1;
			check     = false;
		}
	}
	
	if (new_thres - threshold > 40) new_thres = threshold+20;

	if (new_thres==0) return (threshold+20);
	else return new_thres;
*/
/*
	int sum=0,count=0;check=true;

	for (i=threshold;i<255;i++) sum=His[i]+sum;

	count=sum*2/3;
	sum=0;

	for (i=threshold;i<255;i++)
	{
		if ((count <= His[i]) && check)
		{
			new_thres = i+1;
			check=false;
		}
		else count=count-His[i];
	}

	return new_thres;
*/


	int cb=0,co=0,right=0,down=0;
	int temp[100][100];
	float Mb=0,Mo=0,Th0=0,Th1=0;
	check=false;
	
	right=x2-x1-1;
	down =y2-y1;
	
	for (i=0;i<100;i++)
		for (j=0;j<100;j++)
		{
			temp[i][j]=0;
		}
	
	for (i=x1;i<x2;i++)
		for (j=y1;j<=y2;j++)
		{
			bright=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
			temp[i-x1][j-y1]=bright;
		}

//------------ First Iter ---------------------

		Th1 = (float)threshold+2;
//---------------------------------------------
//------------- Find Thresdhold----------------

	while (!check) 
	{
		Th0=Th1;
		for (i=0;i<=right;i++)
			for (j=0;j<=down;j++)
			{
				if ((temp[i][j]<Th0)&&(temp[i][j]>threshold))
				{
					Mb=Mb+temp[i][j];
					cb++;
				}
				else if (temp[i][j]>threshold)
				{
					Mo=Mo+temp[i][j];
					co++;
				}
			}

		
		if (cb==0) Th1=Mo/co;
		else if (co==0) Th1=Mb/cb;
		else Th1=((Mb/cb)+(Mo/co))/2;

		if (Th1-Th0 < 0.5) check=true;
		Mo=0;Mb=0;co=0;cb=0;
		
	}
	
	//if (Th1-threshold < 20) Th1+50;

	return (int)Th1;
}

void Initial_stand()
{
	extern int stand[1000][1000];
	int i,j;
	for (i=0;i<=999;i++)
	{
		
	    for (j=0;j<=999;j++)
		{
			
			stand[i][j]=9;
			
		}
	}
}

int Iter_threshold(HGLOBAL hDIB,CPalette* pPalDIB,int x1,int x2,int y1,int y2)
{
	int i,j,bright,cb=0,co=0,right=0,down=0;
	int temp[100][100];
	float Mb=0,Mo=0,Th0=0,Th1=0;
	bool check=false;
	
	right=x2-x1-1;
	down =y2-y1;
	
	for (i=0;i<100;i++)
		for (j=0;j<100;j++)
		{
			temp[i][j]=0;
		}
	
	for (i=x1;i<x2;i++)
		for (j=y1;j<=y2;j++)
		{
			bright=::GetPixel(hDIB,pPalDIB,i,j).rgbBlue;
			temp[i-x1][j-y1]=bright;
		}

//------------ First Iter ---------------------

	cb=4;
	Mb=(float)(temp[0][0]+temp[0][down]+temp[right][0]+temp[right][down]);
	Mb=Mb/cb;

	for (i=0;i<=right;i++)
		for (j=0;j<=down;j++)
		{
			Mo=Mo+temp[i][j];
			co++;
		}

	co=co-4;
	Mo=(Mo-(temp[0][0]+temp[0][down]+temp[right][0]+temp[right][down]))/co;
	
	Th1=(Mb+Mo)/2;
	Mo=0;Mb=0;co=0;cb=0;
//---------------------------------------------
//------------- Find Thresdhold----------------

	while (!check) 
	{
		Th0=Th1;
		for (i=0;i<=right;i++)
			for (j=0;j<=down;j++)
			{
				if (temp[i][j]<Th0)
				{
					Mb=Mb+temp[i][j];
					cb++;
				}
				else 
				{
					Mo=Mo+temp[i][j];
					co++;
				}
			}
		if (cb==0) Th1=Mo/co;
		else if (co==0) Th1=Mb/cb;
		else Th1=((Mb/cb)+(Mo/co))/2;

		if (Th1-Th0 <= 0) check=true;
		Mo=0;Mb=0;co=0;cb=0;
		
	}


	return (int)Th1;
}

void Sub_Exe(HGLOBAL hDIB,CPalette* pPalDIB) 
{

	extern int u,d,tc,l,pc[100];
	extern int threshold,full_threshold;
/*	if (pDoc->start_point == pDoc->end_point)
	{
		AfxMessageBox("Please select area before execute");
		return;
	}
*/
	int x1,x2,y1,y2,j1,j2,count=0,New_threshold=0;


	
/*	
	for (i1=0;i1<=1000;i1++)
		for (j1=0;j1<=1000;j1++)
			stand[i1][j1]=9;
*/

	

	
	
	y1=u;
	y2=d;
	j1=y1;
	
//	full_threshold = findThreshold(l,r,u,d,2,2);
	for (count=0;count<=tc-1;count++)
	{
		x1=pc[count];
		x2=pc[count+1]-1;



		do
		{	
			j2=j1+39;
			if (j2 > y2) j2 = y2;
			threshold = ::Iter_threshold(hDIB,pPalDIB,x1+l,x2+l,j1,j2);
			full_threshold = ::findThreshold(hDIB,pPalDIB,x1+l,x2+l,j1,j2,1,2);
			New_threshold = ::Hist_checking(hDIB,pPalDIB,x1+l,x2+l,j1,j2,threshold);
			if (New_threshold < full_threshold) New_threshold=full_threshold;
			threshold = New_threshold;
			::Binarization1(hDIB,pPalDIB,x1+l,x2+l,j1,j2);
			j1=j1+40;
		}
		while (j2 < y2);
		j1=y1;


/*
		threshold = ::Iter_threshold(x1+l,x2+l,u,d);
		full_threshold = ::findThreshold(x1+l,x2+l,u,d,1,2);
		New_threshold = ::Hist_checking(x1+l,x2+l,u,d,threshold);
		if (New_threshold < full_threshold) New_threshold=full_threshold;
		


		threshold = New_threshold;
		::Binarization2(hDIB,pPalDIB,x1+l,x2+l,u,d);
*/




	}

	
	/*BOOL success;
	success = WriteDIB(pDoc->hDIB);
	if (success == false)
		AfxMessageBox("Can not write bitmap");*/
}

int Output()
{	
	extern int tr[50],ur[50][50],dr[50][50];
	extern int tc,output[50][50];
	int i,j,k,count=0,temp1=0,temp2=0,temp3=0;
	int num[30];
	bool check=true;
	for (i=0;i<30;i++) num[i]=-1;

	for (i=0;i<=tc-1;i++)  //Find max row
	{
		if (count<tr[i]) count=tr[i];
	}

	for (i=0;i<=tc-2;i++)      //count is Max row
	{
/*		for (a=0;a<=tr[i];a++)
		{
			for (b=0;b<=tr[i+1];b++)
			{
				if ( (((ur[i][a]>=ur[i+1][b]) && (ur[i][a]<=dr[i+1][b]))) || (((dr[i][a] >= ur[i+1][b]) && (dr[i][a] <= dr[i+1][b]))) 
					&&(((ur[i+1][b]>=ur[i][a]) && (ur[i+1][b]<=dr[i][a]))) || (((dr[i+1][b] >= ur[i][a]) && (dr[i+1][b] <= dr[i][a]))) && (check)) check=false;
			}	
		
			if (check) 
				{
					tr[i+1]++;
					temp1=ur[i][a];
					temp2=dr[i][a];

					ur[i+1][tr[i+1]]=temp1;
					dr[i+1][tr[i+1]]=temp2;
					output[i+1][tr[i+1]]=0;
				
					

					
					//*********** Sort Data in tr[k+1]******************
					temp1=0;temp2=0;temp3=0;
					int c=0,d=0;
					for(c=0;c<=tr[i+1];c++)
					{
						for(d=c;d<=tr[i+1];d++)
						{
							if (ur[i+1][c]>ur[i+1][d])
							{
								temp1=ur[i+1][d];
								temp2=dr[i+1][d];
								temp3=output[i+1][d];

								ur[i+1][d]=ur[i+1][c];
								dr[i+1][d]=dr[i+1][c];
								output[i+1][d]=output[i+1][c];

								ur[i+1][c]=temp1;
								dr[i+1][c]=temp2;
								output[i+1][c]=temp3;
							}
						}
					}
				}
		
			check=true;
		}
			
	}

//*************** Reverse ********************


	for (i=tc-1;i>=1;i--)      //count is Max row
	{
		for (a=0;a<=tr[i];a++)
		{
			for (b=0;b<=tr[i-1];b++)
			{
				if ( (((ur[i][a]>=ur[i-1][b]) && (ur[i][a]<dr[i-1][b]))) || (((dr[i][a] > ur[i-1][b]) && (dr[i][a] <= dr[i-1][b]))) 
					&&(((ur[i-1][b]>=ur[i][a]) && (ur[i-1][b]<dr[i][a]))) || (((dr[i-1][b] > ur[i][a]) && (dr[i-1][b] <= dr[i][a]))) && (check)) check=false;
			}	
		
			if (check) 
				{
					tr[i-1]++;
					temp1=ur[i][a];
					temp2=dr[i][a];

					ur[i-1][tr[i-1]]=temp1;
					dr[i-1][tr[i-1]]=temp2;
					output[i-1][tr[i-1]]=0;
				
					

					
					//*********** Sort Data in tr[k+1]******************
					temp1=0;temp2=0;temp3=0;
					int c=0,d=0;
					for(c=0;c<=tr[i+1];c++)
					{
						for(d=c;d<=tr[i-1];d++)
						{
							if (ur[i-1][c]>ur[i-1][d])
							{
								temp1=ur[i-1][d];
								temp2=dr[i-1][d];
								temp3=output[i-1][d];

								ur[i-1][d]=ur[i-1][c];
								dr[i-1][d]=dr[i-1][c];
								output[i-1][d]=output[i-1][c];

								ur[i-1][c]=temp1;
								dr[i-1][c]=temp2;
								output[i-1][c]=temp3;
							}
						}
					}
				}
		
			check=true;
		}
			
	}


*/


	if ((tr[i]<count)&&(tr[i+1]==count)&&(i!=tc-1))   // tr is array as keep number of row
		{
			for (j=0;j<=count;j++)
		
			{
				if ((ur[i][j]+1<ur[i+1][j]+1) && (dr[i][j]-1<ur[i+1][j]+1) && (ur[i][j]!=-1)&&(ur[i+1][j]!=-1)&&(tr[i]!=count) ) 
				{
					for (k=tr[i+1];k>=j;k--)  //j is current position
					{
						temp1=ur[i+1][k];
						ur[i+1][k+1]=temp1;

						temp2=dr[i+1][k];
						dr[i+1][k+1]=temp2;

						temp3=output[i+1][k];
						output[i+1][k+1]=temp3;
					}
				
					temp1=ur[i][j]+1;
					ur[i+1][j]=temp1;

					temp2=dr[i][j]-1;
					dr[i+1][j]=temp2;

					output[i+1][j]=0;

					tr[i+1]++;

				}	

				if ((ur[i][j]+1>ur[i+1][j]+1) && (ur[i][j]+1>dr[i+1][j]-1) && (ur[i][j]!=-1) && (ur[i+1][j]!=-1)&&(tr[i]!=count))
				{
					for (k=tr[i];k>=j;k--)  //j is current position
					{
						temp1=ur[i][k];
						ur[i][k+1]=temp1;

						temp2=dr[i][k];
						dr[i][k+1]=temp2;

						temp3=output[i][k];
						output[i][k+1]=temp3;
					}
				
					temp1=ur[i+1][j]+1;
					ur[i][j]=temp1;

					temp2=dr[i+1][j]-1;
					dr[i][j]=temp2;

					output[i][j]=0;

					tr[i]++;
				}
	
			}
		}

//*******************************************************

		if ((tr[i]<count)&&(tr[i-1]==count)&&(i!=0))
		{
			for (j=0;j<=count;j++)
		
			{
				if ((ur[i][j]+1<ur[i-1][j]+1) && (dr[i][j]-1<ur[i-1][j]+1) && (ur[i][j]!=-1)&&(ur[i-1][j]!=-1)&&(tr[i]!=count) ) 
				{
					for (k=tr[i-1];k>=j;k--)  //j is current position
					{
						temp1=ur[i-1][k];
						ur[i-1][k+1]=temp1;

						temp2=dr[i-1][k];
						dr[i-1][k+1]=temp2;

						temp3=output[i-1][k];
						output[i-1][k+1]=temp3;
					}
				
					temp1=ur[i][j]+1;
					ur[i-1][j]=temp1;

					temp2=dr[i][j]-1;
					dr[i-1][j]=temp2;

					output[i-1][j]=0;

					tr[i-1]++;

				}	

				if ((ur[i][j]+1>ur[i-1][j]+1) && (ur[i][j]+1>dr[i-1][j]-1) && (ur[i][j]!=-1) && (ur[i-1][j]!=-1)&&(tr[i]!=count))
				{
					for (k=tr[i];k>=j;k--)  //j is current position
					{
						temp1=ur[i][k];
						ur[i][k+1]=temp1;

						temp2=dr[i][k];
						dr[i][k+1]=temp2;

						temp3=output[i][k];
						output[i][k+1]=temp3;
					}
				
					temp1=ur[i-1][j]+1;
					ur[i][j]=temp1;

					temp2=dr[i-1][j]-1;
					dr[i][j]=temp2;

					output[i][j]=0;

					tr[i]++;
				}
	
			}
		}


	}

//--------------------- Reverse ------------------------


	for (i=tc-1;i>=0;i--)
	{
		if ((tr[i]<count)&&(tr[i-1]==count)&&(i!=0))
		{
			for (j=0;j<=count;j++)
		
			{
				if ((ur[i][j]+1<ur[i-1][j]+1) && (dr[i][j]-1<ur[i-1][j]+1) && (ur[i][j]!=-1)&&(ur[i-1][j]!=-1)&&(tr[i]!=count)) 
				{
					for (k=tr[i-1];k>=j;k--)  //j is current position
					{
						temp1=ur[i-1][k];
						ur[i-1][k+1]=temp1;

						temp2=dr[i-1][k];
						dr[i-1][k+1]=temp2;

						temp3=output[i-1][k];
						output[i-1][k+1]=temp3;
					}
				
					temp1=ur[i][j]+1;
					ur[i-1][j]=temp1;

					temp2=dr[i][j]-1;
					dr[i-1][j]=temp2;

					output[i-1][j]=0;

					tr[i-1]++;

				}	

				if ((ur[i][j]+1>ur[i-1][j]+1) && (ur[i][j]+1>dr[i-1][j]-1) && (ur[i][j]!=-1) && (ur[i-1][j]!=-1)&&(tr[i]!=count))
				{
					for (k=tr[i];k>=j;k--)  //j is current position
					{
						temp1=ur[i][k];
						ur[i][k+1]=temp1;

						temp2=dr[i][k];
						dr[i][k+1]=temp2;

						temp3=output[i][k];
						output[i][k+1]=temp3;
					}
				
					temp1=ur[i-1][j]+1;
					ur[i][j]=temp1;

					temp2=dr[i-1][j]-1;
					dr[i][j]=temp2;

					output[i][j]=0;

					tr[i]++;
				}
	
			}
		}

//***************************************

		if ((tr[i]<count)&&(tr[i+1]==count)&&(i!=tc-1))
		{
			for (j=0;j<=count;j++)
		
			{
				if ((ur[i][j]+1<ur[i+1][j]+1) && (dr[i][j]-1<ur[i+1][j]+1) && (ur[i][j]!=-1)&&(ur[i+1][j]!=-1)&&(tr[i]!=count) ) 
				{
					for (k=tr[i+1];k>=j;k--)  //j is current position
					{
						temp1=ur[i+1][k];
						ur[i+1][k+1]=temp1;

						temp2=dr[i+1][k];
						dr[i+1][k+1]=temp2;

						temp3=output[i+1][k];
						output[i+1][k+1]=temp3;
					}
				
					temp1=ur[i][j]+1;
					ur[i+1][j]=temp1;

					temp2=dr[i][j]-1;
					dr[i+1][j]=temp2;

					output[i+1][j]=0;

					tr[i+1]++;

				}	

				if ((ur[i][j]+1>ur[i+1][j]+1) && (ur[i][j]+1>dr[i+1][j]-1) && (ur[i][j]!=-1) && (ur[i+1][j]!=-1)&&(tr[i]!=count))
				{
					for (k=tr[i];k>=j;k--)  //j is current position
					{
						temp1=ur[i][k];
						ur[i][k+1]=temp1;

						temp2=dr[i][k];
						dr[i][k+1]=temp2;

						temp3=output[i][k];
						output[i][k+1]=temp3;
					}
				
					temp1=ur[i+1][j]+1;
					ur[i][j]=temp1;

					temp2=dr[i+1][j]-1;
					dr[i][j]=temp2;

					output[i][j]=0;

					tr[i]++;
				}
	
			}

		}


	}

	return count;

}

int round(float n)
{
	int temp;
	n = n*10;
	temp = ((int)n)%10;
	if (temp >= 5)
		n = n + 10;
	temp = ((int)n)/10;
	return temp;
}

void Total_Row() 
{
	extern int ur[50][50],dr[50][50];
	extern int tr[50],tc;
	int i,j,k=1,num,num1=0;

//************** Find Line of Row************



	for (k=0;k<=tc-2;k++)
	{
		num=tr[k+1];
		for (i=0;i<=tr[k];i++)
		{
		
			if (tr[k+1]==-1)
			{
					
				ur[k+1][num1]=ur[k][i];
				dr[k+1][num1]=dr[k][i];
				num1++;
			}

			else for (j=0;j<=tr[k+1];j++)
			{
				if ((dr[k][i]<ur[k+1][j])&&(j==0))
					{
					num++;
					ur[k+1][num]=ur[k][i];
					dr[k+1][num]=dr[k][i];
					}

				else if ((ur[k][i]>dr[k+1][j-1])&&(dr[k][i]<ur[k+1][j])&&((j!=0)||(j!=tr[k+1])))
				{
					num++;
					ur[k+1][num]=ur[k][i];
					dr[k+1][num]=dr[k][i];
				}

				else if ((ur[k][i]>dr[k+1][j])&&(j==tr[k+1]))
				{
					num++;
					ur[k+1][num]=ur[k][i];
					dr[k+1][num]=dr[k][i];
				}
			}
		
			
		}
		
		if (tr[k+1]==-1) tr[k+1]=num1-1;
		else if (tr[k+1]!=num) tr[k+1]=num;

		num1=0;
		num=0;




//*********** Sort Data in tr[k+1]******************
	int temp1=0,temp2=0,a=0,b=0;
	for(a=0;a<=tr[k+1];a++)
	{
		for(b=a;b<=tr[k+1];b++)
		{
			if (ur[k+1][a]>ur[k+1][b])
			{
				temp1=ur[k+1][b];
				temp2=dr[k+1][b];
				ur[k+1][b]=ur[k+1][a];
				dr[k+1][b]=dr[k+1][a];
				ur[k+1][a]=temp1;
				dr[k+1][a]=temp2;
			}
		}
	}


	}


//****************** Reverse ********************

	for (k=tc-1;k>=1;k--)
	{
		num=tr[k-1];
		for (i=0;i<=tr[k];i++)
		{
		
			if (tr[k-1]==-1)
			{
					
				ur[k-1][num1]=ur[k][i];
				dr[k-1][num1]=dr[k][i];
				num1++;
			}

			else for (j=0;j<=tr[k-1];j++)
			{
				if ((dr[k][i]<ur[k-1][j])&&(j==0))
					{
					num++;
					ur[k-1][num]=ur[k][i];
					dr[k-1][num]=dr[k][i];
					}

				else if ((ur[k][i]>dr[k-1][j-1])&&(dr[k][i]<ur[k-1][j])&&((j!=0)||(j!=tr[k-1])))
				{
					num++;
					ur[k-1][num]=ur[k][i];
					dr[k-1][num]=dr[k][i];
				}

				else if ((ur[k][i]>dr[k-1][j])&&(j==tr[k-1]))
				{
					num++;
					ur[k-1][num]=ur[k][i];
					dr[k-1][num]=dr[k][i];
				}
			}
		
			
		}
		
		if (tr[k-1]==-1) tr[k-1]=num1-1;
		else if (tr[k-1]!=num) tr[k-1]=num;
		num1=0;
		num=0;



//*********** Sort Data in tr[k+1]******************
	int temp1=0,temp2=0,a=0,b=0;
	for(a=0;a<=tr[k-1];a++)
		for(b=a;b<=tr[k-1];b++)
			if (ur[k-1][a]>ur[k-1][b])
			{
				temp1=ur[k-1][b];
				temp2=dr[k-1][b];
				ur[k-1][b]=ur[k-1][a];
				dr[k-1][b]=dr[k-1][a];
				ur[k-1][a]=temp1;
				dr[k-1][a]=temp2;
			}

	}



}

BOOL LoadBMP(LPCTSTR sBMPFile, HGLOBAL *phDIB, CPalette *pPalDIB,int *bmHeight,int *bmWidth)
{
	CFile file;
	HGLOBAL hhDIB;
	if( !file.Open( sBMPFile, CFile::modeRead) )
		return FALSE;
	//AfxMessageBox(sBMPFile);

	BITMAPFILEHEADER bmfHeader;
	long nFileLen;

	nFileLen = file.GetLength();


	// Read file header
	if (file.Read((LPSTR)&bmfHeader, sizeof(bmfHeader)) != sizeof(bmfHeader))
		return FALSE;

	// File type should be 'BM'
	if (bmfHeader.bfType != ((WORD) ('M' << 8) | 'B'))
		return FALSE;

	hhDIB = ::GlobalAlloc(GMEM_FIXED, nFileLen);
	if (hhDIB == 0)
		return FALSE;

	// Read the remainder of the bitmap file.
	// Read BitmapInfo so hDIB keep BitmapInfoHeader;
	if (file.ReadHuge((LPSTR)hhDIB, nFileLen - sizeof(BITMAPFILEHEADER)) !=
		nFileLen - sizeof(BITMAPFILEHEADER) )
	{
		::GlobalFree(hhDIB);
		return FALSE;
	}
	
	BITMAPINFO &bmInfo = *(LPBITMAPINFO)hhDIB ;

	*bmWidth = bmInfo.bmiHeader.biWidth;
	*bmHeight = bmInfo.bmiHeader.biHeight;
//	doc_size = CSize(bmWidth,bmHeight);
//	char str[10];
//	wsprintf(str,"%d",bmWidth);
//	AfxMessageBox(str);
	int nColors = bmInfo.bmiHeader.biClrUsed ? bmInfo.bmiHeader.biClrUsed : 
						1 << bmInfo.bmiHeader.biBitCount;

	// Create the palette
	if( nColors <= 256 )
	{
		//::CreateDIBPalette(hhDIB,pPalDIB);
		UINT nSize = sizeof(LOGPALETTE) + (sizeof(PALETTEENTRY) * nColors);
		LOGPALETTE *pLP = (LOGPALETTE *) new BYTE[nSize];

		pLP->palVersion = 0x300;
		pLP->palNumEntries = nColors;

		for( int i=0; i < nColors; i++)
		{
			pLP->palPalEntry[i].peRed = bmInfo.bmiColors[i].rgbRed;
			pLP->palPalEntry[i].peGreen = bmInfo.bmiColors[i].rgbGreen;
			pLP->palPalEntry[i].peBlue = bmInfo.bmiColors[i].rgbBlue;
			pLP->palPalEntry[i].peFlags = 0;
		}

		pPalDIB->CreatePalette( pLP );

		delete[] pLP;
	}
	*phDIB=hhDIB;
	return TRUE;
}