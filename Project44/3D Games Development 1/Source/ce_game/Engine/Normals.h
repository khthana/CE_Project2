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
//	Class		CUseNormals
//
//	Function		CUseNormals.Use(const CString& strFileName);
//	Function		CUseNormals.UnUse();
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//	User static Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class	CNormalsManage
//
//	Static Function CNormalsManage::StaticInitDeviceObject();
//	Static Function CNormalsManage::StaticDeleteDeviceObject();
//	Static Function CNormalsManage::StaticFinalCleanUp();
//
/////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////
// Private for code only ( not access )
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// Class CNormals
/////////////////////////////////////////////////////////////////////

class CNormalsAb : public CAbstract  
{
private:
	float *  m_Normals;
	int  m_nNumber;

	//function to implement
	void _OneTime()
	{
		//Do Create data from  member "m_strKey" to "m_Normals"
		SAFE_DELETE_ARRAY( m_Normals );	
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
			
			int nNumVertices = atoi( str );

			m_Normals = new float[nNumVertices*3];
			for( int i = 0; i < nNumVertices; i++ )
			{
				fp.ReadString( str );

				CString Str1 = String::Token( str, 1, " " );
				CString Str2 = String::Token( str, 2, " " );
				CString Str3 = String::Token( str, 3, " " );

				m_Normals[ (3*i) + 0 ] = float(atof( Str1 ));
				m_Normals[ (3*i) + 1 ] = float(atof( Str2 ));
				m_Normals[ (3*i) + 2 ] = float(atof( Str3 ));

				//TRACE( "%f ,%f ,%f,\n",  m_pVertex[ (3*i) + 0 ], m_pVertex[ (3*i) + 1 ], m_pVertex[ (3*i) + 2 ] );
			}

			fp.Close();
		}

	}

	void _FinalClean()
	{
		//Do Delete data from "m_Normals"
		//don't forget set m_Normals to NULL if it is Pointer
		SAFE_DELETE_ARRAY( m_Normals );

	}
	
	void _InitDevice()
	{
		//Do Create data from  member "m_strKey" to "m_Normals"
	}

	void _DeleteDevice()
	{
		//Do Delete data from "m_Normals"
		//don't forget set m_Normals to NULL if it is Pointer
	}

public:
	CNormalsAb(const CString& strName);
	virtual ~CNormalsAb();

public:
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT FinalCleanup();

	int		DeleteNormals();
	BOOL	AddNormals();
	
	float *  GetNormals() { return (m_nNumber>0)?m_Normals:0; }
};

/////////////////////////////////////////////////////////////////////
// Class CNormalsManage
/////////////////////////////////////////////////////////////////////
class CNormalsManage 
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
	static float *  Add( const CString& pName );
	static float *  GetNormals( const CString& pName );
	static CNormalsAb *	GetpNormals( const CString& pName );
	static void Remove( const CString& pName );

	friend class CUseNormals;

};



/////////////////////////////////////////////////////////////////////
// Class CUseNormals 
// Desc : User interface class
/////////////////////////////////////////////////////////////////////
class CUseNormals
{
public:
	CUseNormals() { m_bCreate = FALSE; pNormals = NULL; }
	CUseNormals( const CString& pName ) { m_bCreate = FALSE; pNormals = NULL; Use(pName); }
	~CUseNormals() { UnUse(); }

private :
	CString m_strKey;
	BOOL m_bCreate;
	CNormalsAb * pNormals;

public:

	void UnUse()
	{
		if ( m_bCreate )
		{
			m_bCreate = FALSE;
			CNormalsManage::Remove(m_strKey);
		}
		m_strKey.Empty();
		pNormals = NULL;
	}

	void Use(const CString& pName)
	{
		if (pName.IsEmpty()) return; // check error

		if ( m_bCreate )
		{
			if (pName == m_strKey) return;

			CNormalsManage::Add(pName);
			CNormalsManage::Remove(m_strKey);

			m_strKey = pName;					
			pNormals = CNormalsManage::GetpNormals(m_strKey);
		}
		else
		{

			m_bCreate = TRUE;
			m_strKey = pName;

			CNormalsManage::Add(m_strKey);
			pNormals = CNormalsManage::GetpNormals(m_strKey);
		}
	}

	float *  Get()
	{
		return ( pNormals != NULL ) ? pNormals->GetNormals():NULL;
	}
				 


};