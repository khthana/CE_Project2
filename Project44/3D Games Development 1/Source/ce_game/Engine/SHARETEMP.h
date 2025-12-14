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


/////////////////////////////////////////////////////////////////////////////
// Use This Template for CXXX
/////////////////////////////////////////////////////////////////////////////
//
// 1. Copy and Change SHARETEMP.h , SHARETEMP.cpp to XXX.h , XXX.cpp
//
// 2. Change   #include "SHARETEMP.h"   to    #include "XXX.h"
//
// 3. Replace  Temp   by   XXX  ( option "Match case" )
//
// 4. change int/**/ to type you want
//
// 5. Edit _InitDevice() 
//
// 6. Edit _DeleteDevice() 
//
// 7. Edit _OneTime()
//
// 8. Edit _FinalClean()
//
// 9. insert static function to EngineInterface
//
//	Static Function CTempManage::StaticInitDeviceObjects();
//	Static Function CTempManage::StaticDeleteDeviceObjects();
//	Static Function CTempManage::StaticFinalCleanUps();
//
/////////////////////////////////////////////////////////////////////////////
//  *   Please delete this when finished Edit
/////////////////////////////////////////////////////////////////////////////

#pragma once

#include <d3d8.h>			// Header File For The Direct3D8 Library

#include <gl\gl.h>			// Header File For The OpenGL32 Library
#include <gl\glu.h>			// Header File For The GLu32 Library
#include <gl\glaux.h>		// Header File For The Glaux Library

#include "Abtree.h"			// Header File For Use CAbtree
#include "Abstract.h"		// Header File For Use CAbstact
#include "GLGfx.h"          // Header File For Use CGLGfx  (check InitDeviceObjects promt )


/////////////////////////////////////////////////////////////////////////////
//	User Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class		CUseTemp
//
//	Function		CUseTemp.Use(const CString& strFileName);
//	Function		CUseTemp.UnUse();
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//	User static Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class	CTempManage
//
//	Static Function CTempManage::StaticInitDeviceObject();
//	Static Function CTempManage::StaticDeleteDeviceObject();
//	Static Function CTempManage::StaticFinalCleanUp();
//
/////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////
// Private for code only ( not access )
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// Class CTemp
/////////////////////////////////////////////////////////////////////

class CTempAb : public CAbstract  
{
private:
	int/**/ m_Temp;
	int  m_nNumber;

	//function to implement
	void _OneTime()
	{
		//Do Create data from  member "m_strKey" to "m_Temp"
	}

	void _FinalClean()
	{
		//Do Delete data from "m_Temp"
		//don't forget set m_Temp to NULL if it is Pointer

	}
	
	void _InitDevice()
	{
		//Do Create data from  member "m_strKey" to "m_Temp"
	}

	void _DeleteDevice()
	{
		//Do Delete data from "m_Temp"
		//don't forget set m_Temp to NULL if it is Pointer
	}

public:
	CTempAb(const CString& strName);
	virtual ~CTempAb();

public:
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT FinalCleanup();

	int		DeleteTemp();
	BOOL	AddTemp();
	
	int/**/ GetTemp() { return (m_nNumber>0)?m_Temp:0; }
};

/////////////////////////////////////////////////////////////////////
// Class CTempManage
/////////////////////////////////////////////////////////////////////
class CTempManage 
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
	static int/**/ Add( const CString& pName );
	static int/**/ GetTemp( const CString& pName );
	static CTempAb *	GetpTemp( const CString& pName );
	static void Remove( const CString& pName );

	friend class CUseTemp;

};



/////////////////////////////////////////////////////////////////////
// Class CUseTemp 
// Desc : User interface class
/////////////////////////////////////////////////////////////////////
class CUseTemp
{
public:
	CUseTemp() { m_bCreate = FALSE; pTemp = NULL; }
	CUseTemp( const CString& pName ) { m_bCreate = FALSE; pTemp = NULL; Use(pName); }
	~CUseTemp() { UnUse(); }

private :
	CString m_strKey;
	BOOL m_bCreate;
	CTempAb * pTemp;

public:

	void UnUse()
	{
		if ( m_bCreate )
		{
			m_bCreate = FALSE;
			CTempManage::Remove(m_strKey);
		}
		m_strKey.Empty();
		pTemp = NULL;
	}

	void Use(const CString& pName)
	{
		if (pName.IsEmpty()) return; // check error

		if ( m_bCreate )
		{
			if (pName == m_strKey) return;

			CTempManage::Add(pName);
			CTempManage::Remove(m_strKey);

			m_strKey = pName;					
			pTemp = CTempManage::GetpTemp(m_strKey);
		}
		else
		{

			m_bCreate = TRUE;
			m_strKey = pName;

			CTempManage::Add(m_strKey);
			pTemp = CTempManage::GetpTemp(m_strKey);
		}
	}

	int/**/ Get()
	{
		return ( pTemp != NULL ) ? pTemp->GetTemp():NULL;
	}

};

