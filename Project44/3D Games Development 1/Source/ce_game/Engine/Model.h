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
#include "Triangle.h"
#include "CacheTriangle.h"
#include "Matrix.h"
#include "D3DX8.h"
#include "Vertices.h"
#include "Indices.h"
#include "Texcoord.h"
#include "Texture.h"
#include "VertexColor.h"
#include "PartDef.h"

//======================================================================
// Class : CStaticModel
// Desc  : Class Static Model
//======================================================================
class CModel : public CObject, public CMovMat
{
public:
	CModel(void);
	virtual ~CModel(void);

private:
	// Part Definition
	CUsePartDef     m_PartDef;

public:
	HRESULT UsePartDef ( const char *strFileName );
	HRESULT UnUsePartDef();

	inline CString GetPart( int FaceIndex ) 
		{ return m_PartDef.GetPart( FaceIndex ); };

protected:
	BOOL m_bUseBoundSphereInRayTest; // Default is TRUE

public:
	inline void SetUseBoundSphereInRayTest( BOOL bUse )
		{ m_bUseBoundSphereInRayTest = bUse; };


//========================Override Able Function==============================
public:
	virtual D3DXVECTOR3 GetLocalCenter() = 0;
	virtual D3DXVECTOR3 GetWorldCenter() = 0;
	virtual float GetRadius() = 0;

public:
	// RayTest and GetHigh
	// if Hit then return FaceIndex
	// else return -1
	virtual BOOL RayTest( const D3DXVECTOR3& RayOrigin,
						  const D3DXVECTOR3& RayDirection, 
						  // Out
				          int*       pFaceIndex = NULL,
					      CTriangle* pTriangle  = NULL,
					      FLOAT*	 pDistance  = NULL, 
					      FLOAT*	 pU         = NULL, 
					      FLOAT*     pV         = NULL ) = 0;
protected:
	BOOL    m_bModelPrompt;

public:
	inline BOOL IsModelPrompt() const { return m_bModelPrompt; };

public:
	virtual HRESULT LoadModel( const char *strFileName ) = 0;
	virtual void    ClearModel();
	virtual HRESULT Render( const D3DXMATRIX* matCustom =NULL ) = 0;
};


