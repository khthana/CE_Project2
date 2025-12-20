// FImage.cpp: implementation of the FImage class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FImage.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

FImage::FImage()
{
	m_data = NULL;
	m_width = 0;
	m_height = 0;
}


FImage::FImage(F_PIXEL *Data, int Width, int Height)
{
	Create(Data, Width, Height);
}

FImage::~FImage()
{

}

void FImage::Create(F_PIXEL *Data, int Width, int Height)
{
	m_data = Data;
	m_width = Width;
	m_height = Height;
}