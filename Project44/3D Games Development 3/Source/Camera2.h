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

#include "Engine\Camera.h"
#include "Engine\StaticModel.h"
#include "Engine\CacheTriangle.h"

class CCamera2 : public CCamera  // Support LayOn
{
public:
	CCamera2();
	virtual ~CCamera2();

protected:
	// Cache Triangle Use for GetHigh
	CCacheTriangle CacheTri;
	float          m_fUpFromLand;

public:
	BOOL LayOn( CSLandModel *pLandModel ); // pModel Not Modify
	void SetCacheSize( int nCacheSize );
};