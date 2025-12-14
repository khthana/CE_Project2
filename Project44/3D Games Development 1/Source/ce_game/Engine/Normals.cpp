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
#include "Normals.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif




/////////////////////////////////////////////////////////////////////
// Class CNormalsManage
/////////////////////////////////////////////////////////////////////

// static variable for class CNormalsManage
CAbTree CNormalsManage::AbTree;

float *  CNormalsManage::Add( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CNormalsAb * pNormals = (CNormalsAb *)AbTree.GetAtName(strName);


	if (pNormals == NULL)
	{
		pNormals = new CNormalsAb(strName);
		
		pNormals->AddNormals();
		AbTree.Add(pNormals);
	}
	else
	{
		pNormals->AddNormals();
	}

	return pNormals->GetNormals();
}

float *  CNormalsManage::GetNormals( const CString& pName)
{
	CString strName = pName;
	strName.MakeUpper();

	CNormalsAb * pNormals = (CNormalsAb *)AbTree.GetAtName(strName);

	if (pNormals == NULL)
	{
		return NULL;
	}
	else
	{
		return pNormals->GetNormals();
	}
}

CNormalsAb *  CNormalsManage::GetpNormals( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CNormalsAb * pNormals = (CNormalsAb *)AbTree.GetAtName(strName);

	if (pNormals == NULL)
	{
		return NULL;
	}
	else
	{
		return pNormals;
	}
}

void CNormalsManage::Remove( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CNormalsAb * pNormals = (CNormalsAb *)AbTree.GetAtName(strName);
	
	if (pNormals!=NULL)
	{
		if (pNormals->DeleteNormals()==0)
		{
			delete AbTree.RemoveAtName(strName);
		}
	}
}

void CNormalsManage::StaticInitDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CNormalsAb *)AbTree.GetAt(nCount))->InitDeviceObjects();
	}
}

void CNormalsManage::StaticDeleteDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CNormalsAb *)AbTree.GetAt(nCount))->DeleteDeviceObjects();
	}
}

void CNormalsManage::StaticFinalCleanUp()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
			CNormalsAb * pNormals = (CNormalsAb *)AbTree.GetAt(nCount);
			pNormals->DeleteDeviceObjects();
			pNormals->FinalCleanup();
			delete pNormals;
	}
	AbTree.RemoveAll();
}

/////////////////////////////////////////////////////////////////////
// Class CNormals
/////////////////////////////////////////////////////////////////////

CNormalsAb::CNormalsAb(const CString& strName)  //Constructor
{
	m_nNumber = 0;
	m_Normals = NULL;
	m_strKey = strName;
}

CNormalsAb::~CNormalsAb() //Destructor
{
		CNormalsAb::DeleteDeviceObjects();
		CNormalsAb::FinalCleanup();
}

BOOL CNormalsAb::AddNormals()
{	
	m_nNumber++;

	if ( (m_nNumber == 1 )  )
	{
		//DO load Normals from string(m_strKey);
		CNormalsAb::OneTimeSceneInit();

		if ( GLGfx::IsGLPrompt() )
		{
			CNormalsAb::InitDeviceObjects();
		}
	}

	return TRUE;
}

int CNormalsAb::DeleteNormals()
{
 
	if ( m_nNumber == 1 )
	{
		CNormalsAb::DeleteDeviceObjects();
		CNormalsAb::FinalCleanup();

		m_nNumber--;
	}
	else if ( m_nNumber > 1)
	{
		m_nNumber--;
	}

	return m_nNumber;
}



HRESULT CNormalsAb::InitDeviceObjects()
{
	DeleteDeviceObjects();

	if ( (m_nNumber > 0) && (GLGfx::IsGLPrompt() ) )
	{
		CNormalsAb::_InitDevice();
	}

	return S_OK;
}

HRESULT CNormalsAb::DeleteDeviceObjects()
{
	if (m_nNumber > 0)
	{		
		CNormalsAb::_DeleteDevice();
	}
	return S_OK;
}

HRESULT CNormalsAb::OneTimeSceneInit()
{
	if (m_nNumber > 0)
	{		
		CNormalsAb::_OneTime();
	}
	return S_OK;
}

HRESULT CNormalsAb::FinalCleanup()
{
	if (m_nNumber > 0)
	{		
		CNormalsAb::_FinalClean();
	}
	return S_OK;
}
