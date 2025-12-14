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


#include "Triangle.h"
#include "CacheTriangle.h"
#include "Matrix.h"
#include "D3DX8.h"
#include "Vertices.h"
#include "Indices.h"
#include "Texcoord.h"
#include "Texture.h"
#include "VertexColor.h"
#include "Normals.h"

/////////////////////////////////////////////////////////////////////////////
//	User Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class		CUseStaticModelData
//
//	Function		CUseStaticModelData.Use(const CString strFileName);
//	Function		CUseStaticModelData.UnUse();
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//	User static Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class	CStaticModelDataManage
//
//	Static Function CStaticModelDataManage::StaticInitDeviceObject();
//	Static Function CStaticModelDataManage::StaticDeleteDeviceObject();
//	Static Function CStaticModelDataManage::StaticFinalCleanUp();
//
/////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////
// Private for code only ( not access )
/////////////////////////////////////////////////////////////////////////////

class CStaticModelData
{
private:
	// Bound Sphere Data
	D3DXVECTOR3 m_vCenter;
	float       m_fRadius;
	void        CalBoundSphere();

	//blenda
	BOOL		m_bIsBlend;   
	BOOL		m_bIsAlpha;
	BOOL		m_bIsCull;

	//blenda
	//for blend
	GLenum      m_sfactor;
	GLenum      m_dfactor;
	GLenum		m_func;
	GLclampf	m_fValuefunc;
	CString		m_strCullMode;


	GLenum		GetGLenum(const CString& strEnum);
private:
	unsigned int m_DisplayListID;	
	BOOL         m_bDisplayPrompt;

	void DisplayFn();

public:
	CUseVertices    m_Vertices;
	CUseIndices     m_Indices;
	CUseVertexColor m_VertexColor;
	CUseNormals		m_Normals;

	CUseTexture  *  m_pTexture;
	CUseTexCoord *  m_pTexCoord;

	int		m_nNumTexture;
	BOOL	m_bUseMultiTexture;

public:

	CStaticModelData()
		{ 
			m_bUseMultiTexture = FALSE;
			m_nNumTexture = 0;
			m_pTexture = NULL;
			m_pTexCoord = NULL;

			m_bDisplayPrompt = FALSE; 	
			m_vCenter = cs::v3Zero;
			m_fRadius = 0;
		}
	~CStaticModelData()
		{ 
			Clear();
		}

	HRESULT LoadModelFromFile   (  const char *strModelFileName );
	void Clear();

	void BuildDisplayList();
	void DestroyDisplayList();

	void Render();

	inline float		GetRadius() { return m_fRadius; }
	inline D3DXVECTOR3 GetCenter() { return m_vCenter; }
};

/////////////////////////////////////////////////////////////////////
// Class CStaticModelDataAb
/////////////////////////////////////////////////////////////////////

class CStaticModelDataAb : public CAbstract  
{
private:
	CStaticModelData * m_StaticModelData;
	int  m_nNumber;

	//function to implement
	void _OneTime()
	{
		//Do Create data from  member "m_strKey" to "m_StaticModelData"
		m_StaticModelData = new CStaticModelData;
		m_StaticModelData->LoadModelFromFile(m_strKey);
	}

	void _FinalClean()
	{
		//Do Delete data from "m_StaticModelData"
		//don't forget set m_StaticModelData to NULL if it is Pointer
		if ( m_StaticModelData != NULL )
		{
			m_StaticModelData->Clear();
			delete m_StaticModelData;
			m_StaticModelData = NULL;
		}
	}
	
	void _InitDevice()
	{
		//Do Create data from  member "m_strKey" to "m_StaticModelData"
		if ( m_StaticModelData != NULL )
		{
			m_StaticModelData->BuildDisplayList();
		}
	}

	void _DeleteDevice()
	{
		//Do Delete data from "m_StaticModelData"
		//don't forget set m_StaticModelData to NULL if it is Pointer
		if ( m_StaticModelData != NULL )
		{
			m_StaticModelData->DestroyDisplayList();
		}
	}

public:
	CStaticModelDataAb(const CString strName);
	virtual ~CStaticModelDataAb();

public:
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT FinalCleanup();

	int		DeleteStaticModelData();
	BOOL	AddStaticModelData();
	
	CStaticModelData * GetStaticModelData() { return (m_nNumber>0)?m_StaticModelData:0; }
};

