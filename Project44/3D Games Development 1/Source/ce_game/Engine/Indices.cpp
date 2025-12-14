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
#include "Indices.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif




/////////////////////////////////////////////////////////////////////
// Class CIndicesManage
/////////////////////////////////////////////////////////////////////

// static variable for class CIndicesManage
CAbTree CIndicesManage::AbTree;

unsigned int* CIndicesManage::Add( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CIndices * pIndices = (CIndices *)AbTree.GetAtName(strName);


	if (pIndices == NULL)
	{
		pIndices = new CIndices(strName);
		
		pIndices->AddIndices();
		AbTree.Add(pIndices);
	}
	else
	{
		pIndices->AddIndices();
	}

	return pIndices->GetIndices();
}

unsigned int* CIndicesManage::GetIndices( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CIndices * pIndices = (CIndices *)AbTree.GetAtName(strName);

	if (pIndices == NULL)
	{
		return NULL;
	}
	else
	{
		return pIndices->GetIndices();
	}
}

CIndices *  CIndicesManage::GetpIndices( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CIndices * pIndices = (CIndices *)AbTree.GetAtName(strName);

	if (pIndices == NULL)
	{
		return NULL;
	}
	else
	{
		return pIndices;
	}
}

void CIndicesManage::Remove( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CIndices * pIndices = (CIndices *)AbTree.GetAtName(strName);
	
	if (pIndices!=NULL)
	{
		if (pIndices->DeleteIndices()==0)
		{
			delete AbTree.RemoveAtName(strName);
		}
	}
}

void CIndicesManage::StaticInitDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CIndices *)AbTree.GetAt(nCount))->InitDeviceObjects();
	}
}

void CIndicesManage::StaticDeleteDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CIndices *)AbTree.GetAt(nCount))->DeleteDeviceObjects();
	}
}

void CIndicesManage::StaticFinalCleanUp()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
			CIndices * pIndices = (CIndices *)AbTree.GetAt(nCount);
			pIndices->DeleteDeviceObjects();
			pIndices->FinalCleanup();
			delete pIndices;
	}
	AbTree.RemoveAll();
}

/////////////////////////////////////////////////////////////////////
// Class CIndices
/////////////////////////////////////////////////////////////////////

CIndices::CIndices( const CString& strName )  //Constructor
{
	m_nNumber = 0;
	m_Indices = NULL;
	m_strKey = strName;
}

CIndices::~CIndices() //Destructor
{
		CIndices::DeleteDeviceObjects();
		CIndices::FinalCleanup();
}

BOOL CIndices::AddIndices()
{	
	m_nNumber++;

	if ( (m_nNumber == 1 )  )
	{
		//DO load temp from string(m_strKey);
		CIndices::OneTimeSceneInit();

		if ( GLGfx::IsGLPrompt() )
		{
			CIndices::InitDeviceObjects();
		}
	}

	return TRUE;
}

int CIndices::DeleteIndices()
{
 
	if ( m_nNumber == 1 )
	{
		CIndices::DeleteDeviceObjects();
		CIndices::FinalCleanup();

		m_nNumber--;
	}
	else if ( m_nNumber > 1)
	{
		m_nNumber--;
	}

	return m_nNumber;
}



HRESULT CIndices::InitDeviceObjects()
{
	DeleteDeviceObjects();

	if ( (m_nNumber > 0) && (GLGfx::IsGLPrompt() ) )
	{
		CIndices::_InitDevice();
	}

	return S_OK;
}

HRESULT CIndices::DeleteDeviceObjects()
{
	if (m_nNumber > 0)
	{		
		CIndices::_DeleteDevice();
	}
	return S_OK;
}

HRESULT CIndices::OneTimeSceneInit()
{
	if (m_nNumber > 0)
	{		
		CIndices::_OneTime();
	}
	return S_OK;
}

HRESULT CIndices::FinalCleanup()
{
	if (m_nNumber > 0)
	{		
		CIndices::_FinalClean();
	}
	return S_OK;
}
