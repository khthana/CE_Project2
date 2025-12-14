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
#include "D3DX8.h"
#include "Triangle.h"

class CCacheTriangle : public CObject  
{

private:
	CPtrArray  m_ptrList;
	int m_nSize;

public:
	CCacheTriangle();
	virtual ~CCacheTriangle();

// User Interface 
public:
	void SetCacheSize(int nSize);
	BOOL GetHigh1( float X, float Z,float* High );
	BOOL GetCurrentTriangle( CTriangle *pTriangle );

	void Add( const D3DXVECTOR3& V0,
			  const D3DXVECTOR3& V1,
			  const D3DXVECTOR3& V2 );

	void Add( const CTriangle& Triangle );

	void DestroyAll();
};

