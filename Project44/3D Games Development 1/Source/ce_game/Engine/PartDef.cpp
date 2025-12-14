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
#include "PartDef.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif




/////////////////////////////////////////////////////////////////////
// Class CPartDefManage
/////////////////////////////////////////////////////////////////////

// static variable for class CPartDefManage
CAbTree CPartDefManage::AbTree;

CPartData * CPartDefManage::Add( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CPartDef * pPartDef = (CPartDef *)AbTree.GetAtName(strName);


	if (pPartDef == NULL)
	{
		pPartDef = new CPartDef(strName);
		
		pPartDef->AddPartDef();
		AbTree.Add(pPartDef);
	}
	else
	{
		pPartDef->AddPartDef();
	}

	return pPartDef->GetPartDef();
}

CPartData * CPartDefManage::GetPartDef( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CPartDef * pPartDef = (CPartDef *)AbTree.GetAtName(strName);

	if (pPartDef == NULL)
	{
		return NULL;
	}
	else
	{
		return pPartDef->GetPartDef();
	}
}

CPartDef *  CPartDefManage::GetpPartDef( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CPartDef * pPartDef = (CPartDef *)AbTree.GetAtName(strName);

	if (pPartDef == NULL)
	{
		return NULL;
	}
	else
	{
		return pPartDef;
	}
}

void CPartDefManage::Remove( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CPartDef * pPartDef = (CPartDef *)AbTree.GetAtName(strName);
	
	if (pPartDef!=NULL)
	{
		if (pPartDef->DeletePartDef()==0)
		{
			delete AbTree.RemoveAtName(strName);
		}
	}
}

void CPartDefManage::StaticInitDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CPartDef *)AbTree.GetAt(nCount))->InitDeviceObjects();
	}
}

void CPartDefManage::StaticDeleteDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CPartDef *)AbTree.GetAt(nCount))->DeleteDeviceObjects();
	}
}

void CPartDefManage::StaticFinalCleanUp()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
			CPartDef * pPartDef = (CPartDef *)AbTree.GetAt(nCount);
			pPartDef->DeleteDeviceObjects();
			pPartDef->FinalCleanup();
			delete pPartDef;
	}
	AbTree.RemoveAll();
}

/////////////////////////////////////////////////////////////////////
// Class CPartDef
/////////////////////////////////////////////////////////////////////

CPartDef::CPartDef(const CString strName)  //Constructor
{
	m_nNumber = 0;
	m_PartDef = NULL;
	m_strKey  = strName;
}

CPartDef::~CPartDef() //Destructor
{
	CPartDef::DeleteDeviceObjects();
	CPartDef::FinalCleanup();
}

BOOL CPartDef::AddPartDef()
{	
	m_nNumber++;

	if ( (m_nNumber == 1 )  )
	{
		//DO load PartDef from string(m_strKey);
		CPartDef::OneTimeSceneInit();

		if ( GLGfx::IsGLPrompt() )
		{
			CPartDef::InitDeviceObjects();
		}
	}

	return TRUE;
}

int CPartDef::DeletePartDef()
{
 
	if ( m_nNumber == 1 )
	{
		CPartDef::DeleteDeviceObjects();
		CPartDef::FinalCleanup();

		m_nNumber--;
	}
	else if ( m_nNumber > 1)
	{
		m_nNumber--;
	}

	return m_nNumber;
}



HRESULT CPartDef::InitDeviceObjects()
{
	DeleteDeviceObjects();

	if ( (m_nNumber > 0) && (GLGfx::IsGLPrompt() ) )
	{
		CPartDef::_InitDevice();
	}

	return S_OK;
}

HRESULT CPartDef::DeleteDeviceObjects()
{
	if (m_nNumber > 0)
	{		
		CPartDef::_DeleteDevice();
	}
	return S_OK;
}

HRESULT CPartDef::OneTimeSceneInit()
{
	if (m_nNumber > 0)
	{		
		CPartDef::_OneTime();
	}
	return S_OK;
}

HRESULT CPartDef::FinalCleanup()
{
	if (m_nNumber > 0)
	{		
		CPartDef::_FinalClean();
	}
	return S_OK;
}

// CPart Data
CPartData::CPartData()
{
	m_nUpperBound = -1;
	m_pnIndex     = NULL;
	m_bPrompt     = FALSE;
}

CPartData::~CPartData()
{
	Destroy();
}

//////////////////////////////////////////////////////////////////////
// Name : LoadPartDefine
// Desc : Load part from file
//////////////////////////////////////////////////////////////////////
void CPartData::LoadPartDefine( const char* strFileName )
{
	Destroy();

	CStdioFile file1( strFileName, CFile::modeRead );
	while (!feof(file1.m_pStream))
	{	
		CString str;
		file1.ReadString( str );
		
		//m_arrNamePart.Add(sz);

		file1.ReadString( str );
		while ( str != "}" )
		{
			//m_arrIndex.Add( atoi( sz ) );
			int nX = atoi(str);
			
			if (nX > m_nUpperBound ) m_nUpperBound = nX;

			file1.ReadString( str );
		}
		
	}

	file1.Close();

	if ( m_nUpperBound < 0  ) return;

	CStdioFile file2( strFileName, CFile::modeRead );

	m_pnIndex = new int[m_nUpperBound+1];
	for( int i=0; i <= m_nUpperBound; i++ )
	{
		m_pnIndex[i] = -1;
	}

	while (!feof(file2.m_pStream))
	{	
		CString str;
		file2.ReadString( str );
		m_arrNamePart.Add( str );
		file2.ReadString( str );
		while ( str != "}" )
		{
			//m_arrIndex.Add( atoi( sz ) );
			m_pnIndex[ atoi(str) ] = m_arrNamePart.GetUpperBound();
			
			file2.ReadString( str );
		}
	}
	
	file2.Close();
	m_bPrompt = TRUE;
	
}

void CPartData::Destroy()
{
	if( IsPrompt() )
	{
		m_arrNamePart.RemoveAll();
		m_nUpperBound = -1;
		SAFE_DELETE_ARRAY( m_pnIndex );

		// Status 
		m_bPrompt     = FALSE;	
	}
}
