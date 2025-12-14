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
#include "UseMultidetailData.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif




/////////////////////////////////////////////////////////////////////
// Class CMultiDetailDataManage
/////////////////////////////////////////////////////////////////////

// static variable for class CMultiDetailDataManage
CAbTree CMultiDetailDataManage::AbTree;

CMultiDetailData * CMultiDetailDataManage::Add( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CMultiDetailDataAb * pCMultiDetailData = (CMultiDetailDataAb *)AbTree.GetAtName(strName);


	if (pCMultiDetailData == NULL)
	{
		pCMultiDetailData = new CMultiDetailDataAb(strName);
		
		pCMultiDetailData->AddCMultiDetailData();
		AbTree.Add(pCMultiDetailData);
	}
	else
	{
		pCMultiDetailData->AddCMultiDetailData();
	}

	return pCMultiDetailData->GetCMultiDetailData();
}

CMultiDetailData * CMultiDetailDataManage::GetCMultiDetailData( const CString& pName)
{
	CString strName = pName;
	strName.MakeUpper();

	CMultiDetailDataAb * pCMultiDetailData = (CMultiDetailDataAb *)AbTree.GetAtName(strName);

	if (pCMultiDetailData == NULL)
	{
		return NULL;
	}
	else
	{
		return pCMultiDetailData->GetCMultiDetailData();
	}
}

CMultiDetailDataAb *  CMultiDetailDataManage::GetpCMultiDetailData( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CMultiDetailDataAb * pCMultiDetailData = (CMultiDetailDataAb *)AbTree.GetAtName(strName);

	if (pCMultiDetailData == NULL)
	{
		return NULL;
	}
	else
	{
		return pCMultiDetailData;
	}
}

void CMultiDetailDataManage::Remove( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CMultiDetailDataAb * pCMultiDetailData = (CMultiDetailDataAb *)AbTree.GetAtName(strName);
	
	if (pCMultiDetailData!=NULL)
	{
		if (pCMultiDetailData->DeleteCMultiDetailData()==0)
		{
			delete AbTree.RemoveAtName(strName);
		}
	}
}

void CMultiDetailDataManage::StaticInitDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CMultiDetailDataAb *)AbTree.GetAt(nCount))->InitDeviceObjects();
	}
}

void CMultiDetailDataManage::StaticDeleteDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CMultiDetailDataAb *)AbTree.GetAt(nCount))->DeleteDeviceObjects();
	}
}

void CMultiDetailDataManage::StaticFinalCleanUp()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
			CMultiDetailDataAb * pCMultiDetailData = (CMultiDetailDataAb *)AbTree.GetAt(nCount);
			pCMultiDetailData->DeleteDeviceObjects();
			pCMultiDetailData->FinalCleanup();
			delete pCMultiDetailData;
	}
	AbTree.RemoveAll();
}

/////////////////////////////////////////////////////////////////////
// Class CMultiDetailData
/////////////////////////////////////////////////////////////////////

CMultiDetailDataAb::CMultiDetailDataAb(const CString& strName)  //Constructor
{
	m_nNumber = 0;
	m_CMultiDetailData = NULL;
	m_strKey = strName;
}

CMultiDetailDataAb::~CMultiDetailDataAb() //Destructor
{
		CMultiDetailDataAb::DeleteDeviceObjects();
		CMultiDetailDataAb::FinalCleanup();
}

BOOL CMultiDetailDataAb::AddCMultiDetailData()
{	
	m_nNumber++;

	if ( (m_nNumber == 1 )  )
	{
		//DO load temp from string(m_strKey);
		CMultiDetailDataAb::OneTimeSceneInit();

		if ( GLGfx::IsGLPrompt() )
		{
			CMultiDetailDataAb::InitDeviceObjects();
		}
	}

	return TRUE;
}

int CMultiDetailDataAb::DeleteCMultiDetailData()
{
 
	if ( m_nNumber == 1 )
	{
		CMultiDetailDataAb::DeleteDeviceObjects();
		CMultiDetailDataAb::FinalCleanup();

		m_nNumber--;
	}
	else if ( m_nNumber > 1)
	{
		m_nNumber--;
	}

	return m_nNumber;
}



HRESULT CMultiDetailDataAb::InitDeviceObjects()
{
	DeleteDeviceObjects();

	if ( (m_nNumber > 0) && (GLGfx::IsGLPrompt() ) )
	{
		CMultiDetailDataAb::_InitDevice();
	}

	return S_OK;
}

HRESULT CMultiDetailDataAb::DeleteDeviceObjects()
{
	if (m_nNumber > 0)
	{		
		CMultiDetailDataAb::_DeleteDevice();
	}
	return S_OK;
}

HRESULT CMultiDetailDataAb::OneTimeSceneInit()
{
	if (m_nNumber > 0)
	{		
		CMultiDetailDataAb::_OneTime();
	}
	return S_OK;
}

HRESULT CMultiDetailDataAb::FinalCleanup()
{
	if (m_nNumber > 0)
	{		
		CMultiDetailDataAb::_FinalClean();
	}
	return S_OK;
}
