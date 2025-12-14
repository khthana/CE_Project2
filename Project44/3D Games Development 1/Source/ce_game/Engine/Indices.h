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
//	Class		CUseIndices
//
//	Function		CUseIndices.Use(const CString strFileName);
//	Function		CUseIndices.UnUse();
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//	User static Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class	CIndicesManage
//
//	Static Function CIndicesManage::StaticInitDeviceObject();
//	Static Function CIndicesManage::StaticDeleteDeviceObject();
//	Static Function CIndicesManage::StaticFinalCleanUp();
//
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Private for code only ( not access )
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Class CIndices
/////////////////////////////////////////////////////////////////////

class CIndices : public CAbstract  
{
private:
	unsigned int* m_Indices;
	int  m_nNumFaces;

	int  m_nNumber;

	//function to implement
	void _OneTime()
	{
		//Do Create data from  member "m_strKey" to "m_Indices"
		SAFE_DELETE_ARRAY( m_Indices );	
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
			
			// Read Num Indices
			fp.ReadString( str );
			m_nNumFaces = atoi( str );

			m_Indices = new unsigned int[m_nNumFaces*3];

			//TRACE("Start Indice\n");
			//TRACE( "%d\n", m_NumFaces );

			for( int i = 0; i < m_nNumFaces; i++ )
			{
				fp.ReadString( str );
				CString Str1 = String::Token( str, 1, " " );
				CString Str2 = String::Token( str, 2, " " );
				CString Str3 = String::Token( str, 3, " " );

				m_Indices[ (3*i) + 0 ] = atoi( Str1 );
				m_Indices[ (3*i) + 1 ] = atoi( Str2 );
				m_Indices[ (3*i) + 2 ] = atoi( Str3 );
				//TRACE( "%d ,%d ,%d,\n",  m_pIndices[ (3*i) + 0 ], m_pIndices[ (3*i) + 1 ], m_pIndices[ (3*i) + 2 ] );
			}

			fp.Close();
		}
	}

	void _FinalClean()
	{
		//Do Delete data from "m_Indices"
		//don't forget set m_Indices to NULL if it is Pointer
		SAFE_DELETE_ARRAY( m_Indices );
		m_nNumFaces  = 0;

	}
	
	void _InitDevice()
	{
		//Do Create data from  member "m_strKey" to "m_Indices"
	}

	void _DeleteDevice()
	{
		//Do Delete data from "m_Indices"
		//don't forget set m_Indices to NULL if it is Pointer
	}

public:
	CIndices(const CString& strName);
	virtual ~CIndices();

public:
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT FinalCleanup();

	int		DeleteIndices();
	BOOL	AddIndices();
	
	unsigned int* GetIndices() { return (m_nNumber>0)?m_Indices:0; }
	int  GetNumFaces() { return (m_nNumber>0)?m_nNumFaces:0; };
};

/////////////////////////////////////////////////////////////////////
// Class CIndicesManage
/////////////////////////////////////////////////////////////////////
class CIndicesManage 
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
	static unsigned int* Add( const CString& pName);
	static unsigned int* GetIndices( const CString& pName);
	static CIndices *	GetpIndices( const CString& pName);
	static void Remove( const CString& pName );

	friend class CUseIndices;

};



/////////////////////////////////////////////////////////////////////
// Class CUseIndices 
// Desc : User interface class
/////////////////////////////////////////////////////////////////////
class CUseIndices
{
public:
	CUseIndices() { m_bCreate = FALSE; pIndices = NULL; }
	CUseIndices( const CString& pName ) { m_bCreate = FALSE; pIndices = NULL; Use(pName); }
	~CUseIndices() { UnUse(); }

private :
	CString m_strKey;
	BOOL m_bCreate;
	CIndices * pIndices;

public:

	void UnUse()
	{
		if ( m_bCreate )
		{
			m_bCreate = FALSE;
			CIndicesManage::Remove(m_strKey);
		}
		m_strKey.Empty();
		pIndices = NULL;
	}

	void Use(const CString& pName)
	{
		if (pName.IsEmpty()) return; // check error

		if ( m_bCreate )
		{
			if (pName == m_strKey) return;

			CIndicesManage::Add(pName);
			CIndicesManage::Remove(m_strKey);

			m_strKey = pName;					
			pIndices = CIndicesManage::GetpIndices(m_strKey);
		}
		else
		{

			m_bCreate = TRUE;
			m_strKey = pName;

			CIndicesManage::Add(m_strKey);
			pIndices = CIndicesManage::GetpIndices(m_strKey);
		}
	}

	unsigned int* Get()
	{
		return ( pIndices != NULL ) ? pIndices->GetIndices():NULL;
	}

	int GetNumFaces()
	{
		return ( pIndices != NULL ) ? pIndices->GetNumFaces():NULL;
	}

};


