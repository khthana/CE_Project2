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
#include "vertices.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif


/////////////////////////////////////////////////////////////////////
// Class CVerticesManage
/////////////////////////////////////////////////////////////////////

// static variable for class CVerticesManage
CAbTree CVerticesManage::AbTree;

float* CVerticesManage::Add( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CVertices * pVertices = (CVertices *)AbTree.GetAtName(strName);


	if (pVertices == NULL)
	{
		pVertices = new CVertices(strName);
		
		pVertices->AddVertices();
		AbTree.Add(pVertices);
	}
	else
	{
		pVertices->AddVertices();
	}

	return pVertices->GetVertices();
}

float* CVerticesManage::GetVertices( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CVertices * pVertices = (CVertices *)AbTree.GetAtName(strName);

	if (pVertices == NULL)
	{
		return NULL;
	}
	else
	{
		return pVertices->GetVertices();
	}
}

CVertices *  CVerticesManage::GetpVertices( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CVertices * pVertices = (CVertices *)AbTree.GetAtName(strName);

	if (pVertices == NULL)
	{
		return NULL;
	}
	else
	{
		return pVertices;
	}
}

void CVerticesManage::Remove( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CVertices * pVertices = (CVertices *)AbTree.GetAtName(strName);
	
	if (pVertices!=NULL)
	{
		if (pVertices->DeleteVertices()==0)
		{
			delete AbTree.RemoveAtName(strName);
		}
	}
}

void CVerticesManage::StaticInitDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CVertices *)AbTree.GetAt(nCount))->InitDeviceObjects();
	}
}

void CVerticesManage::StaticDeleteDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CVertices *)AbTree.GetAt(nCount))->DeleteDeviceObjects();
	}
}

void CVerticesManage::StaticFinalCleanUp()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
			CVertices * pVertices = (CVertices *)AbTree.GetAt(nCount);
			pVertices->DeleteDeviceObjects();
			pVertices->FinalCleanup();
			delete pVertices;
	}
	AbTree.RemoveAll();
}

/////////////////////////////////////////////////////////////////////
// Class CVertices
/////////////////////////////////////////////////////////////////////

CVertices::CVertices(const CString& strName)  //Constructor
{
	m_nNumber = 0;
	m_Vertices = NULL;
	m_strKey = strName;
}

CVertices::~CVertices() //Destructor
{
		CVertices::DeleteDeviceObjects();
		CVertices::FinalCleanup();
}

BOOL CVertices::AddVertices()
{	
	m_nNumber++;

	if ( (m_nNumber == 1 )  )
	{
		//DO load temp from string(m_strKey);
		CVertices::OneTimeSceneInit();

		if ( GLGfx::IsGLPrompt() )
		{
			CVertices::InitDeviceObjects();
		}
	}

	return TRUE;
}

int CVertices::DeleteVertices()
{
 
	if ( m_nNumber == 1 )
	{
		CVertices::DeleteDeviceObjects();
		CVertices::FinalCleanup();

		m_nNumber--;
	}
	else if ( m_nNumber > 1)
	{
		m_nNumber--;
	}

	return m_nNumber;
}


HRESULT CVertices::InitDeviceObjects()
{
	DeleteDeviceObjects();

	if ( (m_nNumber > 0) && (GLGfx::IsGLPrompt() ) )
	{
		CVertices::_InitDevice();
	}

	return S_OK;
}

HRESULT CVertices::DeleteDeviceObjects()
{
	if (m_nNumber > 0)
	{		
		CVertices::_DeleteDevice();
	}
	return S_OK;
}

HRESULT CVertices::OneTimeSceneInit()
{
	if (m_nNumber > 0)
	{		
		CVertices::_OneTime();
	}
	return S_OK;
}

HRESULT CVertices::FinalCleanup()
{
	if (m_nNumber > 0)
	{		
		CVertices::_FinalClean();
	}
	return S_OK;
}
