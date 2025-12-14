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
#include "SHARETEMP.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif




/////////////////////////////////////////////////////////////////////
// Class CTempManage
/////////////////////////////////////////////////////////////////////

// static variable for class CTempManage
CAbTree CTempManage::AbTree;

int/**/ CTempManage::Add( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CTempAb * pTemp = (CTempAb *)AbTree.GetAtName(strName);


	if (pTemp == NULL)
	{
		pTemp = new CTempAb(strName);
		
		pTemp->AddTemp();
		AbTree.Add(pTemp);
	}
	else
	{
		pTemp->AddTemp();
	}

	return pTemp->GetTemp();
}

int/**/ CTempManage::GetTemp( const CString& pName)
{
	CString strName = pName;
	strName.MakeUpper();

	CTempAb * pTemp = (CTempAb *)AbTree.GetAtName(strName);

	if (pTemp == NULL)
	{
		return NULL;
	}
	else
	{
		return pTemp->GetTemp();
	}
}

CTempAb *  CTempManage::GetpTemp( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CTempAb * pTemp = (CTempAb *)AbTree.GetAtName(strName);

	if (pTemp == NULL)
	{
		return NULL;
	}
	else
	{
		return pTemp;
	}
}

void CTempManage::Remove( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CTempAb * pTemp = (CTempAb *)AbTree.GetAtName(strName);
	
	if (pTemp!=NULL)
	{
		if (pTemp->DeleteTemp()==0)
		{
			delete AbTree.RemoveAtName(strName);
		}
	}
}

void CTempManage::StaticInitDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CTempAb *)AbTree.GetAt(nCount))->InitDeviceObjects();
	}
}

void CTempManage::StaticDeleteDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CTempAb *)AbTree.GetAt(nCount))->DeleteDeviceObjects();
	}
}

void CTempManage::StaticFinalCleanUp()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
			CTempAb * pTemp = (CTempAb *)AbTree.GetAt(nCount);
			pTemp->DeleteDeviceObjects();
			pTemp->FinalCleanup();
			delete pTemp;
	}
	AbTree.RemoveAll();
}

/////////////////////////////////////////////////////////////////////
// Class CTemp
/////////////////////////////////////////////////////////////////////

CTempAb::CTempAb(const CString& strName)  //Constructor
{
	m_nNumber = 0;
	m_Temp = NULL;
	m_strKey = strName;
}

CTempAb::~CTempAb() //Destructor
{
		CTempAb::DeleteDeviceObjects();
		CTempAb::FinalCleanup();
}

BOOL CTempAb::AddTemp()
{	
	m_nNumber++;

	if ( (m_nNumber == 1 )  )
	{
		//DO load temp from string(m_strKey);
		CTempAb::OneTimeSceneInit();

		if ( GLGfx::IsGLPrompt() )
		{
			CTempAb::InitDeviceObjects();
		}
	}

	return TRUE;
}

int CTempAb::DeleteTemp()
{
 
	if ( m_nNumber == 1 )
	{
		CTempAb::DeleteDeviceObjects();
		CTempAb::FinalCleanup();

		m_nNumber--;
	}
	else if ( m_nNumber > 1)
	{
		m_nNumber--;
	}

	return m_nNumber;
}



HRESULT CTempAb::InitDeviceObjects()
{
	DeleteDeviceObjects();

	if ( (m_nNumber > 0) && (GLGfx::IsGLPrompt() ) )
	{
		CTempAb::_InitDevice();
	}

	return S_OK;
}

HRESULT CTempAb::DeleteDeviceObjects()
{
	if (m_nNumber > 0)
	{		
		CTempAb::_DeleteDevice();
	}
	return S_OK;
}

HRESULT CTempAb::OneTimeSceneInit()
{
	if (m_nNumber > 0)
	{		
		CTempAb::_OneTime();
	}
	return S_OK;
}

HRESULT CTempAb::FinalCleanup()
{
	if (m_nNumber > 0)
	{		
		CTempAb::_FinalClean();
	}
	return S_OK;
}
