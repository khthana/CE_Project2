// dib.cpp
// implement file for CDIBitmap class

#include "stdafx.h"
#include "malloc.h"
#include "dib.h"


#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

////////////////////////////////////////////
// CDIBitmap

IMPLEMENT_SERIAL(CDIBitmap, CObject, 0)

CDIBitmap::CDIBitmap()
{
	m_pBMI = NULL;
	m_pBits = NULL;
}

CDIBitmap::~CDIBitmap()
{
	// Free memory.
	if(m_pBMI != NULL)
		free(m_pBMI);
	if(m_pBits != NULL)
		free(m_pBits);
}

void CDIBitmap::Serialize(CArchive& ar)
{
	ASSERT(TRUE);
}

static BOOL IsPMDIB(BITMAPINFOHEADER* pBIH)
{
	ASSERT(pBIH);
	if(((BITMAPCOREHEADER*)pBIH)->bcSize == sizeof(BITMAPCOREHEADER))
		return TRUE;

	return FALSE;
}

static int GetColorEntriesInDIB(BITMAPINFO* pBmpInfo)
{
	BITMAPINFOHEADER* pBIH;
	BITMAPCOREHEADER* pBCH;
	int iColors = 0, iBitsPerPixel;

	ASSERT(pBmpInfo);

	pBIH = &(pBmpInfo->bmiHeader);
	pBCH = (BITMAPCOREHEADER*) pBIH;

	if((!IsPMDIB(pBIH)) &&(pBIH->biClrUsed != 0))
	{
		iColors = pBIH->biClrUsed;
		return iColors;
	}

	if(IsPMDIB(pBIH))
		iBitsPerPixel = pBCH->bcBitCount;
	else 
		iBitsPerPixel = pBIH->biBitCount;

	if(iBitsPerPixel == 1)
		iColors = 2;
	if(iBitsPerPixel == 4)
		iColors = 16;
	if(iBitsPerPixel == 8)
		iColors = 256;

	return iColors;
}

RGBQUAD* CDIBitmap::GetBMColorTabPtr()
{
	return (LPRGBQUAD)(((BYTE*)(m_pBMI))+ sizeof(BITMAPINFOHEADER));
}

int CDIBitmap::GetNumClrEntries()
{
	return GetColorEntriesInDIB(m_pBMI);
}

int CDIBitmap::GetBMWidth()
{
	return m_pBMI->bmiHeader.biWidth;
}

int CDIBitmap::GetBMHeight()
{
	return m_pBMI->bmiHeader.biHeight;
}

void CDIBitmap::DrawBitmap(CDC* pDC,int x,int y)
{
	if(m_pBMI == NULL)
		return;
	::StretchDIBits(pDC->GetSafeHdc(),
		x,
		y,
		m_pBMI->bmiHeader.biWidth,
		m_pBMI->bmiHeader.biHeight,
		0,
		0,
		m_pBMI->bmiHeader.biWidth,
		m_pBMI->bmiHeader.biHeight,
		GetBMBitsPtr(),
		GetBMHdrPtr(),
		DIB_RGB_COLORS,
		SRCCOPY);
}

