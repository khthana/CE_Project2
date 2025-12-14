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

#include "stdafx.h"
#include "Camera2.h"
#include "Engine\CacheTriangle.h"

CCamera2::CCamera2():
CCamera()
{
	m_fUpFromLand = 1.5f;
	SetCacheSize( 5 );
}

CCamera2::~CCamera2()
{

}

BOOL CCamera2::LayOn( CSLandModel *pLandModel ) // pModel Not Modify
{
	float Px = GetEyePt().x;
	float OldHigh = GetEyePt().y;
	float Pz = GetEyePt().z;
	float High;

	if( !CacheTri.GetHigh1( Px,
						    Pz,
						    &High ) )
	{
		// If not found in cache, Search in earth
		CTriangle HitTriangle;
		if( pLandModel->GetHigh1( Px,
								  Pz,
								  &High, NULL, &HitTriangle ) )
		{
			CCamera::SetParamsSystem2( Px, High + m_fUpFromLand, Pz,
									   CCamera::GetR(),
									   CCamera::GetZetha(),
									   CCamera::GetPhi(),
									   CCamera::GetUpVec().x,
									   CCamera::GetUpVec().y,
									   CCamera::GetUpVec().z );

			CacheTri.Add( HitTriangle );
			return TRUE;
		}

		// If not found in both return false
		return FALSE;
	}
	else
	{
		CCamera::SetParamsSystem2( Px, High + m_fUpFromLand, Pz,
								   CCamera::GetR(),
								   CCamera::GetZetha(),
								   CCamera::GetPhi(),
								   CCamera::GetUpVec().x,
								   CCamera::GetUpVec().y,
								   CCamera::GetUpVec().z );
	}

	// If in Cache Return True
	return TRUE;
}

void CCamera2::SetCacheSize( int nCacheSize )
{
	ASSERT( nCacheSize >= 0 );
	CacheTri.SetCacheSize( nCacheSize );
}