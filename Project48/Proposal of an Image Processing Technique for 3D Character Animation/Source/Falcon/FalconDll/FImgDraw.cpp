// FImgDraw.cpp: implementation of the FImgDraw class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FImgDraw.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

FImgDraw::FImgDraw()
{

}

FImgDraw::~FImgDraw()
{

}

void FImgDraw::DrawCrosshair(FImage &Target, int ptx, int pty, int size, F_PIXEL &color)
{
	F_PIXEL *pTrgPix;

	// Draw horizontal line
	int x, y;
	int start = ptx - size;
	int stop = ptx + size;
	if (start < 0) start = 0;
	if (stop >= Target.m_width) stop = Target.m_width - 1;
	pTrgPix = Target.m_data;
	pTrgPix += (pty * Target.m_width) + start;
	for (x=start; x<=stop; x++)
	{
			*pTrgPix = color;
			pTrgPix++;
	}

	// Draw vertical line
	start = pty - size;
	stop = pty + size;
	if (start < 0) start = 0;
	if (stop >= Target.m_height) stop = Target.m_height - 1;
	pTrgPix = Target.m_data;
	pTrgPix += (start * Target.m_width) + ptx;
	for (y=start; y<=stop; y++)
	{
			*pTrgPix = color;
			pTrgPix += Target.m_width;
	}
}
