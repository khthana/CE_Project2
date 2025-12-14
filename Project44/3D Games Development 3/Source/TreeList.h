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

#include "stdafx.h"
#include "d3dx8.h"
#include "Tree.h"


static float __fRenderTreeLength[MAXRENDERTYPE] =
{
	100.0f	,			//"HiDetail"
	200.0f	,			//"MidDetail"
	300.0f	,			//"LowDetail" 
	1600.0f	,			//"BillBoard" 
	1111111111111.0f	//"NotRender"  Infinity number
};

class CTreeList  
{
private:
	CPtrArray  m_ptrTree;

public:
	void RenderAt(	int nNumber,
					D3DXVECTOR3 &vCamera,
					const D3DXMATRIX * matBillBoard);

	void RenderAll(	D3DXVECTOR3 &vCamera,
					const D3DXMATRIX * matBillBoard);

	CTree* GetAt(int nCount);

	void AddTree(	const char * FileName,
					float fX,float fY,float fZ,
					float fSX = 1.0f ,float fSY = 1.0f ,float fSZ = 1.0f,
					D3DXVECTOR3 vNormal = cs::vY ,
					float fRow = 0.0f ,
					float fPhi = 0.0f , 
					float fZetha = 0.0f);

	void AddTree(CTree * pTree);

	void Delete( int nCount);
	void ClearTreeList();

	BOOL CanStay(float fX,float fZ);

	CTreeList();
	virtual ~CTreeList();

	void SaveToFile( const char* FileName );
	void LoadFromFile( const char* FileName );

};

