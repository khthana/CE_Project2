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
//	Class		CUseVertexColor
//
//	Function		CUseVertexColor.Use(const CString strFileName);
//	Function		CUseVertexColor.UnUse();
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//	User static Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class	CVertexColorManage
//
//	Static Function CVertexColorManage::StaticInitDeviceObject();
//	Static Function CVertexColorManage::StaticDeleteDeviceObject();
//	Static Function CVertexColorManage::StaticFinalCleanUp();
//
/////////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////////
// Private for code only ( not access )
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// Class CVertexColor
/////////////////////////////////////////////////////////////////////

class CVertexColor : public CAbstract  
{
private:
	int  m_nNumVertexColor;
	float* m_VertexColor;

	int  m_nNumber;

	//function to implement
	void _OneTime()
	{
		//Do Create data from  member "m_strKey" to "m_VertexColor"
		SAFE_DELETE_ARRAY( m_VertexColor );	
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
			m_nNumVertexColor = atoi( str );

			//TRACE("Start Vertex\n");
			//TRACE( "%d\n", m_NumVertices );

			m_VertexColor = new float[m_nNumVertexColor*3];
			for( int i = 0; i < m_nNumVertexColor; i++ )
			{
				fp.ReadString( str );
				CString Str1 = String::Token( str, 1, "(color) " );
				CString Str2 = String::Token( str, 2, "(color) " );
				CString Str3 = String::Token( str, 3, "(color) " );

				float R = float(atof( Str1 ));
				float G = float(atof( Str2 ));
				float B = float(atof( Str3 ));

				m_VertexColor[ (3*i) + 0 ] = R / 255.0f;
				m_VertexColor[ (3*i) + 1 ] = G / 255.0f;
				m_VertexColor[ (3*i) + 2 ] = B / 255.0f;

				//TRACE( "%f ,%f ,%f,\n",  m_VertexColor[ (3*i) + 0 ], m_VertexColor[ (3*i) + 1 ], m_VertexColor[ (3*i) + 2 ] );
			}

			fp.Close();
		}				
	}

	void _FinalClean()
	{
		//Do Delete data from "m_VertexColor"
		//don't forget set m_VertexColor to NULL if it is Pointer
		SAFE_DELETE_ARRAY( m_VertexColor );
	}
	
	void _InitDevice()
	{
		//Do Create data from  member "m_strKey" to "m_VertexColor"
	}

	void _DeleteDevice()
	{
		//Do Delete data from "m_VertexColor"
		//don't forget set m_VertexColor to NULL if it is Pointer
	}

public:
	CVertexColor(const CString& strName);
	virtual ~CVertexColor();

public:
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT FinalCleanup();

	int		DeleteVertexColor();
	BOOL	AddVertexColor();
	
	float* GetVertexColor() { return (m_nNumber>0)?m_VertexColor:NULL; }
	int GetNumVertexColor() { return (m_nNumber>0)?m_nNumVertexColor:0; };
};

/////////////////////////////////////////////////////////////////////
// Class CVertexColorManage
/////////////////////////////////////////////////////////////////////
class CVertexColorManage 
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
	static float* GetVertexColor( const CString& pName );
	static CVertexColor *	GetpVertexColor( const CString& pName );
	static void Remove( const CString& pName );

	friend class CUseVertexColor;

};



/////////////////////////////////////////////////////////////////////
// Class CUseVertexColor 
// Desc : User interface class
/////////////////////////////////////////////////////////////////////
class CUseVertexColor
{
public:
	CUseVertexColor() { m_bCreate = FALSE; pVertexColor = NULL; }
	CUseVertexColor( const CString pName ) { m_bCreate = FALSE; pVertexColor = NULL; Use(pName); }
	~CUseVertexColor() { UnUse(); }

private :
	CString m_strKey;
	BOOL m_bCreate;
	CVertexColor * pVertexColor;

public:

	void UnUse()
	{
		if ( m_bCreate )
		{
			m_bCreate = FALSE;
			CVertexColorManage::Remove(m_strKey);
		}
		m_strKey.Empty();
		pVertexColor = NULL;
	}

	void Use(const CString& pName)
	{
		if (pName.IsEmpty()) return; // check error

		if ( m_bCreate )
		{
			if (pName == m_strKey) return;

			CVertexColorManage::Add(pName);
			CVertexColorManage::Remove(m_strKey);

			m_strKey = pName;					
			pVertexColor = CVertexColorManage::GetpVertexColor(m_strKey);
		}
		else
		{

			m_bCreate = TRUE;
			m_strKey = pName;

			CVertexColorManage::Add(m_strKey);
			pVertexColor = CVertexColorManage::GetpVertexColor(m_strKey);
		}
	}

	float* Get()
	{
		return ( pVertexColor != NULL ) ? pVertexColor->GetVertexColor():NULL;
	}

	int GetNumVertexColor()
	{
		return ( pVertexColor != NULL ) ? pVertexColor->GetNumVertexColor():0;
	}

};


