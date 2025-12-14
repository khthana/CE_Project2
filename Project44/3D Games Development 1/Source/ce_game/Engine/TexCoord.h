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
#include "Logger.h"

/////////////////////////////////////////////////////////////////////////////
//	User Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class		CUseTexCoord
//
//	Function		CUseTexCoord.Use(const CString strFileName);
//	Function		CUseTexCoord.UnUse();
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//	User static Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class	CTexCoordManage
//
//	Static Function CTexCoordManage::StaticInitDeviceObject();
//	Static Function CTexCoordManage::StaticDeleteDeviceObject();
//	Static Function CTexCoordManage::StaticFinalCleanUp();
//
/////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////
// Private for code only ( not access )
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Class CTexCoord
/////////////////////////////////////////////////////////////////////

class CTexCoord : public CAbstract  
{
private:
	float* m_TexCoord;
	int  m_nNumber;

	//function to implement
	void _OneTime()
	{
		//Do Create data from  member "m_strKey" to "m_TexCoord"

		SAFE_DELETE_ARRAY( m_TexCoord );	
		CStdioFile fp( m_strKey, CFile::modeRead );

		if( fp )
		{
			CString str;
			fp.ReadString( str );
			if( strcmp( str, "Maetee Supreanruey and Anusorn Krasantisuk format" ) != 0 )
			{
				char sz[255];
				sprintf(sz,"Error file format name <%s>",m_strKey);
				Log(sz);
				fp.Close();
				return ;
			}

			fp.ReadString( str );
			
			// Read Num Face
			fp.ReadString( str );
			int numFace = atoi( str );

			m_TexCoord = new float[numFace*2];
			for( int i = 0; i < numFace; i++ )
			{
				fp.ReadString( str );
				CString Str1 = String::Token( str, 1, " " );
				CString Str2 = String::Token( str, 2, " " );

				m_TexCoord[ (2*i) + 0 ] = float(atof( Str1 ));
				m_TexCoord[ (2*i) + 1 ] = float(atof( Str2 ));

				//TRACE( "%f ,%f,\n",  m_pTexCoord[ (2*i) + 0 ], m_pTexCoord[ (2*i) + 1 ]);

			}

			fp.Close();
		}
	}

	void _FinalClean()
	{
		//Do Delete data from "m_TexCoord"
		//don't forget set m_TexCoord to NULL if it is Pointer
		SAFE_DELETE_ARRAY( m_TexCoord );
	}
	
	void _InitDevice()
	{
		//Do Create data from  member "m_strKey" to "m_TexCoord"
	}

	void _DeleteDevice()
	{
		//Do Delete data from "m_TexCoord"
		//don't forget set m_TexCoord to NULL if it is Pointer
	}

public:
	CTexCoord(const CString& strName);
	virtual ~CTexCoord();

public:
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT FinalCleanup();

	int		DeleteTexCoord();
	BOOL	AddTexCoord();
	
	float* GetTexCoord() { return (m_nNumber>0)?m_TexCoord:0; }
};

/////////////////////////////////////////////////////////////////////
// Class CTexCoordManage
/////////////////////////////////////////////////////////////////////
class CTexCoordManage 
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
	static float* Add( const CString& pName);
	static float* GetTexCoord( const CString& pName);
	static CTexCoord *	GetpTexCoord( const CString& pName);
	static void Remove( const CString& pName);

	friend class CUseTexCoord;

};



/////////////////////////////////////////////////////////////////////
// Class CUseTexCoord 
// Desc : User interface class
/////////////////////////////////////////////////////////////////////
class CUseTexCoord
{
public:
	CUseTexCoord() { m_bCreate = FALSE; pTexCoord = NULL; }
	CUseTexCoord( const CString& pName ) { m_bCreate = FALSE; pTexCoord = NULL; Use(pName); }
	~CUseTexCoord() { UnUse(); }

private :
	CString m_strKey;
	BOOL m_bCreate;
	CTexCoord * pTexCoord;

public:

	void UnUse()
	{
		if ( m_bCreate )
		{
			m_bCreate = FALSE;
			CTexCoordManage::Remove(m_strKey);
		}
		m_strKey.Empty();
		pTexCoord = NULL;
	}

	void Use(const CString& pName)
	{
		if (pName.IsEmpty()) return; // check error

		if ( m_bCreate )
		{
			if (pName == m_strKey) return;

			CTexCoordManage::Add(pName);
			CTexCoordManage::Remove(m_strKey);

			m_strKey = pName;					
			pTexCoord = CTexCoordManage::GetpTexCoord(m_strKey);
		}
		else
		{

			m_bCreate = TRUE;
			m_strKey = pName;

			CTexCoordManage::Add(m_strKey);
			pTexCoord = CTexCoordManage::GetpTexCoord(m_strKey);
		}
	}

	float* Get()
	{
		return ( pTexCoord != NULL ) ? pTexCoord->GetTexCoord():NULL;
	}

};

