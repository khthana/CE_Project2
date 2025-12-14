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

#include "StaticModel.h"
#include "StaticModelData.h"


#define		MAXRENDERTYPE		5


static char __szRenderType[MAXRENDERTYPE][20] =
{
	"HiDetail",
	"MidDetail", 
	"LowDetail", 
	"BillBoard", 
	"NotRender"

};

static float __fRenderLength[MAXRENDERTYPE] =
{
	0.0f	,			//"HiDetail"
	10.0f	,			//"MidDetail"
	50.0f	,			//"LowDetail" 
	100.0f	,			//"BillBoard" 
	500.0f				//"NotRender" 
};


class CMultiDetailData 
{
// Enumulator
public:
	enum DetailLength
	{
		HiDetail = 0	,
		MidDetail 		,
		LowDetail  		,
		BillBoard  		,
		NotRender  	
	};

private : 
	CUseStaticModelData		m_pStaticModelData[ MAXRENDERTYPE - 1 ];

public:
	CMultiDetailData();
	virtual ~CMultiDetailData();

//User Interface 
public:
	void LoadMultiDetailModel( const char *strFileName );
	void ClearModel();
	void Render(int nDetail);

};

