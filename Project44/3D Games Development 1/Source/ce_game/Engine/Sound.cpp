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
#include "sound.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif




/////////////////////////////////////////////////////////////////////
// Class CSoundsManage
/////////////////////////////////////////////////////////////////////

// static variable for class CSoundsManage
CAbTree			CSoundsManage::AbTree;
CSoundManager	CSoundsAb::SoundManager;


CSound *  CSoundsManage::Add( const CString& pName , int nBufferSize)
{
	CString strName = pName;
	strName.MakeUpper();

	CSoundsAb * pSounds = (CSoundsAb *)AbTree.GetAtName(strName);


	if (pSounds == NULL)
	{
		pSounds = new CSoundsAb(strName, nBufferSize);
		
		pSounds->AddSounds();
		AbTree.Add(pSounds);
	}
	else
	{
		pSounds->AddSounds();
	}

	return pSounds->GetSounds();
}

CSound *  CSoundsManage::GetSounds( const CString& pName)
{
	CString strName = pName;
	strName.MakeUpper();

	CSoundsAb * pSounds = (CSoundsAb *)AbTree.GetAtName(strName);

	if (pSounds == NULL)
	{
		return NULL;
	}
	else
	{
		return pSounds->GetSounds();
	}
}

CSoundsAb *  CSoundsManage::GetpSounds( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CSoundsAb * pSounds = (CSoundsAb *)AbTree.GetAtName(strName);

	if (pSounds == NULL)
	{
		return NULL;
	}
	else
	{
		return pSounds;
	}
}

void CSoundsManage::Remove( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CSoundsAb * pSounds = (CSoundsAb *)AbTree.GetAtName(strName);
	
	if (pSounds!=NULL)
	{
		if (pSounds->DeleteSounds()==0)
		{
			delete AbTree.RemoveAtName(strName);
		}
	}
}

void CSoundsManage::StaticInitDeviceObjects(HWND hWnd)
{

    if( FAILED(CSoundsAb::SoundManager.Initialize(hWnd, DSSCL_PRIORITY, 2, 22050, 16 ) ) )
    {
        Log("SoundManager.Initialize error !!"); 
		ASSERT(FALSE);
        return;
    }


	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CSoundsAb *)AbTree.GetAt(nCount))->InitDeviceObjects();
	}
}

void CSoundsManage::StaticDeleteDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CSoundsAb *)AbTree.GetAt(nCount))->DeleteDeviceObjects();
	}
}

void CSoundsManage::StaticFinalCleanUp()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
			CSoundsAb * pSounds = (CSoundsAb *)AbTree.GetAt(nCount);
			pSounds->DeleteDeviceObjects();
			pSounds->FinalCleanup();
			delete pSounds;
	}
	AbTree.RemoveAll();
}

/////////////////////////////////////////////////////////////////////
// Class CSounds
/////////////////////////////////////////////////////////////////////

CSoundsAb::CSoundsAb(const CString& strName, int nBufferSize)  //Constructor
{
	m_nNumber = 0;
	m_nBufferSize = nBufferSize;
	m_Sounds = NULL;
	m_strKey = strName;
}

CSoundsAb::~CSoundsAb() //Destructor
{
		CSoundsAb::DeleteDeviceObjects();
		CSoundsAb::FinalCleanup();
}

BOOL CSoundsAb::AddSounds()
{	
	m_nNumber++;

	if ( (m_nNumber == 1 )  )
	{
		//DO load Sounds from string(m_strKey);
		CSoundsAb::OneTimeSceneInit();

		if ( GLGfx::IsGLPrompt() )
		{
			CSoundsAb::InitDeviceObjects();
		}
	}

	return TRUE;
}

int CSoundsAb::DeleteSounds()
{
 
	if ( m_nNumber == 1 )
	{
		CSoundsAb::DeleteDeviceObjects();
		CSoundsAb::FinalCleanup();

		m_nNumber--;
	}
	else if ( m_nNumber > 1)
	{
		m_nNumber--;
	}

	return m_nNumber;
}



HRESULT CSoundsAb::InitDeviceObjects()
{
	DeleteDeviceObjects();

	if ( (m_nNumber > 0) && (GLGfx::IsGLPrompt() ) )
	{
		CSoundsAb::_InitDevice();
	}

	return S_OK;
}

HRESULT CSoundsAb::DeleteDeviceObjects()
{
	if (m_nNumber > 0)
	{		
		CSoundsAb::_DeleteDevice();
	}
	return S_OK;
}

HRESULT CSoundsAb::OneTimeSceneInit()
{
	if (m_nNumber > 0)
	{		
		CSoundsAb::_OneTime();
	}
	return S_OK;
}

HRESULT CSoundsAb::FinalCleanup()
{
	if (m_nNumber > 0)
	{		
		CSoundsAb::_FinalClean();
	}
	return S_OK;
}
