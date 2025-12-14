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
//	Class		CUseVertices
//
//	Function		CUseVertices.Use(const CString strFileName);
//	Function		CUseVertices.UnUse();
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//	User static Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class	CVerticesManage
//
//	Static Function CVerticesManage::StaticInitDeviceObject();
//	Static Function CVerticesManage::StaticDeleteDeviceObject();
//	Static Function CVerticesManage::StaticFinalCleanUp();
//
/////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////
// Private for code only ( not access )
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Class CVertices
/////////////////////////////////////////////////////////////////////

class CVertices : public CAbstract  
{
private:
	float* m_Vertices;
	int  m_nNumVertices;

	int  m_nNumber;

	//function to implement
	void _OneTime()
	{
		SAFE_DELETE_ARRAY( m_Vertices );	
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
			
			// Read Num Vertex
			fp.ReadString( str );
			m_nNumVertices = atoi( str );

			//TRACE("Start Vertex\n");
			//TRACE( "%d\n", m_NumVertices );

			m_Vertices = new float[m_nNumVertices*3];
			for( int i = 0; i < m_nNumVertices; i++ )
			{
				fp.ReadString( str );

				CString Str1 = String::Token( str, 1, " " );
				CString Str2 = String::Token( str, 2, " " );
				CString Str3 = String::Token( str, 3, " " );

				m_Vertices[ (3*i) + 0 ] = float(atof( Str1 ));
				m_Vertices[ (3*i) + 1 ] = float(atof( Str2 ));
				m_Vertices[ (3*i) + 2 ] = float(atof( Str3 ));

				//TRACE( "%f ,%f ,%f,\n",  m_pVertex[ (3*i) + 0 ], m_pVertex[ (3*i) + 1 ], m_pVertex[ (3*i) + 2 ] );
			}

			fp.Close();
		}

	}

	void _FinalClean()
	{
		//Do Delete data from "m_Vertices"
		//don't forget set m_Vertices to NULL if it is Pointer
		SAFE_DELETE_ARRAY( m_Vertices );
		m_nNumVertices = 0;

	}
	
	void _InitDevice()
	{
		//Do Create data from  member "m_strKey" to "m_Vertices"
	}

	void _DeleteDevice()
	{
		//Do Delete data from "m_Vertices"
		//don't forget set m_Vertices to NULL if it is Pointer
	}

public:
	CVertices(const CString& strName);
	virtual ~CVertices();

public:
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT FinalCleanup();

	int		DeleteVertices();
	BOOL	AddVertices();
	
	float* GetVertices() { return (m_nNumber>0)?m_Vertices:0; }
	int GetNumVertices() { return (m_nNumber>0)?m_nNumVertices:0; };
};

/////////////////////////////////////////////////////////////////////
// Class CVerticesManage
/////////////////////////////////////////////////////////////////////
class CVerticesManage 
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
	static float* Add( const CString& pName );
	static float* GetVertices( const CString& pName );
	static CVertices *	GetpVertices( const CString& pName );
	static void Remove( const CString& pName );

	friend class CUseVertices;

};



/////////////////////////////////////////////////////////////////////
// Class CUseVertices 
// Desc : User interface class
/////////////////////////////////////////////////////////////////////
class CUseVertices
{
public:
	CUseVertices() { m_bCreate = FALSE; pVertices = NULL; }
	CUseVertices( const CString pName ) { m_bCreate = FALSE; pVertices = NULL; Use(pName); }
	~CUseVertices() { UnUse(); }

private :
	CString m_strKey;
	BOOL m_bCreate;
	CVertices * pVertices;

public:

	void UnUse()
	{
		if ( m_bCreate )
		{
			m_bCreate = FALSE;
			CVerticesManage::Remove(m_strKey);
		}
		m_strKey.Empty();
		pVertices = NULL;
	}

	void Use(const CString& pName)
	{
		if (pName.IsEmpty()) return; // check error

		if ( m_bCreate )
		{
			if (pName == m_strKey) return;

			CVerticesManage::Add(pName);
			CVerticesManage::Remove(m_strKey);

			m_strKey = pName;					
			pVertices = CVerticesManage::GetpVertices(m_strKey);
		}
		else
		{

			m_bCreate = TRUE;
			m_strKey = pName;

			CVerticesManage::Add(m_strKey);
			pVertices = CVerticesManage::GetpVertices(m_strKey);
		}
	}

	float* Get()
	{
		return ( pVertices != NULL ) ? pVertices->GetVertices():NULL;
	}

	int GetNumVertices()
	{
		return ( pVertices != NULL ) ? pVertices->GetNumVertices():0;
	}

};