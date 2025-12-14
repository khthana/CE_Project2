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
#include "AnimationSet.h"
#include "logger.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CAnimationSet::CAnimationSet()
{
	m_nNumAnimation     = 0;
	m_pCurrentAnimation = NULL;
}

CAnimationSet::~CAnimationSet()
{
	DestroyAnimationSet();
}

void CAnimationSet::LoadAnimationSet(const CString& strFileName)
{
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

		// Read Num Animation
		fp.ReadString( str );
		CString m_nNumAnimation = atoi( String::Token( str, 1, " " ) );
		
		for( int i = 0; i < m_nNumAnimation; i++ )
		{
			fp.ReadString( str );
			CString AniKey      = String::Token( str, 1, " " );
			CString AniFileName = String::Token( str, 2, " " );
			CUseAnimation *pAnimation = new CUseAnimation;

			// Make Upper First
			AniKey.MakeUpper();
			pAnimation->m_strKey = AniKey;
			pAnimation->Use( AniFileName );
			m_Tree.Add( pAnimation );
		}

		// Start Read Animation Set
		fp.Close();
	}
	else
	{
		char sz[255];
		sprintf(sz,"-- have no file name <%s>",LPCTSTR(strFileName));
		Log("\r\n Error ! void CAnimationSet::LoadAnimationSet(CString strFileName)\r\n");
		Log(sz);
	}
}

void CAnimationSet::DestroyAnimationSet()
{
	int nBound = m_Tree.GetUpperBound();

	for (int i = 0; i <= nBound; i++)
	{
		CUseAnimation* pAnimation = (CUseAnimation*)m_Tree.GetAt(i);
		delete pAnimation;
	}

	m_Tree.RemoveAll();	
	m_nNumAnimation = 0;
	m_pCurrentAnimation = NULL;
}

// SetAnimation
BOOL CAnimationSet::SetAnimation( const CString& strKey )
{
	CString strKeyUpper = strKey;
	strKeyUpper.MakeUpper();

	/*
	if ( m_pCurrentAnimation )
	{
		// if OldAnimation == NewAnimation then DoNothing and Return TRUE;
		if( strKeyUpper == m_pCurrentAnimation->m_strKey )
		{
			return TRUE;
		}
	}
	*/

	CUseAnimation *pAnimation = (CUseAnimation *)m_Tree.GetAtName( strKeyUpper );
	if( pAnimation )
	{
		m_pCurrentAnimation = pAnimation;
		return TRUE;
	}

	return FALSE;
}

BOOL CAnimationSet::SetAnimation( int Index )
{
	// if Debug
	ASSERT( (Index >= 0) && (Index <= m_Tree.GetUpperBound()) );
	
	CUseAnimation *pAnimation = (CUseAnimation *)m_Tree.GetAt( Index );
	if( pAnimation )
	{
		m_pCurrentAnimation = pAnimation;
		return TRUE;
	}

	return FALSE;
}

D3DXVECTOR3 CAnimationSet::GetLocalCenter(float fTime)
{
	if( m_pCurrentAnimation )
	{
		return m_pCurrentAnimation->GetLocalCenter( fTime );
	}
	return cs::v3Zero;
}

float	CAnimationSet::GetRadius(float fTime)
{
	if( m_pCurrentAnimation )
	{
		return m_pCurrentAnimation->GetRadius( fTime );
	}

	return 0.0f;
}

float CAnimationSet::GetCurrentMaxTime()
{
	if( m_pCurrentAnimation )
	{
		return m_pCurrentAnimation->GetMaxTime();
	}
	return 0;
}

float CAnimationSet::GetAnimationMaxtime( const CString& strAnimation )
{
	CString strAniUpper = strAnimation;
	strAniUpper.MakeUpper();
	CUseAnimation *pAnimation = (CUseAnimation *)m_Tree.GetAtName( strAniUpper );

	if( pAnimation )
	{
		return pAnimation->GetMaxTime();
	}

	ASSERT( FALSE );
	return 0.0f;
}

float CAnimationSet::GetAnimationMaxtime( int Index )
{
	// if Debug
	ASSERT( (Index >= 0) && (Index <= m_Tree.GetUpperBound()) );
	CUseAnimation *pAnimation = (CUseAnimation *)m_Tree.GetAt( Index );

	if( pAnimation )
	{
		return pAnimation->GetMaxTime();
	}

	ASSERT( FALSE );
	return 0.0f;
}

CUseAnimation *CAnimationSet::GetCurrentAnimation()
{
	return m_pCurrentAnimation;
}

CUseAnimation *CAnimationSet::GetAnimation( const CString& strAnimation )
{
	CString strAniUpper = strAnimation;
	strAniUpper.MakeUpper();
	CUseAnimation *pAnimation = (CUseAnimation *)m_Tree.GetAtName( strAniUpper );

	return pAnimation;
}

CUseAnimation *CAnimationSet::GetAnimation( int Index )
{
	ASSERT( (Index >= 0) && (Index <= m_Tree.GetUpperBound()) );
	CUseAnimation *pAnimation = (CUseAnimation *)m_Tree.GetAt( Index );	
	return pAnimation;
}

BOOL CAnimationSet::IsHaveAnimation( const CString& strAnimation )
{
	CString strAniUpper = strAnimation;
	strAniUpper.MakeUpper();
	CUseAnimation *pAnimation = (CUseAnimation *)m_Tree.GetAtName( strAniUpper );

	if( pAnimation )
	{
		return TRUE;
	}

	return FALSE;
}

CString CAnimationSet::GetStrCurrentAnimation()
{
	if( m_pCurrentAnimation )
	{
		return m_pCurrentAnimation->m_strKey;
	}

	return "";	
}

CString CAnimationSet::GetStrAnimation( int Index )
{
	ASSERT( (Index >= 0) && (Index <= m_Tree.GetUpperBound()) );
	CUseAnimation *pAnimation = (CUseAnimation *)m_Tree.GetAt( Index );	

	if( m_pCurrentAnimation )
	{
		return pAnimation->m_strKey;
	}

	return "";
}

int CAnimationSet::GetNumFaces()
{
	if( m_pCurrentAnimation )
	{
		return m_pCurrentAnimation->GetNumFaces();
	}
	return 0;
}
int CAnimationSet::GetNumVertices()
{
	if( m_pCurrentAnimation )
	{
		return m_pCurrentAnimation->GetNumVertices();
	}
	return 0;
}

HRESULT CAnimationSet::Render( float fTime )
{
	if( m_pCurrentAnimation )
	{
		m_pCurrentAnimation->Render( fTime );
	}

	return S_OK;
}

BOOL CAnimationSet::RayTest( const D3DXVECTOR3& RayOrigin,
						     const D3DXVECTOR3& RayDirection, 
							 const D3DXMATRIX*  matWorld, 
							 float fTime,
							 BOOL bUseBoundSphereInRayTest,
							 // Out
							 int*       pFaceIndex,
							 CTriangle* pTriangle,
						     FLOAT*	 pDistance, 
							 FLOAT*	 pU, 
							 FLOAT*  pV )
{
	if( m_pCurrentAnimation )
	{
		return m_pCurrentAnimation->RayTest( RayOrigin,
											 RayDirection, 
											 matWorld, 
											 fTime,
											 bUseBoundSphereInRayTest,
											 // Out
											 pFaceIndex,
											 pTriangle,
											 pDistance, 
											 pU, 
											 pV );
	}

	return FALSE;
}

int CAnimationSet::GetNumAnimation()
{
	return m_Tree.GetUpperBound()+1;
}




