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

#include "Abtree.h"			// Header File For Use CAbtree
#include "Abstract.h"		// Header File For Use CAbstact
#include "GLGfx.h"          // Header File For Use CGLGfx  (check InitDeviceObjects promt )

#include "Animation.h"

class CAnimationSet
{
private:
	CAbTree  m_Tree;
	int      m_nNumAnimation;

	// Current Animation
	CUseAnimation *m_pCurrentAnimation;

public:
	CAnimationSet();
	virtual ~CAnimationSet();

	// Interface
	// Load and Destroy
	void LoadAnimationSet( const CString& strFileName );
	void DestroyAnimationSet();

	// SetAnimation
	BOOL     SetAnimation( const CString& strKey );
	BOOL     SetAnimation( int Index ); // Index Start at 0 

	// Get LocalCenter and Radius
	D3DXVECTOR3 GetLocalCenter(float fTime);
	float		GetRadius(float fTime);

	// Get NumFaces and NumVertices
	int GetNumFaces();
	int GetNumVertices();

	// Get Num Animation
	int GetNumAnimation();

	// Get CurrentAnimationMaxtime and AnimationMaxTime
	float   GetCurrentMaxTime();
	float   GetAnimationMaxtime( const CString& strAnimation );
	float   GetAnimationMaxtime( int Index );

	// Is Have Animation ?	
	BOOL    IsHaveAnimation( const CString& strAnimation );

	// GetStrCurrentAnimation and GetStrAnimation
	CString GetStrCurrentAnimation();
	CString GetStrAnimation( int Index );

	// Get CurrentAnimation and Animation
	CUseAnimation *GetCurrentAnimation();
	CUseAnimation *GetAnimation( const CString& strAnimation );
	CUseAnimation *GetAnimation( int Index );


	// Render and RayTest
	HRESULT  Render( float fTime );
    BOOL     RayTest( const D3DXVECTOR3& RayOrigin,
					  const D3DXVECTOR3& RayDirection, 
					  const D3DXMATRIX*  matWorld, 
					  float fTime,
					  BOOL bUseBoundSphereInRayTest,
					  // Out
					  int*       pFaceIndex = NULL,
					  CTriangle* pTriangle  = NULL,
					  FLOAT*	 pDistance  = NULL, 
					  FLOAT*	 pU         = NULL, 
					  FLOAT*     pV         = NULL ); 
};

