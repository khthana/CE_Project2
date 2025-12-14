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
#include "afx.h"
#include "D3DX8.h"
#include "..\StdAfx.h"

class CTriangle : public CObject
{
public:
	CTriangle(void);
	//CTriangle( const CTriangle &Triangle );
	CTriangle( const D3DXVECTOR3& V0,
			   const D3DXVECTOR3& V1,
			   const D3DXVECTOR3& V2
			 );
	virtual ~CTriangle(void);

private:
	D3DXVECTOR3 m_V0;
	D3DXVECTOR3 m_V1;
	D3DXVECTOR3 m_V2;

public:
	void SetTriangle( const D3DXVECTOR3& V0,
					  const D3DXVECTOR3& V1,
					  const D3DXVECTOR3& V2 );

private:
	D3DXVECTOR3 m_VecNormal;

public:
	HRESULT CalNormalVec();

public:
	// RayTest Function
	BOOL RayTest( const  D3DXVECTOR3& vRayOrigin,
				  const  D3DXVECTOR3& vRayDirection,
				  D3DXMATRIX *MatWorld, // MatWorld
				  float* pDistance );	

	BOOL IsXZOn( float px,float pz );
	BOOL GetHigh( float px, float pz, float *pHigh );

	enum SelectMode 
	{
		ALL = 0, // Select Triangle if All Vertex is in Rect
		SOME	 // Select Triangle if Some Vertex is in Rect	
	};

	BOOL IsVertexInRectScreen( CRect Rect,
	                           const D3DXMATRIX *MatWorld,
							   const D3DXMATRIX *MatView,
							   const D3DXMATRIX *MatProj,
							   int   ScreenWidth,
							   int   ScreenHeight,
							   int   SelMode = CTriangle::ALL ); 
	
public:
	// Get
	inline D3DXVECTOR3 GetV0() const { return m_V0; };
	inline D3DXVECTOR3 GetV1() const { return m_V1; };
	inline D3DXVECTOR3 GetV2() const { return m_V2; };

	inline D3DXVECTOR3 GetNormalVec() const { return m_VecNormal; };

public:
	// Render
	HRESULT Render( const D3DXMATRIX *pMatWorld );
	HRESULT RenderNVec( const D3DXMATRIX *pMatWorld );
				
	void    GetPointFromUV( float U, float V,
							// Out
							float* pX, float* pY, float* pZ,
							const D3DXMATRIX *MatWorld );

public:
	float   GetMinX();
	float   GetMaxX();

	float   GetMinY();
	float   GetMaxY();

	float   GetMinZ();
	float   GetMaxZ();

};