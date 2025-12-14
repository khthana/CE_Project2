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

#include "..\stdafx.h"
#include <gl\gl.h>			// Header File For The OpenGL32 Library
#include <gl\glu.h>			// Header File For The GLu32 Library
#include <gl\glaux.h>		// Header File For The Glaux Library
#include "DynamicModel.h"
#include "Util.h"
#include "GLGfx.h"
#include "CacheTriangle.h"
#include "StaticModel.h"
#include "Framemodel.h"

//============= CDynamicModel Class =====================
CDynamicModel::CDynamicModel(void):
CModel()
{
	SetUseBoundSphereInRayTest( TRUE );
	
	m_fAnimationTime      = 0.0f;
	m_fBlendAnimationTime = 0.0f;

	m_fTS = 1.0f;
	m_bModelPrompt = FALSE;

	m_strBlendToAnimation   = "";
	m_fFinishBlendTime      = 1.0f/8.0f;
	m_fAnimationBlendFactor = 0.0f;
	m_bBlending             = FALSE;
}

CDynamicModel::~CDynamicModel (void)
{
	ClearModel();
}

// Load MAS
HRESULT CDynamicModel::LoadModel( const char *strFileName )
{
	ASSERT( !IsModelPrompt() );
	m_DModelData.LoadAnimationSet( strFileName );
	m_bModelPrompt = TRUE;
	return S_OK;
}

D3DXVECTOR3 CDynamicModel::GetLocalCenter()
{
	ASSERT( IsModelPrompt() );
	
	return m_DModelData.GetLocalCenter( GetCurrentAnimationTime()  );
}

D3DXVECTOR3 CDynamicModel::GetWorldCenter()
{
	ASSERT( IsModelPrompt() );
	
	D3DXVECTOR3 vWorldCenter;
	Vec3::MulMat( &vWorldCenter, 
		          &m_DModelData.GetLocalCenter( GetCurrentAnimationTime() ), 
				  CMovMat::GetpMat() );
	return vWorldCenter;
}

float CDynamicModel::GetRadius()
{
	ASSERT( IsModelPrompt() );

	return m_DModelData.GetRadius( GetCurrentAnimationTime()  );
}

// Get Function
int CDynamicModel::GetNumFaces()
{
	ASSERT( IsModelPrompt() );

	return m_DModelData.GetNumFaces();
}

int CDynamicModel::GetNumVertices()
{
	ASSERT( IsModelPrompt() );

	return m_DModelData.GetNumVertices();
}

int CDynamicModel::GetNumAnimation()
{
	ASSERT( IsModelPrompt() );
	return m_DModelData.GetNumAnimation();
}

void CDynamicModel::ClearModel()
{
	// ASSERT( IsModelPrompt() );
	m_DModelData.DestroyAnimationSet();
	m_bModelPrompt = FALSE;
	CModel::ClearModel();
}

BOOL CDynamicModel::Process( float fElapseTime )
{
	ASSERT( IsModelPrompt() );

	// Process Blend 
	if( m_bBlending )
	{
		// Add Blend Factor
		m_fAnimationBlendFactor += (fElapseTime / m_fFinishBlendTime);

		// Check Is Blend finish ?
		if( m_fAnimationBlendFactor >= 1.0f )
		{
			// If Blend Finish

			// Reset Blend Factor
			m_fAnimationBlendFactor = 0.0f;

			// Set Animation to 
			BOOL bOk = m_DModelData.SetAnimation( m_strBlendToAnimation );
			ASSERT( bOk );
			m_fAnimationTime      = 0.0f;
			m_bBlending		      = FALSE;
			m_strBlendToAnimation = "";
		}
	}
	else
	{
		m_fAnimationTime += m_fTS * fElapseTime;
	}

	return TRUE;
}

