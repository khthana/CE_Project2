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


#pragma once

#include <d3d8.h>			// Header File For The Direct3D8 Library

#include <gl\gl.h>			// Header File For The OpenGL32 Library
#include <gl\glu.h>			// Header File For The GLu32 Library
#include <gl\glaux.h>		// Header File For The Glaux Library

#include "Abtree.h"			// Header File For Use CAbtree
#include "Abstract.h"		// Header File For Use CAbstact
#include "GLGfx.h"          // Header File For Use CGLGfx  (check InitDeviceObjects promt )

#include "Multidetaildata.h"

/////////////////////////////////////////////////////////////////////////////
//	User Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class		CUseMultiDetailData
//
//	Function		CUseMultiDetailData.Use(const CString& strFileName);
//	Function		CUseMultiDetailData.UnUse();
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//	User static Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class	CMultiDetailDataManage
//
//	Static Function CMultiDetailDataManage::StaticInitDeviceObject();
//	Static Function CMultiDetailDataManage::StaticDeleteDeviceObject();
//	Static Function CMultiDetailDataManage::StaticFinalCleanUp();
//
/////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////
// Private for code only ( not access )
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// Class CMultiDetailData
/////////////////////////////////////////////////////////////////////

class CMultiDetailDataAb : public CAbstract  
{
private:
	CMultiDetailData * m_CMultiDetailData;
	int  m_nNumber;

	//function to implement
	void _OneTime()
	{
		//Do Create data from  member "m_strKey" to "m_CMultiDetailData"
		m_CMultiDetailData = new CMultiDetailData;
		m_CMultiDetailData->LoadMultiDetailModel(m_strKey);
	}

	void _FinalClean()
	{
		//Do Delete data from "m_CMultiDetailData"
		//don't forget set m_CMultiDetailData to NULL if it is Pointer
		if ( m_CMultiDetailData != NULL )
		{
			m_CMultiDetailData->ClearModel();
			delete m_CMultiDetailData;
			m_CMultiDetailData = NULL;
		}
	}
	
	void _InitDevice()
	{
		//Do Create data from  member "m_strKey" to "m_CMultiDetailData"
	}

	void _DeleteDevice()
	{
		//Do Delete data from "m_CMultiDetailData"
		//don't forget set m_CMultiDetailData to NULL if it is Pointer
	}

public:
	CMultiDetailDataAb(const CString& strName);
	virtual ~CMultiDetailDataAb();

public:
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT FinalCleanup();

	int		DeleteCMultiDetailData();
	BOOL	AddCMultiDetailData();
	
	CMultiDetailData * GetCMultiDetailData() { return (m_nNumber>0)?m_CMultiDetailData:0; }
};

/////////////////////////////////////////////////////////////////////
// Class CMultiDetailDataManage
/////////////////////////////////////////////////////////////////////
class CMultiDetailDataManage 
{
private :
	static CAbTree AbTree;

public:

	// Static for Implementation this Class
	static void StaticInitDeviceObjects();
	static void StaticDeleteDeviceObjects();
	static void StaticFinalCleanUp();

	static int GetSize(){return AbTree.GetSize();}

private:
	// User Interface
	static CMultiDetailData * Add( const CString& pName );
	static CMultiDetailData * GetCMultiDetailData( const CString& pName );
	static CMultiDetailDataAb *	GetpCMultiDetailData( const CString& pName );
	static void Remove( const CString& pName );

	friend class CUseMultiDetailData;

};



/////////////////////////////////////////////////////////////////////
// Class CUseMultiDetailData 
// Desc : User interface class
/////////////////////////////////////////////////////////////////////
class CUseMultiDetailData
{
public:
	CUseMultiDetailData() { m_bCreate = FALSE; pCMultiDetailData = NULL; }
	CUseMultiDetailData( const CString& pName ) { m_bCreate = FALSE; pCMultiDetailData = NULL; Use(pName); }
	~CUseMultiDetailData() { UnUse(); }

private :
	CString m_strKey;
	BOOL m_bCreate;
	CMultiDetailDataAb * pCMultiDetailData;

public:

	void UnUse()
	{
		if ( m_bCreate )
		{
			m_bCreate = FALSE;
			CMultiDetailDataManage::Remove(m_strKey);
		}
		m_strKey.Empty();
		pCMultiDetailData = NULL;
	}

	void Use(const CString& pName)
	{
		if (pName.IsEmpty()) return; // check error

		if ( m_bCreate )
		{
			if (pName == m_strKey) return;

			CMultiDetailDataManage::Add(pName);
			CMultiDetailDataManage::Remove(m_strKey);

			m_strKey = pName;					
			pCMultiDetailData = CMultiDetailDataManage::GetpCMultiDetailData(m_strKey);
		}
		else
		{

			m_bCreate = TRUE;
			m_strKey = pName;

			CMultiDetailDataManage::Add(m_strKey);
			pCMultiDetailData = CMultiDetailDataManage::GetpCMultiDetailData(m_strKey);
		}
	}

	CMultiDetailData * Get()
	{
		return ( pCMultiDetailData != NULL ) ? pCMultiDetailData->GetCMultiDetailData():NULL;
	}

};

