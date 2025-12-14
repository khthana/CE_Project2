/////////////////////////////////////////////////////////////////////////////
//
//	Copyright (c) 2001, Maetee Supreanruey and Anusorn Krasantisuk
//	All Rights Reserved.
//
//	This is UNPUBLISHED PROPRIETARY SOURCE CODE of Maetee Supreanruey 
//	and Anusorn Krasantisuk, the contents of this file may not be 
//	disclosed to third parties, copied or duplicated in any form, 
//	in whole or in part, without the prior written permission of 
//	Maetee Supreanruey and Anusorn Krasantisuk.
//
/////////////////////////////////////////////////////////////////////////////

#include "..\stdafx.h"
#include "mousepointer.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


CMousePointer::CMousePointer(void)
{

	fPosX = 0.0f;
	fPosY = 0.0f;

	fW = 32.0f/800.0f;
	fH = 32.0f/600.0f;

	fPointX = fW/2.0f;
	fPointY = fH/2.0f;

	fU1 = 0.0f;
	fV1 = 0.0f;
	fU2 = 1.0f;
	fV2 = 1.0f;
}

CMousePointer::~CMousePointer(void)
{
}

HRESULT CMousePointer::Render()
{


	BOOL IsBlend = glIsEnabled(GL_BLEND);

	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA,GL_ONE);					// Select The Type Of Blending

	glColor3f(1.0f,1.0f,1.0f);

	CText2D::PutPictureIn2D(   
								&Texture,//surface of picture
								fPosX - fPointX,//Start Position of picture on X Axis
								fPosY - fPointY,//Start Position of picture on Y Axis
								fPosX - fPointX + fW,//End Position of picture on X Axis
								fPosY - fPointY + fH,//End Position of picture on Y Axis
								0.0f, //Position of z
								fU1,// start TU
								fV1,// start TU
								fU2,// start TU
								fV2// start TU
								);//Destridestnation Blend

	if ( ! IsBlend )
	{
		glDisable(GL_BLEND);
	}

	return S_OK;
}

void CMousePointer::SetMousePos(int nX, int nY, int nW, int nH)
{
	if ( ( nX >= 0 ) && (nX < nW))
	{
		fPosX = float(nX)/float(nW);
	}

	if ( ( nY >= 0 ) && (nY < nH))
	{
		fPosY = float(nY)/float(nH);
	}
}

void CMousePointer::UseTexture(const CString& strName)
{
		Texture.Use(strName);
}