HRESULT CDynamicModel::Render( const D3DXMATRIX* matCustom )
{
	ASSERT( IsModelPrompt() );
	
	if( matCustom )
	{
		GLGfx::SetMatWorld( matCustom );
	}
	else
	{
		GLGfx::SetMatWorld( CMovMat::GetpMat() );
	}

	//====================================================================
	if( !m_bBlending )
	{
		// if not Blend
		m_DModelData.Render( GetCurrentAnimationTime()  );
	}
	else
	{
		// if Blend
		CUseAnimation *pAnimation1 = CDynamicModel::GetCurrentAnimation();
		CUseAnimation *pAnimation2 = CDynamicModel::GetAnimation( m_strBlendToAnimation );

		Tool::RenderBlendAnimation( // From
			                        pAnimation1, m_fBlendAnimationTime,
									// To
									pAnimation2, 0.0f, 
									m_fAnimationBlendFactor );		
	}

	return S_OK;
}

BOOL CDynamicModel::RayTest( const D3DXVECTOR3& RayOrigin,
							 const D3DXVECTOR3& RayDirection, 
						 	 // Out
							 int*       pFaceIndex,
							 CTriangle* pTriangle,
						 	 FLOAT* pDistance, 
	  						 FLOAT* pU, 
							 FLOAT* pV )
{
	ASSERT( IsModelPrompt() );

	if( !m_bBlending )
	{
		// If Not Blending, RayTest Normally
		return m_DModelData.RayTest( RayOrigin, 
									 RayDirection, 
									 CMovMat::GetpMat(),
									 GetCurrentAnimationTime() ,
									 m_bUseBoundSphereInRayTest,
									 
									 pFaceIndex,
									 pTriangle,
						 			 pDistance, 
	  								 pU, 
									 pV );
	}
	else
	{
		// if Blending
		CUseAnimation *pAnimation1  = CDynamicModel::GetCurrentAnimation();
		CUseAnimation *pAnimation2  = CDynamicModel::GetAnimation( m_strBlendToAnimation );
		CUseModelData *pModelData1  = pAnimation1->Get()->GetpModelData( m_fBlendAnimationTime );
		CUseModelData *pModelData2  = pAnimation2->Get()->GetpModelData( 0.0f );

		if( m_bUseBoundSphereInRayTest )
		{
			//===========================Use BoundSphere==============================
			// if Not In Sphere then return FALSE
			D3DXVECTOR3 vCenter0 = pModelData1->GetCenter();
			D3DXVECTOR3 vCenter1 = pModelData2->GetCenter();

			float fRadius = pModelData1->GetRadius();

			if ( fRadius <  pModelData2->GetRadius() )
			{
				fRadius = pModelData2->GetRadius();
			}
			
			if( !Ray::InSphere(  vCenter0.x + m_fAnimationBlendFactor * ( vCenter1.x - vCenter0.x ),
								 vCenter0.y + m_fAnimationBlendFactor * ( vCenter1.y - vCenter0.y ),
								 vCenter0.z + m_fAnimationBlendFactor * ( vCenter1.z - vCenter0.z ),
								 fRadius, 
								 CMovMat::GetpMat(), 
								 RayOrigin,
								 RayDirection ) )
			{
				return FALSE;
			}
		}
    
		float *pVertices1 = pModelData1->GetpVertices();
		float *pVertices2 = pModelData2->GetpVertices();
		
		return Ray::InBlendArfVertices ( RayOrigin,
								         RayDirection,
										 CMovMat::GetpMat(),
										 pVertices1,
										 pVertices2,
										 m_fAnimationBlendFactor,
										 pModelData1->GetpIndices(),
										 pModelData1->GetNumFaces(),

										 // Out
										 pFaceIndex,
										 pTriangle,
						 				 pDistance, 
	  									 pU, 
										 pV );
	}
	
	// UnReachable Code
	ASSERT( FALSE );
}

