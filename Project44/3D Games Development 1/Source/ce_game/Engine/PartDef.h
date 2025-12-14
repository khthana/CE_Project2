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
#include "Util.h"

/////////////////////////////////////////////////////////////////////////////
//	User Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class		CUsePartDef
//
//	Function		CUsePartDef.Use(const CString strFileName);
//	Function		CUsePartDef.UnUse();
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//	User static Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class	CPartDefManage
//
//	Static Function CPartDefManage::StaticInitDeviceObject();
//	Static Function CPartDefManage::StaticDeleteDeviceObject();
//	Static Function CPartDefManage::StaticFinalCleanUp();
//
/////////////////////////////////////////////////////////////////////////////

class CPartData : public CObject  
{
public:
	CPartData();
	virtual ~CPartData();

private:
	CStringArray m_arrNamePart; // String
	int		m_nUpperBound;      // Max Face Index
	int  *  m_pnIndex;          // Array Indexed by Face Index 

	// Status 
	BOOL    m_bPrompt;


private:
	void LoadPartDefine( const char* strFileName );
	void Destroy();

	BOOL IsPrompt() const { return m_bPrompt; };

friend class CPartDef;
friend class CUsePartDef;
};



/////////////////////////////////////////////////////////////////////////////
// Private for code only ( not access )
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// Class CPartDef
/////////////////////////////////////////////////////////////////////

class CPartDef : public CAbstract  
{
private:
	CPartData * m_PartDef;
	int  m_nNumber;

	//function to implement
	void _OneTime()
	{
		//Do Create data from  member "m_strKey" to "m_PartDef"
		m_PartDef = new CPartData;
		m_PartDef->LoadPartDefine( m_strKey );		
	}

	void _FinalClean()
	{
		//Do Delete data from "m_PartDef"
		//don't forget set m_PartDef to NULL if it is Pointer
		if ( m_PartDef != NULL )
		{
			SAFE_DELETE( m_PartDef );
		}
	}
	
	void _InitDevice()
	{
		//Do Create data from  member "m_strKey" to "m_PartDef"
	}

	void _DeleteDevice()
	{
		//Do Delete data from "m_PartDef"
		//don't forget set m_PartDef to NULL if it is Pointer
	}

public:
	CPartDef(const CString strName);
	virtual ~CPartDef();

public:
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT FinalCleanup();

	int		DeletePartDef();
	BOOL	AddPartDef();
	
	CPartData * GetPartDef() { return (m_nNumber>0)?m_PartDef:0; }
};

/////////////////////////////////////////////////////////////////////
// Class CPartDefManage
/////////////////////////////////////////////////////////////////////
class CPartDefManage 
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
	static CPartData * Add( const CString& pName );
	static CPartData * GetPartDef( const CString& pName );
	static CPartDef  *	GetpPartDef( const CString& pName );
	static void Remove( const CString& pName );

	friend class CUsePartDef;

};



/////////////////////////////////////////////////////////////////////
// Class CUsePartDef 
// Desc : User interface class
/////////////////////////////////////////////////////////////////////
class CUsePartDef
{
public:
	CUsePartDef() { m_bCreate = FALSE; pPartDef = NULL; }
	CUsePartDef( const CString pName ) { m_bCreate = FALSE; pPartDef = NULL; Use(pName); }
	~CUsePartDef() { UnUse(); }

private :
	CString m_strKey;
	BOOL m_bCreate;
	CPartDef * pPartDef;

public:

	void UnUse()
	{
		if ( m_bCreate )
		{
			m_bCreate = FALSE;
			CPartDefManage::Remove(m_strKey);
		}
		m_strKey.Empty();
		pPartDef = NULL;
	}

	void Use(const CString pName)
	{
		if (pName.IsEmpty()) return; // check error

		if ( m_bCreate )
		{
			if (pName == m_strKey) return;

			CPartDefManage::Add(pName);
			CPartDefManage::Remove(m_strKey);

			m_strKey = pName;					
			pPartDef = CPartDefManage::GetpPartDef(m_strKey);
		}
		else
		{

			m_bCreate = TRUE;
			m_strKey = pName;

			CPartDefManage::Add(m_strKey);
			pPartDef = CPartDefManage::GetpPartDef(m_strKey);
		}
	}

private:
	CPartData * Get()
	{
		return ( pPartDef != NULL ) ? pPartDef->GetPartDef():NULL;
	}

public:
	CString GetPart( int FaceIndex )
	{
		CPartData *pPartData = Get();
		if( pPartData )
		{
			if( pPartData->IsPrompt() )
			{
				if( (FaceIndex >= 0) && (FaceIndex <= pPartData->m_nUpperBound) )
				{
					return pPartData->m_arrNamePart.GetAt( pPartData->m_pnIndex[FaceIndex] );
				}
			}
		}

		return "";
	}
};

