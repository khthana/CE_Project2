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
#include "ModelData.h"

class CFrame
{
private:
	CUseModelData m_ModelData[2];

public:
	BOOL	   m_bBlendPosition;
	BOOL	   m_bBlendUV;

public:
	CFrame()
	{
		m_bBlendPosition = TRUE;
		m_bBlendUV = FALSE;
	}

	void LoadFrame(const char * strModelFileName1,const char * strModelFileName2)
	{
		m_ModelData[0].Use(strModelFileName1);
		m_ModelData[1].Use(strModelFileName2);
	}

	void Render(float fBPos,float fBUV);

	D3DXVECTOR3 GetLocalCenter(float fBPos);
	float		GetRadius(float fBPos);
	
	int GetNumFaces();
	int GetNumVertices();

	CUseModelData * GetpModelData() {return m_ModelData;}

	BOOL RayTest( 
				  const D3DXVECTOR3& RayOrigin,
				  const D3DXVECTOR3& RayDirection, 
				  const D3DXMATRIX*  matWorld, 
				  float fBPos,
				  BOOL bUseBoundSphereInRayTest,
				  // Out
				  int*       pFaceIndex = NULL,
				  CTriangle* pTriangle  = NULL,
				  FLOAT*	 pDistance  = NULL, 
				  FLOAT*	 pU         = NULL, 
				  FLOAT*     pV         = NULL );

};


class CAnimation : public CAbstract
{
private:
	CFrame * m_pFrame;
	float  * m_pTimeSlot;
	float   m_fMaxTime;
	int		m_nNumFrame;
	BOOL    m_bLoop;

	void	GenTime(	//In
							float fNowTime,
							//Out
							float * fTrueTime,
							float * fBlendfac,
							int	  * nNumSlot
					);


public:
	CAnimation();
	virtual ~CAnimation();

public:
	void LoadAnimationFromFile( const char * strFileName);
	void Clear();

	D3DXVECTOR3 GetLocalCenter(float fTime);
	float		GetRadius(float fTime);

	int GetNumFaces();
	int GetNumVertices();

	CUseModelData * GetpModelData(float fTime);

	float GetMaxTime() { return m_fMaxTime; }

	void Render(float fTime);
	BOOL RayTest( const D3DXVECTOR3& RayOrigin,
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