BOOL CDynamicModel::SetAnimation( const CString& strAction, 
								  BOOL  bBlend, 
								  float fFinishBlendTime )
{
	ASSERT( IsModelPrompt() );
	ASSERT( IsHaveAnimation( strAction ) );

	if( !m_bBlending )
	{
		// if Not Blend Now
		if( bBlend ) // if Blend then set Blend Variable
		{
			m_bBlending             = TRUE;
			m_fBlendAnimationTime   = GetCurrentAnimationTime();

			m_strBlendToAnimation   = strAction;
			m_fAnimationBlendFactor = 0.0f;
			m_fFinishBlendTime      = fFinishBlendTime;
			return TRUE;
		}
		else // if Not blend then Set Animation to strAction
		{
			BOOL bOk = m_DModelData.SetAnimation( strAction );
			ASSERT( bOk );
			m_fAnimationTime = 0.0f;
			return bOk;
		}
		ASSERT( FALSE );
	}
	//===========================================================
	else // if Blending
	{
		// if Not Blend Now
		if( bBlend ) // if Blend then set Blend Variable
		{
			// m_bBlending             = TRUE;
			m_fBlendAnimationTime   = GetCurrentAnimationTime();

			m_strBlendToAnimation   = strAction;
			m_fAnimationBlendFactor = 0.0f;
			m_fFinishBlendTime      = fFinishBlendTime;
			return TRUE;		
		}
		else // if Not blend
		{
			m_bBlending = FALSE;
			m_fAnimationBlendFactor = 0.0f;
			m_fFinishBlendTime      = 0.0f;

			BOOL bOk = m_DModelData.SetAnimation( strAction );
			ASSERT( bOk );
			m_fAnimationTime = 0.0f;
			return bOk;
		}
	}

	return FALSE;
}

BOOL CDynamicModel::GetTriangle( int FaceIndex, CTriangle* pTriangle )
{
	ASSERT( pTriangle );
	CUseModelData* pModelData = ((m_DModelData.GetCurrentAnimation())->Get())->GetpModelData(0);
	
	float        *pVertices = pModelData->GetpVertices();
	unsigned int *pIndices  = pModelData->GetpIndices();
	int           NumFaces  = pModelData->GetNumFaces();

	if( ( FaceIndex >= 0 ) && ( FaceIndex < NumFaces ) )
	{
		int i0 = pIndices[ (3*FaceIndex) + 0 ];
		int i1 = pIndices[ (3*FaceIndex) + 1 ];
		int i2 = pIndices[ (3*FaceIndex) + 2 ];			

		D3DXVECTOR3 V0;
		V0.x = pVertices[3*i0];
		V0.y = pVertices[3*i0+1];
		V0.z = pVertices[3*i0+2];

		D3DXVECTOR3 V1;
		V1.x = pVertices[3*i1];
		V1.y = pVertices[3*i1+1];
		V1.z = pVertices[3*i1+2];

		D3DXVECTOR3 V2;
		V2.x = pVertices[3*i2];
		V2.y = pVertices[3*i2+1];
		V2.z = pVertices[3*i2+2];

		pTriangle->SetTriangle( V0, V1, V2 );
		return TRUE;
	}

	return FALSE;
}

BOOL CDynamicModel::SetAnimation( int   Index, 
						          BOOL  bBlend, 
						          float fFinishBlendTime )
{
	ASSERT( IsModelPrompt() );

	if( !m_bBlending )
	{
		// if Not Blend Now
		if( bBlend ) // if Blend then set Blend Variable
		{
			m_bBlending             = TRUE;
			m_fBlendAnimationTime   = GetCurrentAnimationTime();

			m_strBlendToAnimation   = m_DModelData.GetStrAnimation( Index );
			m_fAnimationBlendFactor = 0.0f;
			m_fFinishBlendTime      = fFinishBlendTime;
			return TRUE;
		}
		else // if Not blend then Set Animation to strAction
		{
			BOOL bOk = m_DModelData.SetAnimation( Index );
			ASSERT( bOk );
			m_fAnimationTime = 0.0f;
			return bOk;
		}
		ASSERT( FALSE );
	}
	//===========================================================
	else // if Blending
	{
		// if Not Blend Now
		if( bBlend ) // if Blend then set Blend Variable
		{
			// m_bBlending             = TRUE;
			m_fBlendAnimationTime   = GetCurrentAnimationTime();

			m_strBlendToAnimation   = m_DModelData.GetStrAnimation( Index );
			m_fAnimationBlendFactor = 0.0f;
			m_fFinishBlendTime      = fFinishBlendTime;
			return TRUE;		
		}
		else // if Not blend
		{
			m_bBlending = FALSE;
			m_fAnimationBlendFactor = 0.0f;
			m_fFinishBlendTime      = 0.0f;

			BOOL bOk = m_DModelData.SetAnimation( Index );
			ASSERT( bOk );
			m_fAnimationTime = 0.0f;
			return bOk;
		}
	}


	// if Blend Now then return FALSE
	return FALSE;
}

