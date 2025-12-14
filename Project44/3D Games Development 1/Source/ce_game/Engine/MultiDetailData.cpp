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
#include "MultidetailData.h"
#include "Logger.h"

CMultiDetailData::CMultiDetailData()
{
}

CMultiDetailData::~CMultiDetailData()
{
	ClearModel();
}


void CMultiDetailData::LoadMultiDetailModel( const char *strFileName )
{
	if ( strFileName == NULL ) return;

	CStdioFile fp( strFileName, CFile::modeRead );

	if( fp )
	{
		CString str;
		fp.ReadString( str );
		if( strcmp( str, "Maetee Supreanruey and Anusorn Krasantisuk format" ) != 0 )
		{
			char sz[255];
			sprintf(sz,"Error file format name <%s>",strFileName);
			Log(sz);
			fp.Close();
			return ;
		}
		fp.ReadString( str );

		//Start Read data
		fp.ReadString( str );
		m_pStaticModelData[HiDetail].Use( String::Token(str,1," \t") );
		
		fp.ReadString( str );
		m_pStaticModelData[MidDetail].Use( String::Token(str,1," \t") );
		
		fp.ReadString( str );
		m_pStaticModelData[LowDetail].Use( String::Token(str,1," \t") );
		
		fp.ReadString( str );
		m_pStaticModelData[BillBoard].Use( String::Token(str,1," \t") );
		
	}
	else
	{
		Log("Error can't load file in void CMultiDetailData::LoadModel( const char *strFileName )");
	}
}

void CMultiDetailData::ClearModel()
{
	m_pStaticModelData[HiDetail].UnUse();
	m_pStaticModelData[MidDetail].UnUse();
	m_pStaticModelData[LowDetail].UnUse();
	m_pStaticModelData[BillBoard].UnUse();
}

void CMultiDetailData::Render(int nDetail )
{
	// Check error render type
	if ( ( nDetail < 0 )  || (nDetail >= MAXRENDERTYPE) ) return;

/*	D3DXMATRIX OldMatWorld;
	GLGfx::GetMatWorld( &OldMatWorld );*/
/*
	if( ( nDetail == BillBoard ) )
	{
		if ( matCustom != NULL )
		{
			// cross
			D3DXMATRIX MatOut;
			Mat::Mul( &MatOut, matCustom, CMovMat::GetpMat() );
			GLGfx::SetMatWorld( &MatOut );
		}
	}
	else
	{
		GLGfx::SetMatWorld( CMovMat::GetpMat() );
	}
*/
	m_pStaticModelData[nDetail].Render();

//	GLGfx::SetMatWorld( &OldMatWorld );
}

/*
BOOL CMultiDetailData::LayOn( CSLandModel* ppLandModel )
{
	// Check in Cache first
	float High;
	if( !CacheTri.GetHigh1( CMovMat::Px(),
						    CMovMat::Pz(),
						    &High ) )
	{
		// If not found in cache, Search in earth
		CTriangle HitTriangle;
		if( ppLandModel->GetHigh1( CMovMat::Px(),
								  CMovMat::Pz(),
								  &High, NULL, &HitTriangle ) )
		{
			D3DXVECTOR3 vNormal = HitTriangle.GetNormalVec();
			CMovMat::SetDirVecMode( CMovMat::DV_NORMALVEC );
			CMovMat::SetDirVec( &vNormal );	 
			CMovMat::SetPosition( CMovMat::Px(),
								  High,
								  CMovMat::Pz() );
			CacheTri.Add( HitTriangle );
			return TRUE;
		}

		// If not found in both return false
		return FALSE;
	}
	else
	{
		CMovMat::SetPosition( CMovMat::Px(),
								  High,
								  CMovMat::Pz() );
	}

	// If in Cache Return True
	return TRUE;
	
}

void CMultiDetailData::SetCacheSize( int nCacheSize )
{
	ASSERT( nCacheSize >= 0 );
	CacheTri.SetCacheSize( nCacheSize );	
}
*/