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

#include "..\stdafx.h"
#include "EffectBillBoard.h"
#include "Texture.h"

class CEffectBillboardList  
{
private:
	CPtrArray m_ptrList;


public:
	CEffectBillboardList();
	virtual ~CEffectBillboardList();

public:
	void SetTexture( const char * FileName);
	void Render( D3DXMATRIX  &matBillboard );
	void Clear();

	void Add(
						const char *  FileName  ,
						float fXStart			,
						float fYStart			,
						float fZStart			,

						float fXEnd				,
						float fYEnd				,
						float fZEnd				,

						float fStartWidth		,
						float fStartHeight		,
						float fEndWidth			,
						float fEndHeight		,

						float fStartR			,
						float fStartG			,
						float fStartB			,
						float fStartA			,

						float fEndR				,
						float fEndG				,
						float fEndB				,
						float fEndA				,

						float fAllTime			
			);
};

