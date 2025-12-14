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
#include "Tree.h"


CTree::CTree()
{
	SetCacheSize(1); // one value for not move model
	m_fRadius = 0.5f;
}

CTree::~CTree()
{
	ClearModel();
}


void CTree::LoadModel( const char *strFileName )
{
	m_Data.Use(strFileName);
}

void CTree::ClearModel()
{
	m_Data.UnUse();
}

void CTree::Render( int nDetail,const D3DXMATRIX* matCustom )
{
	// Check error render type
	if ( ( nDetail < 0 )  || (nDetail >= MAXRENDERTYPE) ) return;


/*	float test = CMovMat::Row();
	CMovMat::SetRotation( test + float( rand()%100) /200.0f ,CMovMat::Zetha() , CMovMat::Phi() );
  */
	if( ( nDetail == CMultiDetailData::BillBoard ) )
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

	CMultiDetailData * pData = m_Data.Get();

	if (pData != NULL )
	{
		pData->Render(nDetail);
	}

	//CMovMat::SetRotation( test,CMovMat::Zetha() , CMovMat::Phi() );


}

BOOL CTree::LayOn( CSLandModel* ppLandModel , BOOL bFollowNorm  )
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
			if ( bFollowNorm )
			{
				D3DXVECTOR3 vNormal = HitTriangle.GetNormalVec();
				CMovMat::SetDirVecMode( CMovMat::DV_NORMALVEC );
				CMovMat::SetDirVec( &vNormal );	 
			}

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

void CTree::SetCacheSize( int nCacheSize )
{
	ASSERT( nCacheSize >= 0 );
	CacheTri.SetCacheSize( nCacheSize );	
}

void CTree::WriteToFileStream( ofstream* ofs )
{
	float px = Px();
	float py = Py();
	float pz = Pz();
	float sx = Sx();
	float sy = Sy();
	float sz = Sz();

	ofs->write( (char *)(&px), 4 );
	ofs->write( (char *)(&py), 4 );
	ofs->write( (char *)(&pz), 4 );
	ofs->write( (char *)(&sx), 4 );
	ofs->write( (char *)(&sy), 4 );
	ofs->write( (char *)(&sz), 4 );
	ofs->write( (char *)(&m_fRadius), 4 );
}

void CTree::ReadFromFileStream( ifstream* ifs )
{
	float px = Px();
	float py = Py();
	float pz = Pz();
	float sx = Sx();
	float sy = Sy();
	float sz = Sz();

	ifs->read( (char *)(&px), 4 );
	ifs->read( (char *)(&py), 4 );
	ifs->read( (char *)(&pz), 4 );
	CMovMat::SetPosition( px, py, pz );

	ifs->read( (char *)(&sx), 4 );
	ifs->read( (char *)(&sy), 4 );
	ifs->read( (char *)(&sz), 4 );
	CMovMat::SetScale( sx, sy, sz );

	ifs->read( (char *)(&m_fRadius), 4 );

	int nRandom = rand()%9;

	if ( ( nRandom == 0 ) || ( nRandom == 7 ))
	{
		CTree::LoadModel("MultiDetailData\\TType_01.mam");
	}
	else if (( nRandom == 1 )|| ( nRandom == 8 ))
	{
		CTree::LoadModel("MultiDetailData\\TType_02.mam");
	}
	else if ( nRandom == 2 )
	{
		CTree::LoadModel("MultiDetailData\\TType_03.mam");
	}
	else if ( nRandom == 3 )
	{
		CTree::LoadModel("MultiDetailData\\TType_04.mam");
	}
	else if ( nRandom == 4 )
	{
		CTree::LoadModel("MultiDetailData\\TType_05.mam");
	}
	else if ( nRandom == 5 )
	{
		CTree::LoadModel("MultiDetailData\\TType_06.mam");
	}
	else if ( nRandom == 6 )
	{
		CTree::LoadModel("MultiDetailData\\TType_07.mam");
	}

	
}