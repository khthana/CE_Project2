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
#include "TexCoord.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif




/////////////////////////////////////////////////////////////////////
// Class CTexCoordManage
/////////////////////////////////////////////////////////////////////

// static variable for class CTexCoordManage
CAbTree CTexCoordManage::AbTree;

float* CTexCoordManage::Add( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CTexCoord * pTexCoord = (CTexCoord *)AbTree.GetAtName(strName);


	if (pTexCoord == NULL)
	{
		pTexCoord = new CTexCoord(strName);
		
		pTexCoord->AddTexCoord();
		AbTree.Add(pTexCoord);
	}
	else
	{
		pTexCoord->AddTexCoord();
	}

	return pTexCoord->GetTexCoord();
}

float* CTexCoordManage::GetTexCoord( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CTexCoord * pTexCoord = (CTexCoord *)AbTree.GetAtName(strName);

	if (pTexCoord == NULL)
	{
		return NULL;
	}
	else
	{
		return pTexCoord->GetTexCoord();
	}
}

CTexCoord *  CTexCoordManage::GetpTexCoord( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CTexCoord * pTexCoord = (CTexCoord *)AbTree.GetAtName(strName);

	if (pTexCoord == NULL)
	{
		return NULL;
	}
	else
	{
		return pTexCoord;
	}
}

void CTexCoordManage::Remove( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CTexCoord * pTexCoord = (CTexCoord *)AbTree.GetAtName(strName);
	
	if (pTexCoord!=NULL)
	{
		if (pTexCoord->DeleteTexCoord()==0)
		{
			delete AbTree.RemoveAtName(strName);
		}
	}
}

void CTexCoordManage::StaticInitDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CTexCoord *)AbTree.GetAt(nCount))->InitDeviceObjects();
	}
}

void CTexCoordManage::StaticDeleteDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CTexCoord *)AbTree.GetAt(nCount))->DeleteDeviceObjects();
	}
}

void CTexCoordManage::StaticFinalCleanUp()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
			CTexCoord * pTexCoord = (CTexCoord *)AbTree.GetAt(nCount);
			pTexCoord->DeleteDeviceObjects();
			pTexCoord->FinalCleanup();
			delete pTexCoord;
	}
	AbTree.RemoveAll();
}

/////////////////////////////////////////////////////////////////////
// Class CTexCoord
/////////////////////////////////////////////////////////////////////

CTexCoord::CTexCoord(const CString& strName)  //Constructor
{
	m_nNumber = 0;
	m_TexCoord = NULL;
	m_strKey = strName;
}

CTexCoord::~CTexCoord() //Destructor
{
		CTexCoord::DeleteDeviceObjects();
		CTexCoord::FinalCleanup();
}

BOOL CTexCoord::AddTexCoord()
{	
	m_nNumber++;

	if ( (m_nNumber == 1 )  )
	{
		//DO load temp from string(m_strKey);
		CTexCoord::OneTimeSceneInit();

		if ( GLGfx::IsGLPrompt() )
		{
			CTexCoord::InitDeviceObjects();
		}
	}

	return TRUE;
}

int CTexCoord::DeleteTexCoord()
{
 
	if ( m_nNumber == 1 )
	{
		CTexCoord::DeleteDeviceObjects();
		CTexCoord::FinalCleanup();

		m_nNumber--;
	}
	else if ( m_nNumber > 1)
	{
		m_nNumber--;
	}

	return m_nNumber;
}



HRESULT CTexCoord::InitDeviceObjects()
{
	DeleteDeviceObjects();

	if ( (m_nNumber > 0) && (GLGfx::IsGLPrompt() ) )
	{
		CTexCoord::_InitDevice();
	}

	return S_OK;
}

HRESULT CTexCoord::DeleteDeviceObjects()
{
	if (m_nNumber > 0)
	{		
		CTexCoord::_DeleteDevice();
	}
	return S_OK;
}

HRESULT CTexCoord::OneTimeSceneInit()
{
	if (m_nNumber > 0)
	{		
		CTexCoord::_OneTime();
	}
	return S_OK;
}

HRESULT CTexCoord::FinalCleanup()
{
	if (m_nNumber > 0)
	{		
		CTexCoord::_FinalClean();
	}
	return S_OK;
}
