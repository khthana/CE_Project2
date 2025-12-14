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

#include "Triangle.h"
#include "CacheTriangle.h"
#include "Matrix.h"
#include "D3DX8.h"
#include "Vertices.h"
#include "Indices.h"
#include "Texcoord.h"
#include "Texture.h"
#include "VertexColor.h"


/////////////////////////////////////////////////////////////////////////////
//	User Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class		CUseModelData
//
//	Function		CUseModelData.Use(const CString strFileName);
//	Function		CUseModelData.UnUse();
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//	User static Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class	CModelDataManage
//
//	Static Function CModelDataManage::StaticInitDeviceObject();
//	Static Function CModelDataManage::StaticDeleteDeviceObject();
//	Static Function CModelDataManage::StaticFinalCleanUp();
//
/////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////
// Private for code only ( not access )
/////////////////////////////////////////////////////////////////////////////

class CModelData
{
private:
	// Bound Sphere Data
	D3DXVECTOR3 m_vCenter;
	float       m_fRadius;
	void        CalBoundSphere();

public:
	CUseVertices    m_Vertices;
	CUseIndices     m_Indices;
	CUseTexCoord    m_TexCoord;
	CUseVertexColor m_VertexColor;
	CUseTexture     m_Texture;

public:
	CModelData() 
	{
		m_vCenter = cs::v3Zero;
		m_fRadius = 0;
	}

	HRESULT LoadModelFromFile   (  const char *strModelFileName );

	void Clear();
	void Render();

	inline float		GetRadius() { return m_fRadius; }
	inline D3DXVECTOR3 GetCenter() { return m_vCenter; }

};


/////////////////////////////////////////////////////////////////////
// Class CModelDataAb
/////////////////////////////////////////////////////////////////////

class CModelDataAb : public CAbstract  
{
private:
	CModelData * m_ModelData;
	int  m_nNumber;

	//function to implement
	void _OneTime()
	{
		//Do Create data from  member "m_strKey" to "m_ModelData"
		m_ModelData = new CModelData;
		m_ModelData->LoadModelFromFile(m_strKey);
	}

	void _FinalClean()
	{
		//Do Delete data from "m_ModelData"
		//don't forget set m_ModelData to NULL if it is Pointer
		if ( m_ModelData != NULL )
		{
			m_ModelData->Clear();
			delete m_ModelData;
			m_ModelData = NULL;
		}

	}
	
	void _InitDevice()
	{
		//Do Create data from  member "m_strKey" to "m_ModelData"
	}

	void _DeleteDevice()
	{
		//Do Delete data from "m_ModelData"
		//don't forget set m_ModelData to NULL if it is Pointer
	}

public:
	CModelDataAb( const CString& strName );
	virtual ~CModelDataAb();

public:
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT FinalCleanup();

	int		DeleteModelData();
	BOOL	AddModelData();
	
	CModelData * GetModelData() { return (m_nNumber>0)?m_ModelData:0; }
};

/////////////////////////////////////////////////////////////////////
// Class CModelDataManage
/////////////////////////////////////////////////////////////////////
class CModelDataManage 
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
	static CModelData * Add( const CString& pName);
	static CModelData * GetModelData( const CString& pName);
	static CModelDataAb *	GetpModelData( const CString& pName);
	static void Remove( const CString& pName );

	friend class CUseModelData;

};



/////////////////////////////////////////////////////////////////////
// Class CUseModelData 
// Desc : User interface class
/////////////////////////////////////////////////////////////////////
class CUseModelData
{
public:
	CUseModelData() { m_bCreate = FALSE; pModelData = NULL; }
	CUseModelData( const CString& pName ) { m_bCreate = FALSE; pModelData = NULL; Use(pName); }
	~CUseModelData() { UnUse(); }

private :
	CString m_strKey;
	BOOL m_bCreate;
	CModelDataAb * pModelData;

public:

	void UnUse()
	{
		if ( m_bCreate )
		{
			m_bCreate = FALSE;
			CModelDataManage::Remove(m_strKey);
		}
		m_strKey.Empty();
		pModelData = NULL;
	}

	void Use(const CString& pName)
	{
		if (pName.IsEmpty()) return; // check error

		if ( m_bCreate )
		{
			if (pName == m_strKey) return;

			CModelDataManage::Add(pName);
			CModelDataManage::Remove(m_strKey);

			m_strKey = pName;					
			pModelData = CModelDataManage::GetpModelData(m_strKey);
		}
		else
		{

			m_bCreate = TRUE;
			m_strKey = pName;

			CModelDataManage::Add(m_strKey);
			pModelData = CModelDataManage::GetpModelData(m_strKey);
		}
	}

	CModelData * GetpModelData()
	{
		return ( pModelData != NULL ) ? pModelData->GetModelData():NULL;
	}
	
	float * GetpVertices()
	{
		CModelData * pData = GetpModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_Vertices.Get();
	}

	int GetNumVertices()
	{
		CModelData * pData = GetpModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_Vertices.GetNumVertices();
	}

	unsigned int * GetpIndices()
	{
		CModelData * pData = GetpModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_Indices.Get();
	}

	int GetNumFaces()
	{
		CModelData * pData = GetpModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_Indices.GetNumFaces();
	}

	float * GetpTexCoord()
	{
		CModelData * pData = GetpModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_TexCoord.Get();
	}

	GLuint GetpTexture()
	{
		CModelData * pData = GetpModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_Texture.Get();
	}

	float * GetpVertexColor()
	{
		CModelData * pData = GetpModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_VertexColor.Get();
	}

	int GetNumVertexColor()
	{
		CModelData * pData = GetpModelData();
		if ( pData == NULL ) return NULL;
		return pData->m_VertexColor.GetNumVertexColor();
	}


	void Render()
	{
		CModelData * pData = GetpModelData();

		if ( pData != NULL )
		{
			pData->Render();
		}
	}

	float GetRadius()
	{
		CModelData * pData = GetpModelData();

		if ( pData != NULL )
		{
			return pData->GetRadius();
		}
		return 0.0f;
	}

	D3DXVECTOR3 GetCenter()
	{
		CModelData * pData = GetpModelData();

		if ( pData != NULL )
		{
			return pData->GetCenter();
		}
		return cs::v3Zero;
	}

};