BOOL CDIBitmap::LoadDIB(CFile* fp)
{
	BOOL bIsPM = FALSE;
	BITMAPINFO* pBmpInfo = NULL;
	BYTE* pBits = NULL;
	int iColors, iColorTableSize, iBitsSize, iBISize;

	DWORD dwFileStart = fp->GetPosition();

	BITMAPFILEHEADER BmpFileHdr;
	int iBytes;
	iBytes = fp->Read(&BmpFileHdr, sizeof(BmpFileHdr));
	if(iBytes != sizeof(BmpFileHdr))
	{
		AfxMessageBox("Error reading file header");
		goto error;
	}

	if(BmpFileHdr.bfType!= 0x4D42)	
	{
		AfxMessageBox("Not a bitmap file");
		goto error;
	}

	BITMAPINFOHEADER BmpInfoHdr;
	iBytes = fp->Read(&BmpInfoHdr, sizeof(BmpInfoHdr));
	if(iBytes != sizeof(BmpInfoHdr))
	{
		AfxMessageBox("Error reading header information");
		goto error;
	}

	if(BmpInfoHdr.biSize != sizeof(BITMAPINFOHEADER))
	{
		bIsPM = TRUE;

		if(BmpInfoHdr.biSize != sizeof(BITMAPCOREHEADER))
		{
			AfxMessageBox("Unknow DIB format");
			goto error;
		}

		fp->Seek(dwFileStart+sizeof(BITMAPFILEHEADER),CFile::begin);
		BITMAPCOREHEADER BmpCoreHdr;
		iBytes = fp->Read(&BmpCoreHdr, sizeof(BmpCoreHdr));
		if(iBytes != sizeof(BmpCoreHdr))
		{
			AfxMessageBox("Error reading header information");
			goto error;
		}

		BmpInfoHdr.biSize = sizeof(BITMAPINFOHEADER);
		BmpInfoHdr.biWidth = (int) BmpCoreHdr.bcWidth;
		BmpInfoHdr.biHeight = (int) BmpCoreHdr.bcHeight;
		BmpInfoHdr.biPlanes = BmpCoreHdr.bcPlanes;
		BmpInfoHdr.biBitCount = BmpCoreHdr.bcBitCount;
		BmpInfoHdr.biCompression = BI_RGB;
		BmpInfoHdr.biSizeImage = 0;
		BmpInfoHdr.biXPelsPerMeter = 0;
		BmpInfoHdr.biYPelsPerMeter = 0;
		BmpInfoHdr.biClrUsed = 0;
		BmpInfoHdr.biClrImportant = 0;
	}


	iColors = GetColorEntriesInDIB((LPBITMAPINFO) &BmpInfoHdr);
	iColorTableSize = iColors * sizeof(RGBQUAD);

	iBISize = sizeof(BITMAPINFOHEADER) + 256*sizeof(RGBQUAD);
	iBitsSize = BmpFileHdr.bfSize - BmpFileHdr.bfOffBits;

	pBmpInfo = (LPBITMAPINFO) malloc(iBISize);
	if(!pBmpInfo)
	{
		AfxMessageBox("Insufficient memory for DIB header");
		goto error;
	}

	memcpy(pBmpInfo,&BmpInfoHdr,sizeof(BITMAPINFOHEADER));
	if(bIsPM == FALSE)
	{
		iBytes = fp->Read(((LPBYTE)pBmpInfo )+ sizeof(BITMAPINFOHEADER),iColorTableSize);

		if(iBytes!= iColorTableSize)
		{
			AfxMessageBox("Error reading color table");
			goto error;
		}
	}
	else 
	{
		LPRGBQUAD lpRGB;
		lpRGB = (LPRGBQUAD) ((LPBYTE) pBmpInfo + sizeof(BITMAPINFOHEADER));
		RGBTRIPLE rgbt;
		for(int i=0;i<iColors;i++)
		{
			iBytes = fp->Read(&rgbt,sizeof(RGBTRIPLE));
			if(iBytes!= sizeof(RGBTRIPLE))
			{
				AfxMessageBox("Error reading color table data.");
				goto error;
			}

			lpRGB->rgbBlue = rgbt.rgbtBlue;
			lpRGB->rgbGreen = rgbt.rgbtGreen;
			lpRGB->rgbRed = rgbt.rgbtRed;
			lpRGB->rgbReserved = 0;
			lpRGB++;
		}
	}

	pBits = (BYTE*) malloc(iBitsSize);
	if(pBits == NULL)
	{
		AfxMessageBox("Insufficient memory to read DIB bits");
		goto error;
	}

	iBytes = fp->Seek(dwFileStart + BmpFileHdr.bfOffBits,CFile::begin);
	iBytes = fp->Read(pBits,iBitsSize);
	if(iBytes != iBitsSize)
	{
		AfxMessageBox("Error reading bitmap data");
		goto error;
	}

	if(m_pBMI != NULL)
		free(m_pBMI);
	m_pBMI = pBmpInfo;

	if(m_pBits != NULL)
		free(m_pBits);
	m_pBits = pBits;
	return TRUE;

error:
	if(pBmpInfo)
		free(pBmpInfo);
	if(pBits)
		free(pBits);
	return FALSE;
}

