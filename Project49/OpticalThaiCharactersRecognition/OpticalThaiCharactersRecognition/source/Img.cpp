// Img.cpp: implementation of the CImg class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "ImgProc.h"
#include "Img.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CImg::CImg()
{
	m_pImgDat = NULL;
}

CImg::~CImg()
{

}

CImg::CImg(TBCOLOR *pImg, CSize *szImg)
{
	m_pImgDat = pImg;
	m_ImgSize = *szImg;
}

TBCOLOR CImg::GetPixel(const CPoint *pt) const
{
	if (IsOutofBound(pt)) // out of bound, return black
		return Black();
	else 
		return m_pImgDat[GetIndex(pt)];
}

void CImg::SetPixel(const CPoint *pt, TBCOLOR color)
{
	if (!IsOutofBound(pt))
		m_pImgDat[GetIndex(pt)] = color;
}

UINT CImg::GetIndex(const CPoint *pt) const
{
	// Get the actual image data array index from specified point
	CPoint ptActual(*pt);
	ptActual.y = m_ImgSize.cy - ptActual.y - 1;
	return ((ptActual.y * m_ImgSize.cx) + ptActual.x);
}

void CImg::InitCount()
{
	// Start pixel iteration at top-left
	m_Count.x = m_Count.y = 0;
}

BOOL CImg::EndOfImage()
{
	return (m_Count == CPoint(m_ImgSize.cx - 1, m_ImgSize.cy - 1));
}

void CImg::NextCount()
{
	// Iterate from left to right, top to bottom
	if (EndOfImage())	// Wrap around to top-left
		InitCount();
	else {
		m_Count.x++;
		if (m_Count.x >= m_ImgSize.cx) {
			// Next row
			m_Count.x = 0;
			m_Count.y++;
		}
	}
}

CPoint * CImg::GetCurrentPoint(void)
{
	return &m_Count;
}

BOOL CImg::IsOutofBound(const CPoint *pt) const
{
	return ((pt->x < 0) | (pt->y < 0) | (pt->x >= m_ImgSize.cx) | (pt->y >= m_ImgSize.cy));
}

/*BOOL CImg::CreateImage(CVideoOCX *vc, const CSize *szImg)
{
	m_hImage = vc->CreateColorImageHandle(szImg->cx, szImg->cy);

	if (!m_hImage) {	// If create fail
		m_pImgDat = NULL;
		return FALSE;
	}

	m_ImgSize = *szImg;
	m_pImgDat = (TBCOLOR *)vc->GetDataPointer(m_hImage);
	return TRUE;
}*/

long CImg::GetImgHandle()
{
	return m_hImage;
}

void CImg::ClearImg(TBCOLOR color)
{
	for (InitCount(); !EndOfImage(); NextCount())
		SetPixel(GetCurrentPoint(), color);
}

/*BOOL CImg::ReleaseImage(CVideoOCX *vc)
{
	if (m_pImgDat) return FALSE;
	vc->ReleaseImageHandle(m_hImage);
	return TRUE;
}*/

BOOL CImg::IsBorder(const CPoint *pt)
{
	return ((pt->x == 0) | (pt->y == 0) | (pt->x == (m_ImgSize.cx - 1)) | (pt->y == (m_ImgSize.cy - 1)));
}

TBCOLOR CImg::Black(void)
{
	TBCOLOR buf;
	buf.red = buf.green = buf.blue = 0;
	return buf;
}

TBCOLOR CImg::White(void)
{
	TBCOLOR buf;
	buf.red = buf.green = buf.blue = 255;
	return buf;
}

TBCOLOR CImg::GetNeighborPx(const CPoint *pt, int index) const
{
	CPoint ptNeighbor;
	GetNeighborPt(pt, index, &ptNeighbor);

	if ((index >= 0) & (index <= 8))
		return GetPixel(&ptNeighbor);
	else
		return CImg::Black();
}

TBCOLOR CImg::Gray(BYTE inten)
{
	TBCOLOR buf;
	buf.red = buf.green = buf.blue = inten;
	return buf;
}

void CImg::SetNeighborPx(const CPoint *pt, int index, TBCOLOR cColor)
{
	CPoint ptNeighbor;
	GetNeighborPt(pt, index, &ptNeighbor);

	SetPixel(&ptNeighbor, cColor);
}

void CImg::GetNeighborPt(const CPoint *pt, int index, CPoint *ptRet) const
{
/*
	4 3 2
	5 0 1
	6 7 8
*/

	switch (index) {
	case 0:	// itself
		*ptRet = *pt;
		break;
	case 1:
		*ptRet = CPoint(pt->x + 1, pt->y);
		break;
	case 2:
		*ptRet = CPoint(pt->x + 1, pt->y - 1);
		break;
	case 3:
		*ptRet = CPoint(pt->x, pt->y - 1);
		break;
	case 4:
		*ptRet = CPoint(pt->x - 1, pt->y - 1);
		break;
	case 5:
		*ptRet = CPoint(pt->x - 1, pt->y);
		break;
	case 6:
		*ptRet = CPoint(pt->x - 1, pt->y + 1);
		break;
	case 7:
		*ptRet = CPoint(pt->x, pt->y + 1);
		break;
	case 8:
		*ptRet = CPoint(pt->x + 1, pt->y + 1);
		break;
	}	
}

void CImg::PutMark(const CPoint *pttl,const CPoint *ptbr,TBCOLOR c)
{
	int i,j;
/*	int k = side/2;
	int flag = 0;

	if((side % 2) == 0)
		flag == 1;*/
	int xdiff = ptbr->x - pttl->x;
	int ydiff = pttl->y - ptbr->y;

    //if(ydiff < 0) ydiff *= -1;  
//	if(flag == 1)
//	{
		for(i = 0;i <= xdiff;i++)
		{
			SetPixel(&CPoint(pttl->x + i, pttl->y), c);
			SetPixel(&CPoint(pttl->x + i, ptbr->y), c);	
		}
		for(j = 0;j < ydiff;j++)
		{
			SetPixel(&CPoint(pttl->x, ptbr->y + j), c);
			SetPixel(&CPoint(ptbr->x, ptbr->y + j), c);
		}
//	}
	/*else
	{
		for(i = -k;i < (k+1);i++)
		{
			SetPixel(&CPoint(pt->x + i, pt->y - k), c);
			SetPixel(&CPoint(pt->x + i, pt->y + k), c);
		}
		for(j = -k;j < (k+1);j++)
		{
			SetPixel(&CPoint(pt->x - k, pt->y + j), c);
			SetPixel(&CPoint(pt->x + k, pt->y + j), c);
		}
	}*/
	//for (i=-5; i<6; i++)
	//	SetPixel(&CPoint(pt->x + i, pt->y), c);
	//for (i=-5; i<6; i++)
	//	SetPixel(&CPoint(pt->x, pt->y + i), c);
}

BYTE * CImg::GetDataPointer()
{
	return (BYTE*)m_pImgDat;
}

int CImg::GetWidth()
{
	return m_ImgSize.cx;
}

int CImg::GetHeight()
{
	return m_ImgSize.cy;
}