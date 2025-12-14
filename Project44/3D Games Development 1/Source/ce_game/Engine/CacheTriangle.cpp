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
#include "CacheTriangle.h"
#include "Triangle.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CCacheTriangle::CCacheTriangle()
{
	m_ptrList.RemoveAll();
	m_nSize = 0;
}

CCacheTriangle::~CCacheTriangle()
{
	DestroyAll();
}

void CCacheTriangle::DestroyAll()
{
	int nSize  = m_ptrList.GetSize();

	for ( int nCount = 0; nCount < nSize; nCount++ )
	{
		delete ((CTriangle *)m_ptrList.GetAt(nCount));
	}

	m_ptrList.RemoveAll();	
}

void CCacheTriangle::SetCacheSize(int nNewSize)
{
	ASSERT( nNewSize>=0 ); // check size

	int nSize  = m_ptrList.GetSize();
	m_nSize = nNewSize;
	
	if ( nSize > nNewSize )
	{
		for (int nCount = ( nSize - 1 ) ; nCount >= nNewSize ; nCount--)
		{
			delete m_ptrList.GetAt(nCount);
			m_ptrList.RemoveAt(nCount);
		}
	}
	else if ( nSize < nNewSize)
	{
		for ( int nCount  = nSize; nCount < nNewSize; nCount++ )
		{
			CTriangle * pTri = new CTriangle;
			m_ptrList.Add(pTri);
		}
	}

}


BOOL CCacheTriangle::GetHigh1(float X, float Z,float* High )
{

	int nSize  = m_ptrList.GetSize();

	if (nSize <= 0)
	{
		return FALSE;
	}

	for ( int nCount = 0 ; nCount < nSize ; nCount++  )
	{
		CTriangle * pTri = ((CTriangle *) m_ptrList.GetAt( nCount ) );

		if ( pTri->GetHigh(X,Z,High) )
		{
			if ( nCount)
			{
				m_ptrList.RemoveAt(nCount,1);
				m_ptrList.InsertAt(0,pTri);
			}
			return TRUE;
		}
	}

	return FALSE;
}

BOOL CCacheTriangle::GetCurrentTriangle( CTriangle *pTriangle )
{
	ASSERT( m_ptrList.GetSize() >= 0 );
	CTriangle *pTmpTriangle = (CTriangle *)m_ptrList.GetAt( 0 );

	(*pTriangle).SetTriangle( pTmpTriangle->GetV0(),
							  pTmpTriangle->GetV1(),	
							  pTmpTriangle->GetV2() );
	return TRUE;
}

void CCacheTriangle::Add( const D3DXVECTOR3& V0,
						          const D3DXVECTOR3& V1,
		                          const D3DXVECTOR3& V2 )
{
	int nSize  = m_ptrList.GetSize();

	if (nSize > 0)
	{

		CTriangle * pTri = ((CTriangle *) m_ptrList.GetAt( nSize - 1 ) );

		m_ptrList.RemoveAt( nSize - 1 , 1);

		pTri->SetTriangle(V0,V1,V2);

		m_ptrList.InsertAt(0,pTri);
	}
	
}

void CCacheTriangle::Add( const CTriangle& Triangle )
{
	Add( Triangle.GetV0(),
	     Triangle.GetV1(),
		 Triangle.GetV2() );
}