// Get Function
float CDynamicModel::GetCurrentMaxTime()
{
	ASSERT( IsModelPrompt() );

	return m_DModelData.GetCurrentMaxTime(); 
}

CUseAnimation *CDynamicModel::GetCurrentAnimation()
{
	ASSERT( IsModelPrompt() );
	return m_DModelData.GetCurrentAnimation();
}

CUseAnimation *CDynamicModel::GetAnimation( const CString& strAnimation )
{
	ASSERT( IsModelPrompt() );
	return m_DModelData.GetAnimation( strAnimation );
}

CUseAnimation *CDynamicModel::GetAnimation( int Index )
{
	ASSERT( IsModelPrompt() );
	return m_DModelData.GetAnimation( Index );
}

float CDynamicModel::GetTimeScale() const 
{
	ASSERT( IsModelPrompt() );

	return m_fTS; 
};

float CDynamicModel::GetCurrentAnimationTime() const
{ 
	ASSERT( IsModelPrompt() );

	return m_fAnimationTime;
	// return m_fTS * m_fAnimationTime;
	// return m_fTS * ( Timer::GetLogicalTime() - m_fRefTime  ); 
};

void  CDynamicModel::SetTimeScale( float fTS )
{ 
	ASSERT( IsModelPrompt() );

	m_fTS = fTS; 
};
	
CString CDynamicModel::GetStrCurrentAnimation()
{
	ASSERT( IsModelPrompt() );

	return m_DModelData.GetStrCurrentAnimation();
};

float   CDynamicModel::GetAnimationMaxtime( const CString& strAnimation )
{
	ASSERT( IsModelPrompt() );

	return m_DModelData.GetAnimationMaxtime( strAnimation ); 
}

float   CDynamicModel::GetAnimationMaxtime( int Index )
{
	ASSERT( IsModelPrompt() );

	return m_DModelData.GetAnimationMaxtime( Index ); 
}

BOOL    CDynamicModel::IsHaveAnimation( const CString& strAnimation )
{
	ASSERT( IsModelPrompt() );

	return m_DModelData.IsHaveAnimation( strAnimation ); 
}

CString CDynamicModel::GetStrAnimation( int Index )
{
	ASSERT( IsModelPrompt() );
	
	return m_DModelData.GetStrAnimation( Index );
}


//=========================================================================================================
// CDObjModel Class
//=========================================================================================================
CDObjModel::CDObjModel():
CDynamicModel()
{
	SetCacheSize( 5 );
}

CDObjModel::~CDObjModel()
{
	ClearModel();
}

BOOL CDObjModel::LayOn( CSLandModel* ppLandModel )
{
	ASSERT( IsModelPrompt() );

	/*
	float px = CMovMat::Px();
	float pz = CMovMat::Pz();
	float High = 0.0f;

	if( ppLandModel->GetHigh1( px, pz, &High ) )
	{
		CMovMat::SetPosition( px, High, pz );
		return TRUE;
	}

	return FALSE;
	*/
	
	// Check in Cache first
	float High;
	if( !CacheTri.GetHigh1( CMovMat::Px(),
						    CMovMat::Pz(),
						    &High ) )
	{
		// If not found in cache, Search in earth
		CTriangle HitTriangle;
		if( ppLandModel->GetHigh1( CMovMat::Px(),
								  CMovMat::Pz(),
								  &High, NULL, &HitTriangle ) )
		{
			CMovMat::SetPosition( CMovMat::Px(),
								  High,
								  CMovMat::Pz() );
			CacheTri.Add( HitTriangle );
			return TRUE;
		}

		// If not found in both return false
		return FALSE;
	}
	else
	{
		CMovMat::SetPosition( CMovMat::Px(),
							  High,
							  CMovMat::Pz() );
	}

	// If in Cache Return True
	return TRUE;
}

void CDObjModel::SetCacheSize( int nCacheSize )
{
	ASSERT( nCacheSize >= 0 );
	CacheTri.SetCacheSize( nCacheSize );	
}

void CDObjModel::ClearModel()
{
	CacheTri.DestroyAll();
	CDynamicModel::ClearModel();
}