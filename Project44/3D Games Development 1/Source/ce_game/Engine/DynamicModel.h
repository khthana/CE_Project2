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
#include "D3DX8.h"
#include "Model.h"
#include "AnimationSet.h"

//======================================================================
// Class : CDynamicModel
// Desc  : Class Static Model
//======================================================================
class CDynamicModel : public CModel
{
public:
	CDynamicModel(void);
	~CDynamicModel(void);

	// Start Override
public:

	// Bound Sphere Function
	D3DXVECTOR3 GetLocalCenter();
	D3DXVECTOR3 GetWorldCenter();
	float GetRadius();

public:
	// Get Function
	int GetNumFaces();
	int GetNumVertices();

	// Get Num Animation
	int GetNumAnimation();

	// Get Triangle
	BOOL GetTriangle( int FaceIndex, CTriangle* pTriangle );


public:
	// RayTest and GetHigh
	// if Hit then return FaceIndex
	// else return -1
	BOOL RayTest( const D3DXVECTOR3& RayOrigin,
				  const D3DXVECTOR3& RayDirection, 
				  // Out
				  int*       pFaceIndex = NULL,
				  CTriangle* pTriangle  = NULL,
				  FLOAT*	 pDistance  = NULL, 
				  FLOAT*	 pU         = NULL, 
				  FLOAT*     pV         = NULL );

public:
	// Load MAS and Clear MAS
	HRESULT LoadModel( const char *strFileName );
	void    ClearModel();

	// Process and Render
	virtual BOOL Process( float fElapseTime );
	HRESULT Render( const D3DXMATRIX* matCustom = NULL );

	// End Override
private:
	CAnimationSet    m_DModelData;
	float            m_fAnimationTime;
	float            m_fBlendAnimationTime;

private:
	float            m_fTS; // Animation Time Scale

public:
	// Get Animation Set Information
	
	// Get Max Time of Animation
	float   GetCurrentMaxTime();
	float   GetAnimationMaxtime( const CString& strAnimation );
	float   GetAnimationMaxtime( int Index );

	// Is Have Animation 
	BOOL    IsHaveAnimation( const CString& strAnimation );

	// TimeScale
	float   GetTimeScale() const; 

	// Get Current Animation Time
	float   GetCurrentAnimationTime() const;

	// Get String Current Animation
	CString GetStrCurrentAnimation();

	CUseAnimation *GetCurrentAnimation();
	CUseAnimation *GetAnimation( const CString& strAnimation );
	CUseAnimation *GetAnimation( int Index );

	CString        GetStrAnimation( int Index );

	// Set Function
	virtual void  SetTimeScale( float fTS );
	virtual BOOL  SetAnimation( const CString& strAction, 
								BOOL  bBlend           = FALSE, 
								float fFinishBlendTime = 1.0f/8.0f );

	virtual BOOL  SetAnimation( int   Index, 
								BOOL  bBlend           = FALSE, 
								float fFinishBlendTime = 1.0f/8.0f );


private:
	// Blending or not
	BOOL    m_bBlending;
	// Animation That want to blend to
	CString m_strBlendToAnimation;   

	// Animation blend factor 
	float   m_fAnimationBlendFactor; // Range from 0 to 1.0f

	// Time that use for finish blend between Animation in second
	float   m_fFinishBlendTime;      

public:
	BOOL	IsBlending() const { return m_bBlending; };
	CString GetStrBlendToAnimation() const { return m_strBlendToAnimation; };

};

//==================================================================================
class CSLandModel;
class CDObjModel : public CDynamicModel
{
public:
	CDObjModel();
	~CDObjModel();

protected:
	// Cache Triangle Use for GetHigh
	CCacheTriangle CacheTri;

public:
	BOOL LayOn( CSLandModel *pLandModel ); // pModel Not Modify
	void SetCacheSize( int nCacheSize );
	void    ClearModel();
};
