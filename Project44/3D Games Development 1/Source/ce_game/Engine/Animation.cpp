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
#include "Animation.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif




/////////////////////////////////////////////////////////////////////
// Class CAnimationManage
/////////////////////////////////////////////////////////////////////

// static variable for class CAnimationManage
CAbTree CAnimationManage::AbTree;

CAnimation * CAnimationManage::Add( const CString& pName)
{
	CString strName = pName;
	strName.MakeUpper();

	CAnimationAb * pAnimation = (CAnimationAb *)AbTree.GetAtName(strName);


	if (pAnimation == NULL)
	{
		pAnimation = new CAnimationAb(strName);
		
		pAnimation->AddAnimation();
		AbTree.Add(pAnimation);
	}
	else
	{
		pAnimation->AddAnimation();
	}

	return pAnimation->GetAnimation();
}

CAnimation * CAnimationManage::GetAnimation( const CString& pName)
{
	CString strName = pName;
	strName.MakeUpper();

	CAnimationAb * pAnimation = (CAnimationAb *)AbTree.GetAtName(strName);

	if (pAnimation == NULL)
	{
		return NULL;
	}
	else
	{
		return pAnimation->GetAnimation();
	}
}

CAnimationAb *  CAnimationManage::GetpAnimation( const CString& pName)
{
	CString strName = pName;
	strName.MakeUpper();

	CAnimationAb * pAnimation = (CAnimationAb *)AbTree.GetAtName(strName);

	if (pAnimation == NULL)
	{
		return NULL;
	}
	else
	{
		return pAnimation;
	}
}

void CAnimationManage::Remove( const CString& pName)
{
	CString strName = pName;
	strName.MakeUpper();

	CAnimationAb * pAnimation = (CAnimationAb *)AbTree.GetAtName(strName);
	
	if (pAnimation!=NULL)
	{
		if (pAnimation->DeleteAnimation()==0)
		{
			delete AbTree.RemoveAtName(strName);
		}
	}
}

void CAnimationManage::StaticInitDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CAnimationAb *)AbTree.GetAt(nCount))->InitDeviceObjects();
	}
}

void CAnimationManage::StaticDeleteDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CAnimationAb *)AbTree.GetAt(nCount))->DeleteDeviceObjects();
	}
}

void CAnimationManage::StaticFinalCleanUp()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
			CAnimationAb * pAnimation = (CAnimationAb *)AbTree.GetAt(nCount);
			pAnimation->DeleteDeviceObjects();
			pAnimation->FinalCleanup();
			delete pAnimation;
	}
	AbTree.RemoveAll();
}

/////////////////////////////////////////////////////////////////////
// Class CAnimation
/////////////////////////////////////////////////////////////////////

CAnimationAb::CAnimationAb( const CString& strName )  //Constructor
{
	m_nNumber = 0;
	m_Animation = NULL;
	m_strKey = strName;
}

CAnimationAb::~CAnimationAb() //Destructor
{
		CAnimationAb::DeleteDeviceObjects();
		CAnimationAb::FinalCleanup();
}

BOOL CAnimationAb::AddAnimation()
{	
	m_nNumber++;

	if ( (m_nNumber == 1 )  )
	{
		//DO load temp from string(m_strKey);
		CAnimationAb::OneTimeSceneInit();

		if ( GLGfx::IsGLPrompt() )
		{
			CAnimationAb::InitDeviceObjects();
		}
	}

	return TRUE;
}

int CAnimationAb::DeleteAnimation()
{
 
	if ( m_nNumber == 1 )
	{
		CAnimationAb::DeleteDeviceObjects();
		CAnimationAb::FinalCleanup();

		m_nNumber--;
	}
	else if ( m_nNumber > 1)
	{
		m_nNumber--;
	}

	return m_nNumber;
}



HRESULT CAnimationAb::InitDeviceObjects()
{
	DeleteDeviceObjects();

	if ( (m_nNumber > 0) && (GLGfx::IsGLPrompt() ) )
	{
		CAnimationAb::_InitDevice();
	}

	return S_OK;
}

HRESULT CAnimationAb::DeleteDeviceObjects()
{
	if (m_nNumber > 0)
	{		
		CAnimationAb::_DeleteDevice();
	}
	return S_OK;
}

HRESULT CAnimationAb::OneTimeSceneInit()
{
	if (m_nNumber > 0)
	{		
		CAnimationAb::_OneTime();
	}
	return S_OK;
}

HRESULT CAnimationAb::FinalCleanup()
{
	if (m_nNumber > 0)
	{		
		CAnimationAb::_FinalClean();
	}
	return S_OK;
}
