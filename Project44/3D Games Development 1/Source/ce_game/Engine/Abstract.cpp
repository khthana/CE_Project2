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
#include "Abstract.h"
#include <D3D8.h>


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


IMPLEMENT_SERIAL(CAbstract,CObject,0)
IMPLEMENT_SERIAL(CAbArray,CObject,0)



//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CAbstract::CAbstract()
{

}

CAbstract::~CAbstract()
{

}



void CAbstract::Serialize( CArchive& ar )
{
	CObject::Serialize(ar);	

	if (ar.IsStoring())
	{
		ar << m_strKey;
	}
	else
	{
		ar >> m_strKey;
	}

}




//=========================================================================
// Name : CAbArray 
// Desc : Class for a group of CAbstract.
//=========================================================================
// Constructor & Destructor
CAbArray::CAbArray()
{
	m_strKey = "Array";
}

CAbArray::~CAbArray()
{
	DeleteAll(); 
}

// Interface
void CAbArray::Add( CAbstract *pAbstract )
{
	m_arData.Add( pAbstract );
}

void CAbArray::InsertAt( int Index, CAbstract *pAbstract)
{
	if( ( Index >= 0 ) && Index <= GetUpperBound() )
	{
		m_arData.InsertAt( Index, pAbstract );
	}
}

void CAbArray::DeleteAt( int Index )
{
	if( ( Index >= 0 ) && Index <= GetUpperBound() )
	{
		delete m_arData.GetAt( Index );
		m_arData.RemoveAt( Index ); 
	}
}

void CAbArray::DeleteAll()
{
	int nBound = m_arData.GetUpperBound();

	for( int i = 0; i <= nBound; i++ )
	{
		delete m_arData.GetAt( i );
	}

	m_arData.RemoveAll();
}

CAbstract *CAbArray::GetAt( int Index )
{
	if( ( Index >= 0 ) && Index <= GetUpperBound() )
	{
		return (CAbstract *) m_arData.GetAt( Index );
	}

	return NULL;
}

int CAbArray::GetUpperBound()
{
	return m_arData.GetUpperBound();
}

// SearchByName
CAbstract *CAbArray::SearchByNameP( const CString &strName )
{
   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		CAbstract *pAbstract = GetAt(i);
		if( strName == pAbstract->m_strKey )
		{
			return pAbstract;	
		}
	}

	return NULL;
}

int CAbArray::SearchByNameI( const CString &strName )
{
   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if( strName == GetAt(i)->m_strKey )
		{
			return i;	
		}
	}

	return -1;
}

void CAbArray::Serialize( CArchive& ar )
{
	CAbstract::Serialize(ar);	
	m_arData.Serialize(ar);	
}

HRESULT CAbArray::OneTimeSceneInit()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED(GetAt(i)->OneTimeSceneInit())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}


HRESULT CAbArray::RestoreDeviceObjects()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED(GetAt(i)->RestoreDeviceObjects())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}

HRESULT CAbArray::InitDeviceObjects()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED(GetAt(i)->InitDeviceObjects())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}

HRESULT CAbArray::FrameMove()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED(GetAt(i)->FrameMove())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}

HRESULT CAbArray::Render()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED(GetAt(i)->Render())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}

HRESULT CAbArray::InvalidateDeviceObjects()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED(GetAt(i)->InvalidateDeviceObjects())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}

HRESULT CAbArray::DeleteDeviceObjects()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED(GetAt(i)->DeleteDeviceObjects())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}

HRESULT CAbArray::FinalCleanup()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED(GetAt(i)->FinalCleanup())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}



/*
    virtual HRESULT ();
    virtual HRESULT ();
    virtual HRESULT ();
    virtual HRESULT ();
    virtual HRESULT ();
    virtual HRESULT ();
    virtual HRESULT ();
*/