/////////////////////////////////////////////////////////////////////
// Class CStaticModelDataManage
/////////////////////////////////////////////////////////////////////
class CStaticModelDataManage 
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
	static CStaticModelData * Add( const CString& pName );
	static CStaticModelData * GetStaticModelData( const CString& pName );
	static CStaticModelDataAb *	GetpStaticModelData( const CString& pName );
	static void Remove( const CString& pName );

	friend class CUseStaticModelData;

};



/////////////////////////////////////////////////////////////////////
// Class CUseStaticModelData 
// Desc : User interface class
/////////////////////////////////////////////////////////////////////
class CUseStaticModelData
{
public:
	CUseStaticModelData() { m_bCreate = FALSE; pStaticModelData = NULL; }
	CUseStaticModelData( const CString& pName ) { m_bCreate = FALSE; pStaticModelData = NULL; Use(pName); }
	~CUseStaticModelData() { UnUse(); }

private :
	CString m_strKey;
	BOOL m_bCreate;
	CStaticModelDataAb * pStaticModelData;

public:

	void UnUse()
	{
		if ( m_bCreate )
		{
			m_bCreate = FALSE;
			CStaticModelDataManage::Remove(m_strKey);
		}
		m_strKey.Empty();
		pStaticModelData = NULL;
	}

	void Use(const CString& pName)
	{
		if (pName.IsEmpty()) return; // check error

		if ( m_bCreate )
		{
			if (pName == m_strKey) return;

			CStaticModelDataManage::Add(pName);
			CStaticModelDataManage::Remove(m_strKey);

			m_strKey = pName;					
			pStaticModelData = CStaticModelDataManage::GetpStaticModelData(m_strKey);
		}
		else
		{

			m_bCreate = TRUE;
			m_strKey = pName;

			CStaticModelDataManage::Add(m_strKey);
			pStaticModelData = CStaticModelDataManage::GetpStaticModelData(m_strKey);
		}
	}

	CStaticModelData * GetpStaticModelData()
	{
		return ( pStaticModelData != NULL ) ? pStaticModelData->GetStaticModelData():NULL;
	}

	float * GetpVertices()
	{
		CStaticModelData * pData = GetpStaticModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_Vertices.Get();
	}

	int GetNumVertices()
	{
		CStaticModelData * pData = GetpStaticModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_Vertices.GetNumVertices();
	}

	unsigned int * GetpIndices()
	{
		CStaticModelData * pData = GetpStaticModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_Indices.Get();
	}

	int GetNumFaces()
	{
		CStaticModelData * pData = GetpStaticModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_Indices.GetNumFaces();
	}

	float * GetpTexCoord(int nIndex = 0)
	{
		CStaticModelData * pData = GetpStaticModelData();

		if ( pData == NULL ) return NULL;

		if ( ( nIndex < pData->m_nNumTexture ) && ( nIndex >= 0 ))
		{
			return pData->m_pTexCoord[nIndex].Get();
		}

		Log("CUseStaticModelData::GetpTexCoord Error Index out of range");

		return NULL;
	}

	GLuint GetpTexture(int nIndex = 0)
	{
		CStaticModelData * pData = GetpStaticModelData();

		if ( pData == NULL ) return NULL;

		if ( ( nIndex < pData->m_nNumTexture ) && ( nIndex >= 0 ))
		{
			return pData->m_pTexture[nIndex].Get();
		}

		Log("CUseStaticModelData::GetpTexture Error Index out of range");

		return NULL;
	}

	float * GetpVertexColor()
	{
		CStaticModelData * pData = GetpStaticModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_VertexColor.Get();
	}

	int GetNumVertexColor()
	{
		CStaticModelData * pData = GetpStaticModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_VertexColor.GetNumVertexColor();
	}


	void Render()
	{
		CStaticModelData * pData = GetpStaticModelData();

		if ( pData != NULL )
		{
			pData->Render();
		}
	}

	float GetRadius()
	{
		CStaticModelData * pData = GetpStaticModelData();

		if ( pData != NULL )
		{
			return pData->GetRadius();
		}
		return 0.0f;
	}

	D3DXVECTOR3 GetCenter()
	{
		CStaticModelData * pData = GetpStaticModelData();

		if ( pData != NULL )
		{
			return pData->GetCenter();
		}
		return cs::v3Zero;
	}


};

