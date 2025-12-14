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
#include <gl\gl.h>			// Header File For The OpenGL32 Library
#include <gl\glu.h>			// Header File For The GLu32 Library
#include <gl\glaux.h>		// Header File For The Glaux Library
#include "Util.h"
#include "GLGfx.h"
#include "Triangle.h"
#include "Model.h"

CModel::CModel(void):
CMovMat()
{
	m_bModelPrompt = FALSE;
	SetUseBoundSphereInRayTest( TRUE );
}

CModel::~CModel (void)
{
	ClearModel();	
}

void CModel::ClearModel()
{
	UnUsePartDef();
}

HRESULT CModel::UsePartDef( const char *strFileName )
{
	m_PartDef.Use( strFileName );
	return S_OK;
}

HRESULT CModel::UnUsePartDef()
{
	m_PartDef.UnUse();
	return S_OK;
}









