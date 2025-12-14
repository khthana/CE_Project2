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
#include "Texture.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif




/////////////////////////////////////////////////////////////////////
// Class CTextureManage
/////////////////////////////////////////////////////////////////////

// static variable for class CTextureManage
CAbTree CTextureManage::AbTree;

GLuint CTextureManage::Add( const CString& pName,BOOL bUseMipMap)
{
	CString strName = pName;
	strName.MakeUpper();

	CTexture * pTexture = (CTexture *)AbTree.GetAtName(strName);


	if (pTexture == NULL)
	{
		pTexture = new CTexture(strName,bUseMipMap);
		
		pTexture->AddTexture();
		AbTree.Add(pTexture);
	}
	else
	{
		pTexture->AddTexture();
	}

	return pTexture->GetTexture();
}

GLuint CTextureManage::GetTexture( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CTexture * pTexture = (CTexture *)AbTree.GetAtName(strName);

	if (pTexture == NULL)
	{
		return NULL;
	}
	else
	{
		return pTexture->GetTexture();
	}
}

CTexture *  CTextureManage::GetpTexture( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CTexture * pTexture = (CTexture *)AbTree.GetAtName(strName);

	if (pTexture == NULL)
	{
		return NULL;
	}
	else
	{
		return pTexture;
	}
}

void CTextureManage::Remove( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CTexture * pTexture = (CTexture *)AbTree.GetAtName(strName);
	
	if (pTexture!=NULL)
	{
		if (pTexture->DeleteTexture()==0)
		{
			delete AbTree.RemoveAtName(strName);
		}
	}
}

void CTextureManage::StaticInitDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CTexture *)AbTree.GetAt(nCount))->InitDeviceObjects();
	}
}

void CTextureManage::StaticDeleteDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CTexture *)AbTree.GetAt(nCount))->DeleteDeviceObjects();
	}
}

void CTextureManage::StaticFinalCleanUp()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
			CTexture * pTexture = (CTexture *)AbTree.GetAt(nCount);
			pTexture->DeleteDeviceObjects();
			pTexture->FinalCleanup();
			delete pTexture;
	}
	AbTree.RemoveAll();
}

/////////////////////////////////////////////////////////////////////
// Class CTexture
/////////////////////////////////////////////////////////////////////

CTexture::CTexture(const CString& strName, 
				   BOOL bUseMipMap)  //Constructor
{
	m_nNumber = 0;
	m_Texture = NULL;
	m_strKey = strName;

	m_bUseMipmap = bUseMipMap;
}

CTexture::~CTexture() //Destructor
{
		CTexture::DeleteDeviceObjects();
		CTexture::FinalCleanup();
}

BOOL CTexture::AddTexture()
{	
	m_nNumber++;

	if ( (m_nNumber == 1 )  )
	{
		//DO load temp from string(m_strKey);
		CTexture::OneTimeSceneInit();

		if ( GLGfx::IsGLPrompt() )
		{
			CTexture::InitDeviceObjects();
		}
	}

	return TRUE;
}

int CTexture::DeleteTexture()
{
 
	if ( m_nNumber == 1 )
	{
		CTexture::DeleteDeviceObjects();
		CTexture::FinalCleanup();

		m_nNumber--;
	}
	else if ( m_nNumber > 1)
	{
		m_nNumber--;
	}

	return m_nNumber;
}



HRESULT CTexture::InitDeviceObjects()
{
	DeleteDeviceObjects();

	if ( (m_nNumber > 0) && (GLGfx::IsGLPrompt() ) )
	{
		CTexture::_InitDevice();
	}

	return S_OK;
}

HRESULT CTexture::DeleteDeviceObjects()
{
	if (m_nNumber > 0)
	{		
		CTexture::_DeleteDevice();
	}
	return S_OK;
}

HRESULT CTexture::OneTimeSceneInit()
{

	if (m_nNumber > 0)
	{		
		CTexture::_OneTime();
	}
	return S_OK;
}

HRESULT CTexture::FinalCleanup()
{

	if (m_nNumber > 0)
	{		
		CTexture::_FinalClean();
	}
	return S_OK;
}
