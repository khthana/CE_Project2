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
#include "VertexColor.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif




/////////////////////////////////////////////////////////////////////
// Class CVertexColorManage
/////////////////////////////////////////////////////////////////////

// static variable for class CVertexColorManage
CAbTree CVertexColorManage::AbTree;

float* CVertexColorManage::Add( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CVertexColor * pVertexColor = (CVertexColor *)AbTree.GetAtName(strName);


	if (pVertexColor == NULL)
	{
		pVertexColor = new CVertexColor(strName);
		
		pVertexColor->AddVertexColor();
		AbTree.Add(pVertexColor);
	}
	else
	{
		pVertexColor->AddVertexColor();
	}

	return pVertexColor->GetVertexColor();
}

float* CVertexColorManage::GetVertexColor( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CVertexColor * pVertexColor = (CVertexColor *)AbTree.GetAtName(strName);

	if (pVertexColor == NULL)
	{
		return NULL;
	}
	else
	{
		return pVertexColor->GetVertexColor();
	}
}

CVertexColor *  CVertexColorManage::GetpVertexColor( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CVertexColor * pVertexColor = (CVertexColor *)AbTree.GetAtName(strName);

	if (pVertexColor == NULL)
	{
		return NULL;
	}
	else
	{
		return pVertexColor;
	}
}

void CVertexColorManage::Remove( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CVertexColor * pVertexColor = (CVertexColor *)AbTree.GetAtName(strName);
	
	if (pVertexColor!=NULL)
	{
		if (pVertexColor->DeleteVertexColor()==0)
		{
			delete AbTree.RemoveAtName(strName);
		}
	}
}

void CVertexColorManage::StaticInitDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CVertexColor *)AbTree.GetAt(nCount))->InitDeviceObjects();
	}
}

void CVertexColorManage::StaticDeleteDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CVertexColor *)AbTree.GetAt(nCount))->DeleteDeviceObjects();
	}
}

void CVertexColorManage::StaticFinalCleanUp()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
			CVertexColor * pVertexColor = (CVertexColor *)AbTree.GetAt(nCount);
			pVertexColor->DeleteDeviceObjects();
			pVertexColor->FinalCleanup();
			delete pVertexColor;
	}
	AbTree.RemoveAll();
}

/////////////////////////////////////////////////////////////////////
// Class CVertexColor
/////////////////////////////////////////////////////////////////////

CVertexColor::CVertexColor(const CString& strName)  //Constructor
{
	m_nNumber = 0;
	m_nNumVertexColor = 0;
	m_VertexColor = NULL;
	m_strKey = strName;
}

CVertexColor::~CVertexColor() //Destructor
{
		CVertexColor::DeleteDeviceObjects();
		CVertexColor::FinalCleanup();
}

BOOL CVertexColor::AddVertexColor()
{	
	m_nNumber++;

	if ( (m_nNumber == 1 )  )
	{
		//DO load temp from string(m_strKey);
		CVertexColor::OneTimeSceneInit();

		if ( GLGfx::IsGLPrompt() )
		{
			CVertexColor::InitDeviceObjects();
		}
	}

	return TRUE;
}

int CVertexColor::DeleteVertexColor()
{
 
	if ( m_nNumber == 1 )
	{
		CVertexColor::DeleteDeviceObjects();
		CVertexColor::FinalCleanup();

		m_nNumber--;
	}
	else if ( m_nNumber > 1)
	{
		m_nNumber--;
	}

	return m_nNumber;
}



HRESULT CVertexColor::InitDeviceObjects()
{
	DeleteDeviceObjects();

	if ( (m_nNumber > 0) && (GLGfx::IsGLPrompt() ) )
	{
		CVertexColor::_InitDevice();
	}

	return S_OK;
}

HRESULT CVertexColor::DeleteDeviceObjects()
{
	if (m_nNumber > 0)
	{		
		CVertexColor::_DeleteDevice();
	}
	return S_OK;
}

HRESULT CVertexColor::OneTimeSceneInit()
{
	if (m_nNumber > 0)
	{		
		CVertexColor::_OneTime();
	}
	return S_OK;
}

HRESULT CVertexColor::FinalCleanup()
{
	if (m_nNumber > 0)
	{		
		CVertexColor::_FinalClean();
	}
	return S_OK;
}
