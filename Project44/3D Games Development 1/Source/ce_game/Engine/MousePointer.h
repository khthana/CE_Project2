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

#pragma once

#include "Texture.h"
#include "Text2D.h"

class CMousePointer
{
public:
	CMousePointer(void);
	~CMousePointer(void);

private:
	CUseTexture Texture;

	float fPosX,fPosY;
	float fPointX,fPointY;
	float fW,fH;
	float fU1,fV1,fU2,fV2;

//User Interface
public:
	virtual HRESULT Render();

	void SetMousePos(int nX, int nY, int nW, int nH);
	void UseTexture(const CString& strName);
};


